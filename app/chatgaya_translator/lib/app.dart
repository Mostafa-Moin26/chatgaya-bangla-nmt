import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/initial_binding.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'utils/theme/app_theme.dart';

class ChatgayaTranslatorApp extends StatelessWidget {
  const ChatgayaTranslatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Chatgaya Translator",

      initialBinding: InitialBinding(),

      initialRoute: AppRoutes.splash,

      getPages: AppPages.pages,

      theme: AppTheme.lightTheme,
    );
  }
}
