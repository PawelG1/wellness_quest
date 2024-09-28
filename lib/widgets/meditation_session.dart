// File: lib/widgets/meditation_session.dart

import 'package:flutter/material.dart';
import 'package:wellness_quest/utils/helpers.dart';

class MeditationSession extends StatefulWidget {
  final int duration; // in minutes

  MeditationSession({required this.duration});

  @override
  _MeditationSessionState createState() => _MeditationSessionState();
}

class _MeditationSessionState extends State<MeditationSession> {
  late int _remainingTime;
  late bool _isRunning;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.duration * 60; // Convert minutes to seconds
    _isRunning = true;
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (_isRunning && _remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
        _startTimer();
      } else if (_remainingTime == 0) {
        // Session complete
        _isRunning = false;
        // Award points or provide feedback
        _showCompletionDialog();
      }
    });
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Session Complete'),
        content: Text('Great job on completing your meditation session!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to previous screen
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _isRunning = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = formatTime(_remainingTime);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meditation Session'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formattedTime,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Focus on your breath and let go of any distractions.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            // Add visuals or guidance as needed
          ],
        ),
      ),
    );
  }
}
