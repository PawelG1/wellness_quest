
import 'package:flutter/material.dart';
import 'exercise.dart';

class FitnessActivity {
  final String title;
  final String description;
  final String benefits;
  final IconData icon;
  final List<Exercise> exercises; // Dodajemy listę ćwiczeń

  FitnessActivity({
    required this.title,
    required this.description,
    required this.benefits,
    required this.icon,
    required this.exercises,
  });
}
