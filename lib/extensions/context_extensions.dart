import 'package:flutter/material.dart';

extension ContextEntension on BuildContext {
  goPush(Widget page) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => page));
  }

  ThemeData get theme => Theme.of(this);
}
