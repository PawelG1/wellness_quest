// File: lib/services/mindfulness_service.dart

import '../models/mindfulness_activity.dart';

class MindfulnessService {
  List<MindfulnessActivity> getMindfulnessActivities() {
    return [
      MindfulnessActivity(
        title: '5-Minute Meditation',
        description: 'A short meditation session to help you relax.',
        duration: 5,
        points: 10,
      ),
      MindfulnessActivity(
        title: 'Breathing Exercise',
        description: 'A deep breathing exercise to reduce stress.',
        duration: 3,
        points: 5,
      ),
      MindfulnessActivity(
        title: 'Body Scan Meditation',
        description: 'A guided body scan to increase body awareness.',
        duration: 10,
        points: 15,
      ),
      MindfulnessActivity(
        title: 'Mindful Walking',
        description: 'Practice mindfulness while walking.',
        duration: 15,
        points: 20,
      ),
      MindfulnessActivity(
        title: 'Gratitude Journaling',
        description: 'Write down things you are grateful for.',
        duration: 5,
        points: 10,
      ),
      MindfulnessActivity(
        title: 'Progressive Muscle Relaxation',
        description: 'Relax your muscles progressively.',
        duration: 10,
        points: 15,
      ),
      MindfulnessActivity(
        title: 'Mindful Eating Exercise',
        description: 'Practice mindfulness during a meal.',
        duration: 20,
        points: 25,
      ),
      MindfulnessActivity(
        title: 'Visualization Practice',
        description: 'Visualize calming scenes.',
        duration: 7,
        points: 12,
      ),
      MindfulnessActivity(
        title: 'Loving-Kindness Meditation',
        description: 'Cultivate compassion and kindness.',
        duration: 8,
        points: 15,
      ),
      MindfulnessActivity(
        title: 'Mindful Listening Exercise',
        description: 'Practice active and mindful listening.',
        duration: 5,
        points: 10,
      ),
    ];
  }
}
