import 'package:flutter/material.dart';
import 'package:harpa_crista_app/routes/app_pages.dart';
import 'package:harpa_crista_app/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routes: AppPages.pages,
    );
  }
}
