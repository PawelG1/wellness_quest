// File: lib/models/fluid_intake.dart

import 'package:flutter/material.dart';

class FluidIntake {
  final DateTime date;
  final int amount; // Ilość spożytych płynów w mililitrach (ml)

  FluidIntake({
    required this.date,
    required this.amount,
  });
}
