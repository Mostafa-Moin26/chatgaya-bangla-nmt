import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controller/translator_controller.dart';

class InputCard extends GetView<TranslatorController> {
  const InputCard({super.key});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Input",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: controller.inputController,
            maxLines: 4,
            maxLength: 200,
            decoration: const InputDecoration(
              hintText: "Enter your text...",
              border: InputBorder.none,
              counterText: "",
            ),
          ),

          const SizedBox(height: 8),

          Obx(
            () => Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${controller.characterCount.value}/200",
                style: const TextStyle(color: AppColors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
