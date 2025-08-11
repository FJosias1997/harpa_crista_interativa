import 'package:flutter/widgets.dart';
import 'package:harpa_crista_app/pages/home_page.dart';
import 'package:harpa_crista_app/routes/app_routes.dart';

abstract class AppPages {
  static Map<String, Widget Function(BuildContext)> pages = {
    AppRoutes.home: (context) => const HomePage(),
  };
}
