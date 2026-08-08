import 'package:chatgaya_translator/features/translator/view/widgets/home_header.dart';
import 'package:chatgaya_translator/features/translator/view/widgets/input_card.dart';
import 'package:chatgaya_translator/features/translator/view/widgets/language_card.dart';
import 'package:chatgaya_translator/features/translator/view/widgets/output_card.dart';
import 'package:chatgaya_translator/features/translator/view/widgets/translate_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 10),

                HomeHeader(),

                SizedBox(height: 30),

                LanguageCard(),

                SizedBox(height: 24),

                InputCard(),

                SizedBox(height: 24),

                TranslateButton(),

                SizedBox(height: 24),

                OutputCard(),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
