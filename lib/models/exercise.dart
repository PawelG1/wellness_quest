// File: lib/models/exercise.dart

import 'package:flutter/material.dart';

class Exercise {
  final String name;
  final String description;
  final String benefits;
  final IconData icon;
  final int points; 
  final int duration;
  // Dodane pole

  Exercise({
    required this.name,
    required this.description,
    required this.benefits,
    required this.icon,
    required this.points,
    required this.duration,
  });
}
