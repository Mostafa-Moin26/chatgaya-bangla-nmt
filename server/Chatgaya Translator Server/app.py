from contextlib import asynccontextmanager

from fastapi import FastAPI

from config import (
    DEVICE,
    CACHE_MODELS,
)

from translator import Translator
from schemas import TranslateRequest

# ==========================================================
# Start the server
# ==========================================================

# uvicorn app:app --host 0.0.0.0 --port 8000


# ==========================================================
# Translator Instance
# ==========================================================

translator = Translator()


# ==========================================================
# Startup / Shutdown
# ==========================================================

@asynccontextmanager
async def lifespan(app: FastAPI):

    print("=" * 60)
    print("Starting Chatgaya Translator API...")
    print(f"Device : {DEVICE}")
    print("=" * 60)

    # ==========================================
    # Optional Preload
    # ==========================================

    if CACHE_MODELS:

        print("Preloading Bangla → Chatgaya model...")

        translator.load_model("bn_to_ctg")

    print("API Started Successfully!")
    print("=" * 60)

    yield

    print("=" * 60)
    print("Shutting down API...")
    print("=" * 60)


# ==========================================================
# FastAPI
# ==========================================================

app = FastAPI(
    title="Chatgaya Translator API",
    version="2.0.0",
    lifespan=lifespan,
)

# ==========================================================
# Root
# ==========================================================


@app.get("/")
def root():

    return {
        "status": "running",
        "version": "2.0.0",
        "device": str(DEVICE),
        "cache_models": CACHE_MODELS,
    }


# ==========================================================
# Health
# ==========================================================


@app.get("/health")
def health():

    return {
        "success": True,
        "device": str(DEVICE),
        "cached_models": list(translator.models.keys()),
    }


# ==========================================================
# Translate
# ==========================================================


@app.post("/translate")
def translate(request: TranslateRequest):

    text = request.text.strip()

    if text == "":

        return {
            "success": True,
            "translation": "",
            "inference_time_ms": 0,
            "total_time_ms": 0,
        }

    try:

        return translator.translate(
            text=text,
            source=request.source,
            target=request.target,
        )

    except Exception as e:

        return {
            "success": False,
            "error": str(e),
        }