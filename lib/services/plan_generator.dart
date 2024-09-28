// File: lib/services/plan_generator.dart

import 'package:wellness_quest/models/user_preferences.dart';
import 'package:wellness_quest/models/wellness_plan.dart';

class PlanGenerator {
  UserPreferences preferences;

  PlanGenerator(this.preferences);

  WellnessPlan generatePlan() {
    List<String> fitnessActivities = _generateFitnessActivities();
    List<String> mentalHealthActivities = _generateMentalHealthActivities();
    List<String> nutritionGuidelines = _generateNutritionGuidelines();

    return WellnessPlan(
      fitnessActivities: fitnessActivities,
      mentalHealthActivities: mentalHealthActivities,
      nutritionGuidelines: nutritionGuidelines,
    );
  }

  List<String> _generateFitnessActivities() {
    List<String> activities = [];

    if (preferences.fitnessGoals.contains('Build Muscle')) {
      activities.addAll(['Strength Training', 'Weight Lifting']);
    }
    if (preferences.fitnessGoals.contains('Lose Weight')) {
      activities.addAll(['Cardio Workouts', 'HIIT Sessions']);
    }
    if (preferences.fitnessGoals.contains('Improve Flexibility')) {
      activities.add('Yoga');
    }
    if (preferences.fitnessGoals.contains('Increase Stamina')) {
      activities.add('Endurance Running');
    }

    return activities;
  }

  List<String> _generateMentalHealthActivities() {
    List<String> activities = [];

    if (preferences.mentalHealthGoals.contains('Reduce Stress')) {
      activities.addAll(['Meditation', 'Breathwork']);
    }
    if (preferences.mentalHealthGoals.contains('Improve Focus')) {
      activities.add('Mindfulness Exercises');
    }
    if (preferences.mentalHealthGoals.contains('Enhance Sleep Quality')) {
      activities.add('Sleep Hygiene Practices');
    }

    return activities;
  }

  List<String> _generateNutritionGuidelines() {
    List<String> guidelines = [];

    if (preferences.dietaryRestrictions.contains('Vegan')) {
      guidelines.add('Follow a plant-based diet plan.');
    }
    if (preferences.dietaryRestrictions.contains('Gluten-Free')) {
      guidelines.add('Avoid gluten-containing foods.');
    }
    if (preferences.dietaryRestrictions.contains('Keto')) {
      guidelines.add('Follow a low-carb, high-fat diet.');
    }
    // Add more conditions as needed

    if (guidelines.isEmpty) {
      guidelines.add(
          'Follow a balanced diet rich in fruits, vegetables, lean proteins, and whole grains.');
    }

    return guidelines;
  }
}
