// File: lib/models/mindfulness_activity.dart

class MindfulnessActivity {
  final String title;
  final String description;
  final int duration; // in minutes
  final int points;

  MindfulnessActivity({
    required this.title,
    required this.description,
    required this.duration,
    required this.points,
  });
}
