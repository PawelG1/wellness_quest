// File: lib/screens/mindfulness_activity_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/mindfulness_activity.dart';
import '../providers/user_provider.dart';
import '../models/user_progress.dart';
import 'dart:async';

class MindfulnessActivityScreen extends StatefulWidget {
  final MindfulnessActivity activity;

  MindfulnessActivityScreen({required this.activity});

  @override
  _MindfulnessActivityScreenState createState() =>
      _MindfulnessActivityScreenState();
}

class _MindfulnessActivityScreenState extends State<MindfulnessActivityScreen> {
  late Timer _timer;
  int _remainingTime = 0; // w sekundach
  bool _activityStarted = false; // Czy użytkownik rozpoczął aktywność

  void _startActivity() {
    setState(() {
      _activityStarted = true;
      _remainingTime = widget.activity.duration * 60;
    });
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime <= 0) {
        _timer.cancel();
        _completeActivity();
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  void _completeActivity() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    if (userProvider.user != null) {
      UserProgress progress = userProvider.user!.progress;
      progress.mindfulnessPoints += widget.activity.points;
      userProvider.updateProgress(progress);

      // Pokaż potwierdzenie
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Aktywność ukończona'),
          content: Text(
              'Gratulacje! Otrzymałeś ${widget.activity.points} punktów za ukończenie tej aktywności.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Zamknij dialog
                Navigator.pop(context); // Powrót do poprzedniego ekranu
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Obsługa błędu
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Błąd: Nie udało się zaktualizować postępów.'),
        ),
      );
    }
  }

  void _cancelActivity() {
    if (_activityStarted) {
      _timer.cancel();
    }
    Navigator.pop(context);
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    if (_activityStarted) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.activity.title),
        actions: [
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: _cancelActivity,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: !_activityStarted
            ? Column(
                children: [
                  Icon(
                    widget.activity.icon,
                    size: 100,
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.activity.description,
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: _startActivity,
                    child: Text('Rozpocznij aktywność'),
                  ),
                ],
              )
            : Column(
                children: [
                  Text(
                    'Czas pozostały: ${_formatTime(_remainingTime)}',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Wykonuj aktywność...',
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: _completeActivity,
                    child: Text('Oznacz jako ukończone'),
                  ),
                ],
              ),
      ),
    );
  }
}
