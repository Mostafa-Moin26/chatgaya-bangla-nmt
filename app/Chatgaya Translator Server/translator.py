import gc
import time
import torch

from transformers import (
    MBart50TokenizerFast,
    MBartForConditionalGeneration,
)

from config import (
    DEVICE,
    BN_TO_CTG_MODEL_PATH,
    CTG_TO_BN_MODEL_PATH,
    MAX_NEW_TOKENS,
    NUM_BEAMS,
    EARLY_STOPPING,
    CACHE_MODELS,
)


class Translator:

    def __init__(self):

        self.models = {}
        self.tokenizers = {}

    # =====================================================
    # Get Model Path
    # =====================================================

    def _get_model_path(self, direction: str):

        if direction == "bn_to_ctg":
            return BN_TO_CTG_MODEL_PATH

        elif direction == "ctg_to_bn":
            return CTG_TO_BN_MODEL_PATH

        raise ValueError(f"Unknown direction : {direction}")

    # =====================================================
    # Release All Models
    # =====================================================

    def _release_models(self):

        self.models.clear()
        self.tokenizers.clear()

        gc.collect()

        if torch.cuda.is_available():
            torch.cuda.empty_cache()

    # =====================================================
    # Load Model
    # =====================================================

    def load_model(self, direction: str):

        # Already Loaded
        if direction in self.models:
            print(f"{direction} model loaded from cache.")
            return

        # Memory Saving Mode
        if not CACHE_MODELS:
            self._release_models()

        print("=" * 60)
        print(f"Loading {direction} model...")
        print("=" * 60)

        model_path = self._get_model_path(direction)

        tokenizer = MBart50TokenizerFast.from_pretrained(model_path)

        model = MBartForConditionalGeneration.from_pretrained(model_path)

        model.to(DEVICE)
        model.eval()

        self.models[direction] = model
        self.tokenizers[direction] = tokenizer

        print(f"{direction} model loaded successfully.")
        print("=" * 60)

    # =====================================================
    # Translate
    # =====================================================

    def translate(
        self,
        text: str,
        source: str,
        target: str,
    ):

        if source == "bn" and target == "ctg":
            direction = "bn_to_ctg"

        elif source == "ctg" and target == "bn":
            direction = "ctg_to_bn"

        else:
            raise ValueError(
                f"Unsupported translation direction: {source} -> {target}"
            )

        self.load_model(direction)

        model = self.models[direction]
        tokenizer = self.tokenizers[direction]

        api_start = time.perf_counter()

        tokenizer.src_lang = "bn_IN"

        inputs = tokenizer(
            text,
            return_tensors="pt",
            truncation=True,
            max_length=128,
        )

        inputs = {
            key: value.to(DEVICE)
            for key, value in inputs.items()
        }

        inference_start = time.perf_counter()

        with torch.no_grad():

            generated_tokens = model.generate(
                **inputs,
                max_new_tokens=MAX_NEW_TOKENS,
                num_beams=NUM_BEAMS,
                early_stopping=EARLY_STOPPING,
            )

        inference_end = time.perf_counter()

        translation = tokenizer.batch_decode(
            generated_tokens,
            skip_special_tokens=True,
        )[0]

        api_end = time.perf_counter()

        return {
            "success": True,
            "translation": translation,
            "inference_time_ms": round(
                (inference_end - inference_start) * 1000,
                2,
            ),
            "total_time_ms": round(
                (api_end - api_start) * 1000,
                2,
            ),
        }