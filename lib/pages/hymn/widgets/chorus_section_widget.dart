import 'package:flutter/material.dart';
import 'package:harpa_crista_app/extensions/context_extensions.dart';

class ChorusSectionWidget extends StatelessWidget {
  final int index;
  final String chorus;
  const ChorusSectionWidget(this.index, this.chorus, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Coro',
          textAlign: TextAlign.center,
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('$chorus\n', textAlign: TextAlign.center),
      ],
    );
  }
}
