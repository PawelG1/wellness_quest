// File: lib/widgets/progress_bar.dart

import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  ProgressBar({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double progress = (value % 100) / 100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: $value Punktów',
          style: Theme.of(context).textTheme.bodyLarge, // Zmieniono z 'bodyText1'
        ),
        SizedBox(height: 5),
        LinearProgressIndicator(
          value: progress,
          color: color,
          backgroundColor: color.withOpacity(0.3),
          minHeight: 10,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
