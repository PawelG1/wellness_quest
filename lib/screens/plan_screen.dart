// File: lib/screens/plan_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/wellness_plan.dart';
import '../models/fitness_activity.dart';
import '../models/mental_health_activity.dart';
import '../providers/user_provider.dart';
import '../services/plan_generator.dart';
import 'activity_details_screen.dart';

class PlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final preferences = userProvider.user?.preferences;

    if (preferences == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Twój Spersonalizowany Plan'),
        ),
        body: Center(
          child: Text('Brak danych preferencji użytkownika.'),
        ),
      );
    }

    PlanGenerator planGenerator = PlanGenerator(preferences);
    WellnessPlan plan = planGenerator.generatePlan();

    return Scaffold(
      appBar: AppBar(
        title: Text('Twój Spersonalizowany Plan'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text('Aktywności Fitness:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...plan.fitnessActivities.map((activity) => Card(
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
                          // Usuń parametr isFromPlan
                        ),
                      ),
                    );
                  },
                ),
              )),
          SizedBox(height: 20),
          Text('Aktywności dla Zdrowia Psychicznego:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...plan.mentalHealthActivities.map((activity) => Card(
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
                          // Usuń parametr isFromPlan
                        ),
                      ),
                    );
                  },
                ),
              )),
          SizedBox(height: 20),
          Text('Wytyczne Żywieniowe:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...plan.nutritionGuidelines.map((guideline) => ListTile(
                title: Text(guideline),
              )),
        ],
      ),
    );
  }
}
