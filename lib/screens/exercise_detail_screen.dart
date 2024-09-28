// File: lib/screens/exercise_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/exercise.dart';
import '../providers/user_provider.dart';
import '../models/user_progress.dart';
import 'dart:async';

class ExerciseDetailScreen extends StatefulWidget {
  final Exercise exercise;

  ExerciseDetailScreen({required this.exercise});

  @override
  _ExerciseDetailScreenState createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  late Timer _timer;
  int _remainingTime = 0; // w sekundach
  bool _activityCompleted = false;

  @override
  void initState() {
    super.initState();
    // Ustaw czas trwania ćwiczenia - na przykład 5 minut
    _remainingTime = widget.exercise.duration * 60;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime <= 0) {
        _timer.cancel();
        setState(() {
          _activityCompleted = true;
        });
        _completeExercise();
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  void _completeExercise() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    if (userProvider.user != null) {
      UserProgress progress = userProvider.user!.progress;
      // Dodajemy punkty do odpowiedniej kategorii
      progress.fitnessPoints += widget.exercise.points;
      userProvider.updateProgress(progress);

      // Pokaż potwierdzenie
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Ćwiczenie ukończone'),
          content: Text(
              'Gratulacje! Otrzymałeś ${widget.exercise.points} punktów za wykonanie tego ćwiczenia.'),
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

  void _cancelExercise() {
    _timer.cancel();
    Navigator.pop(context);
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.name),
        actions: [
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: _cancelExercise,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _activityCompleted
            ? Center(child: Text('Ćwiczenie ukończone'))
            : Column(
                children: [
                  Icon(
                    widget.exercise.icon,
                    size: 100,
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.exercise.description,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Zalety: ${widget.exercise.benefits}',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Pozostały czas: ${_formatTime(_remainingTime)}',
                    style: TextStyle(fontSize: 24),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: _completeExercise,
                    child: Text('Oznacz jako ukończone'),
                  ),
                ],
              ),
      ),
    );
  }
}
