import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controller/language_type.dart';
import '../../controller/translator_controller.dart';

class LanguageCard extends GetView<TranslatorController> {
  const LanguageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isBnToCtg = controller.language.value == LanguageType.bnToCtg;

      return Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.radius),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Expanded(
              child: _LanguageItem(
                icon: Icons.language,
                title: isBnToCtg ? "Standard Bangla" : "Chatgaya",
              ),
            ),

            const SizedBox(width: 12),

            InkWell(
              onTap: controller.swapLanguage,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: .1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.swap_horiz_rounded,
                  color: AppColors.primary,
                  size: 30,
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: _LanguageItem(
                icon: Icons.translate_rounded,
                title: isBnToCtg ? "Chatgaya" : "Standard Bangla",
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _LanguageItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _LanguageItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.primary, size: 28),

        const SizedBox(height: 10),

        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
