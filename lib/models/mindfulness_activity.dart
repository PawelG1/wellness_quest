
import 'package:flutter/material.dart';

class MindfulnessActivity {
  final String title;
  final String description;
  final int duration; // in minutes
  final int points;
  final IconData icon; // Add icon field

  MindfulnessActivity({
    required this.title,
    required this.description,
    required this.duration,
    required this.points,
    required this.icon,
  });
}
