// File: lib/screens/progress_dashboard.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user_progress.dart';
import '../providers/user_provider.dart';
import '../widgets/progress_bar.dart';

class ProgressDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProgress = Provider.of<UserProvider>(context).user?.progress;

    if (userProgress == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Twoje Postępy'),
        ),
        body: Center(
          child: Text('Brak danych o postępach.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Twoje Postępy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProgressBar(
              label: 'Fitness',
              value: userProgress.fitnessPoints,
              color: Colors.blue, // Dodano kolor
            ),
            ProgressBar(
              label: 'Mindfulness',
              value: userProgress.mindfulnessPoints,
              color: Colors.purple, // Dodano kolor
            ),
            ProgressBar(
              label: 'Nawodnienie',
              value: userProgress.hydrationPoints,
              color: Colors.orange, // Dodano kolor
            ),
          ],
        ),
      ),
    );
  }
}
