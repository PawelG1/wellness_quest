// File: lib/screens/mindfulness_activity_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellness_quest/models/mindfulness_activity.dart';
import 'package:wellness_quest/providers/user_provider.dart';
import 'package:wellness_quest/models/user_progress.dart';

class MindfulnessActivityScreen extends StatelessWidget {
  final MindfulnessActivity activity;

  MindfulnessActivityScreen({required this.activity});

  void _completeActivity(BuildContext context) {
    // Aktualizuj postępy użytkownika
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    UserProgress progress = userProvider.user!.progress;
    progress.mindfulnessPoints += activity.points;
    userProvider.updateProgress(progress);

    // Pokaż komunikat o przyznanych punktach
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Gratulacje! Otrzymałeś ${activity.points} punktów za ukończenie tej aktywności.'),
      ),
    );

    // Powrót do poprzedniego ekranu
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              activity.description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Czas trwania: ${activity.duration} minut',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () => _completeActivity(context),
              child: Text('Ukończ aktywność i otrzymaj punkty'),
            ),
          ],
        ),
      ),
    );
  }
}
