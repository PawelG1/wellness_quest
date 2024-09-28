// File: lib/screens/mindfulness_screen.dart

import 'package:flutter/material.dart';
import '../models/mindfulness_activity.dart';
import '../services/mindfulness_service.dart';
import 'mindfulness_activity_screen.dart';

class MindfulnessScreen extends StatelessWidget {
  final List<MindfulnessActivity> activities =
      MindfulnessService().getMindfulnessActivities();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mindfulness Activities'),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          MindfulnessActivity activity = activities[index];
          return ListTile(
            leading: Icon(activity.icon, size: 40),
            title: Text(activity.title),
            subtitle: Text(activity.description),
            trailing: Text('${activity.duration} min'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MindfulnessActivityScreen(
                    activity: activity,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
