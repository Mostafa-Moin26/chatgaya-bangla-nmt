class TranslationResponseModel {
  final bool success;
  final String translation;
  final double inferenceTimeMs;
  final double totalTimeMs;

  const TranslationResponseModel({
    required this.success,
    required this.translation,
    required this.inferenceTimeMs,
    required this.totalTimeMs,
  });

  factory TranslationResponseModel.fromJson(Map<String, dynamic> json) {
    return TranslationResponseModel(
      success: json["success"] ?? false,
      translation: json["translation"] ?? "",
      inferenceTimeMs: (json["inference_time_ms"] ?? 0).toDouble(),
      totalTimeMs: (json["total_time_ms"] ?? 0).toDouble(),
    );
  }
}
