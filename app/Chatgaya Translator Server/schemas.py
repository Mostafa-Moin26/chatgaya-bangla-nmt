from pydantic import BaseModel


# ==========================================================
# Request Schema
# ==========================================================

class TranslateRequest(BaseModel):
    text: str
    source: str
    target: str


# ==========================================================
# Success Response
# ==========================================================

class TranslateResponse(BaseModel):
    success: bool
    translation: str
    inference_time_ms: float
    total_time_ms: float


# ==========================================================
# Error Response
# ==========================================================

class ErrorResponse(BaseModel):
    success: bool
    error: str