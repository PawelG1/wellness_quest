// File: lib/screens/plan_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellness_quest/models/wellness_plan.dart';
import 'package:wellness_quest/providers/user_provider.dart';
import 'package:wellness_quest/services/plan_generator.dart';

class PlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final preferences = userProvider.user?.preferences;

    if (preferences == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Your Personalized Plan'),
        ),
        body: Center(
          child: Text('No user preferences found.'),
        ),
      );
    }

    PlanGenerator planGenerator = PlanGenerator(preferences);
    WellnessPlan plan = planGenerator.generatePlan();

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Personalized Plan'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text('Fitness Activities:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...plan.fitnessActivities.map((activity) => ListTile(
                title: Text(activity),
                onTap: () {
                  Navigator.pushNamed(context, '/activity', arguments: activity);
                },
              )),
          SizedBox(height: 20),
          Text('Mental Health Activities:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...plan.mentalHealthActivities.map((activity) => ListTile(
                title: Text(activity),
                onTap: () {
                  Navigator.pushNamed(context, '/activity', arguments: activity);
                },
              )),
          SizedBox(height: 20),
          Text('Nutrition Guidelines:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ...plan.nutritionGuidelines.map((guideline) => ListTile(
                title: Text(guideline),
              )),
        ],
      ),
    );
  }
}
