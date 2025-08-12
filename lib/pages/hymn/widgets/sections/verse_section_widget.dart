import 'package:flutter/material.dart';
import 'package:harpa_crista_app/extensions/context_extensions.dart';

class VerseSectionWidget extends StatelessWidget {
  final int index;
  final String value;

  const VerseSectionWidget(this.index, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Verso ${index + 1}',
          textAlign: TextAlign.center,
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('$value\n', textAlign: TextAlign.center),
      ],
    );
  }
}
