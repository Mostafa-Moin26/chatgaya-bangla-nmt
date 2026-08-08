import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Chatgaya Translator",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        SizedBox(height: 6),
        Text(
          "Standard Bangla ↔ Chatgaya",
          style: TextStyle(fontSize: 15, color: AppColors.grey),
        ),
      ],
    );
  }
}
