import 'dart:convert';

import 'package:http/http.dart' as http;

import '../data/models/translation_response_model.dart';

class TranslatorService {
  TranslatorService._();

  /// Emulator
  // static const String baseUrl = "http://10.0.2.2:8000";

  /// Real Device
  static const String baseUrl = "http://10.229.168.198:8000";

  static Future<TranslationResponseModel> translate({
    required String text,
    required String source,
    required String target,
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse("$baseUrl/translate"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({
              "text": text,
              "source": source,
              "target": target,
            }),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode != 200) {
        throw Exception("Server Error (${response.statusCode})");
      }

      final data = jsonDecode(response.body);

      if (data["success"] != true) {
        throw Exception(data["error"] ?? "Translation Failed");
      }

      return TranslationResponseModel.fromJson(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
