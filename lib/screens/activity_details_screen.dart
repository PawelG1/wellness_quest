// File: lib/screens/activity_details_screen.dart

import 'package:flutter/material.dart';
import '../models/exercise.dart';
import 'exercise_detail_screen.dart';

class ActivityDetailsScreen extends StatelessWidget {
  final String activityTitle;
  final List<Exercise> exercises;

  ActivityDetailsScreen({
    required this.activityTitle,
    required this.exercises,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(activityTitle),
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          Exercise exercise = exercises[index];
          return Card(
            child: ListTile(
              leading: Icon(exercise.icon, size: 40),
              title: Text(exercise.name), // Upewnij się, że 'name' jest po polsku
              subtitle: Text(exercise.description), // Upewnij się, że 'description' jest po polsku
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExerciseDetailScreen(
                      exercise: exercise,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
