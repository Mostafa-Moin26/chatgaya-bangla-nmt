import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Chatgaya Translator",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 6),

        Text(
          "Standard Bangla ↔ Chatgaya",
          style: TextStyle(color: AppColors.grey),
        ),
      ],
    );
  }
}
