from pathlib import Path
import torch

# ==========================================================
# Project Directory
# ==========================================================

BASE_DIR = Path(__file__).resolve().parent

# ==========================================================
# Model Paths
# ==========================================================

BN_TO_CTG_MODEL_PATH = BASE_DIR / "models" / "bn_to_ctg"

CTG_TO_BN_MODEL_PATH = BASE_DIR / "models" / "ctg_to_bn"

# ==========================================================
# Device
# ==========================================================

DEVICE = torch.device(
    "cuda" if torch.cuda.is_available() else "cpu"
)

# ==========================================================
# Generation Parameters
# ==========================================================

MAX_NEW_TOKENS = 64

NUM_BEAMS = 2

EARLY_STOPPING = True

# ==========================================================
# Cache Settings
# ==========================================================

CACHE_MODELS = True