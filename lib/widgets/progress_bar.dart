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
    return Column(
      children: [
        Text('$label: $value Points'),
        SizedBox(height: 5),
        LinearProgressIndicator(
          value: (value % 100) / 100,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
