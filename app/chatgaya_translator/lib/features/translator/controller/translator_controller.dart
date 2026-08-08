import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../service/translator_service.dart';
import 'language_type.dart';

class TranslatorController extends GetxController {
  /// ==========================================================
  /// Controllers
  /// ==========================================================

  final TextEditingController inputController = TextEditingController();

  /// ==========================================================
  /// State
  /// ==========================================================

  final translatedText = ''.obs;

  final isLoading = false.obs;

  final language = LanguageType.bnToCtg.obs;

  final characterCount = 0.obs;

  /// API Performance

  final inferenceTimeMs = 0.0.obs;

  final totalTimeMs = 0.0.obs;

  /// ==========================================================
  /// Init
  /// ==========================================================

  @override
  void onInit() {
    super.onInit();

    inputController.addListener(() {
      characterCount.value = inputController.text.length;
    });
  }

  /// ==========================================================
  /// Swap Language
  /// ==========================================================

  void swapLanguage() {
    if (language.value == LanguageType.bnToCtg) {
      language.value = LanguageType.ctgToBn;
    } else {
      language.value = LanguageType.bnToCtg;
    }

    inputController.clear();

    translatedText.value = "";

    inferenceTimeMs.value = 0;

    totalTimeMs.value = 0;
  }

  /// ==========================================================
  /// Translate
  /// ==========================================================

  Future<void> translate() async {
    final text = inputController.text.trim();

    if (text.isEmpty) {
      Get.snackbar(
        "Empty Text",
        "Please enter some text.",
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      isLoading.value = true;

      final source = language.value == LanguageType.bnToCtg ? "bn" : "ctg";

      final target = language.value == LanguageType.bnToCtg ? "ctg" : "bn";

      final result = await TranslatorService.translate(
        text: text,
        source: source,
        target: target,
      );

      translatedText.value = result.translation;

      inferenceTimeMs.value = result.inferenceTimeMs;

      totalTimeMs.value = result.totalTimeMs;
    } catch (e) {
      Get.snackbar(
        "Translation Failed",
        e.toString().replaceFirst("Exception: ", ""),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// ==========================================================
  /// Copy Translation
  /// ==========================================================

  Future<void> copyTranslation() async {
    if (translatedText.value.isEmpty) return;

    await Clipboard.setData(ClipboardData(text: translatedText.value));

    Get.snackbar(
      "Copied",
      "Translation copied successfully",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  /// ==========================================================
  /// Clear
  /// ==========================================================

  void clear() {
    inputController.clear();

    translatedText.value = "";

    inferenceTimeMs.value = 0;

    totalTimeMs.value = 0;
  }

  /// ==========================================================
  /// Dispose
  /// ==========================================================

  @override
  void onClose() {
    inputController.dispose();
    super.onClose();
  }
}
