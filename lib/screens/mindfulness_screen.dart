// File: lib/screens/mindfulness_screen.dart

import 'package:flutter/material.dart';
import 'package:wellness_quest/widgets/meditation_session.dart';

class MindfulnessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List of mindfulness activities
    return Scaffold(
      appBar: AppBar(
        title: Text('Mindfulness Activities'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('5-Minute Meditation'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MeditationSession(duration: 5),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Breathing Exercise'),
            onTap: () {
              // Navigate to breathing exercise screen
            },
          ),
          // Add more activities
        ],
      ),
    );
  }
}
