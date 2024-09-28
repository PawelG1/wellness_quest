// File: lib/screens/fitness_activities_screen.dart

import 'package:flutter/material.dart';
import '../models/fitness_activity.dart';
import '../services/fitness_service.dart';
import 'activity_details_screen.dart';

class FitnessActivitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fitnessActivities = FitnessService().getFitnessActivities();

    return Scaffold(
      appBar: AppBar(
        title: Text('Aktywności Fitness'),
      ),
      body: ListView.builder(
        itemCount: fitnessActivities.length,
        itemBuilder: (context, index) {
          FitnessActivity activity = fitnessActivities[index];
          return Card(
            child: ListTile(
              leading: Icon(activity.icon, size: 40),
              title: Text(activity.title),
              subtitle: Text(activity.description),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActivityDetailsScreen(
                      activityTitle: activity.title,
                      exercises: activity.exercises,
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
