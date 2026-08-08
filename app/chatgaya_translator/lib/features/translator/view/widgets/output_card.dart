import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controller/translator_controller.dart';

class OutputCard extends GetView<TranslatorController> {
  const OutputCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(color: AppColors.border),
      ),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Output",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),

            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              constraints: const BoxConstraints(minHeight: 140),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                controller.translatedText.value.isEmpty
                    ? "Translation will appear here..."
                    : controller.translatedText.value,
                style: TextStyle(
                  fontSize: 16,
                  color: controller.translatedText.value.isEmpty
                      ? Colors.grey
                      : Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Align(
              alignment: Alignment.centerRight,
              child: FilledButton.icon(
                onPressed: controller.translatedText.value.isEmpty
                    ? null
                    : controller.copyTranslation,
                icon: const Icon(Icons.copy),
                label: const Text("Copy"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
