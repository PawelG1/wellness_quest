// File: lib/widgets/progress_bar.dart

import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final String label;
  final int value;

  ProgressBar({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    double progress = (value % 100) / 100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$label: $value Punktów'),
        SizedBox(height: 5),
        LinearProgressIndicator(
          value: progress,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
