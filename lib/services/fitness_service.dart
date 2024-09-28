// File: lib/services/fitness_service.dart

import '../models/fitness_activity.dart';
import '../models/exercise.dart';
import 'package:flutter/material.dart';

class FitnessService {
  List<FitnessActivity> getFitnessActivities() {
    return [
      FitnessActivity(
        title: 'Strength Training',
        description: 'Exercises focusing on building muscle strength.',
        benefits: 'Increases muscle mass and overall strength.',
        icon: Icons.fitness_center,
        exercises: [
          Exercise(
            name: 'Barbell Squats',
            description: 'Perform squats using a barbell for added resistance.',
            benefits: 'Strengthens legs and core muscles.',
            icon: Icons.accessibility_new,
            points: 10,
            duration: 3,
          ),
          Exercise(
            name: 'Deadlifts',
            description: 'Lift a loaded barbell from the ground to hip level.',
            benefits: 'Works multiple muscle groups including back and legs.',
            icon: Icons.fitness_center,
            points: 12,
            duration: 4,
          ),
          Exercise(
            name: 'Bench Press',
            description: 'Press a barbell upward while lying on a bench.',
            benefits: 'Builds chest, shoulders, and triceps.',
            icon: Icons.fitness_center,
            points: 10,
            duration: 5,
          ),
        ],
      ),
      FitnessActivity(
        title: 'Cardio Workouts',
        description: 'Aerobic exercises to increase heart rate.',
        benefits: 'Burns calories and improves cardiovascular health.',
        icon: Icons.directions_run,
        exercises: [
          Exercise(
            name: 'Running',
            description: 'Steady-pace running for endurance.',
            benefits: 'Burns calories and strengthens legs.',
            icon: Icons.directions_run,
            points: 8,
            duration: 2,
          ),
          Exercise(
            name: 'Cycling',
            description: 'Outdoor or stationary bike riding.',
            benefits: 'Low-impact cardio improving leg strength.',
            icon: Icons.pedal_bike,
            points: 4,
            duration: 2,
          ),
          Exercise(
            name: 'Swimming',
            description: 'Swimming laps in a pool.',
            benefits: 'Full-body workout gentle on joints.',
            icon: Icons.pool,
            points: 10,
            duration: 15,
          ),
        ],
      ),
      FitnessActivity(
        title: 'HIIT Sessions',
        description: 'High-Intensity Interval Training for efficient calorie burning.',
        benefits: 'Boosts metabolism and burns fat.',
        icon: Icons.timer,
        exercises: [
          Exercise(
            name: 'Burpees',
            description: 'Full-body exercise combining squats, push-ups, and jumps.',
            benefits: 'Burns calories and builds strength.',
            icon: Icons.fitness_center,
            points: 12,
            duration: 5,
          ),
          Exercise(
            name: 'Jumping Jacks',
            description: 'Jumping with legs spread and hands overhead.',
            benefits: 'Quickly increases heart rate.',
            icon: Icons.accessibility_new,
            points: 6,
            duration: 3,
          ),
          Exercise(
            name: 'Mountain Climbers',
            description: 'Alternating knee tucks in a plank position.',
            benefits: 'Works core muscles and increases heart rate.',
            icon: Icons.fitness_center,
            points: 10,
            duration: 6,
          ),
        ],
      ),
      FitnessActivity(
        title: 'Yoga',
        description: 'Practice poses to enhance flexibility and balance.',
        benefits: 'Improves flexibility, balance, and reduces stress.',
        icon: Icons.self_improvement,
        exercises: [
          Exercise(
            name: 'Downward-Facing Dog',
            description: 'Foundational yoga pose stretching the entire body.',
            benefits: 'Stretches hamstrings and calves; strengthens arms.',
            icon: Icons.self_improvement,
            points: 8,
            duration: 10,
          ),
          Exercise(
            name: 'Child’s Pose',
            description: 'Resting pose that stretches the back.',
            benefits: 'Relaxes the body and reduces stress.',
            icon: Icons.self_improvement,
            points: 5,
            duration: 7,
          ),
          Exercise(
            name: 'Warrior II',
            description: 'Standing pose opening the hips.',
            benefits: 'Strengthens legs and improves balance.',
            icon: Icons.self_improvement,
            points: 8,
            duration: 4,
          ),
        ],
      ),
      // Add more fitness activities here
      FitnessActivity(
        title: 'Pilates',
        description: 'Exercises focusing on core strength and flexibility.',
        benefits: 'Improves posture and flexibility.',
        icon: Icons.accessibility,
        exercises: [
          Exercise(
            name: 'The Hundred',
            description: 'Breathing exercise warming up the body.',
            benefits: 'Strengthens core muscles.',
            icon: Icons.accessibility,
            points: 7,
            duration: 2,
          ),
          Exercise(
            name: 'Roll-Up',
            description: 'Slowly lift and lower the spine.',
            benefits: 'Increases spinal flexibility.',
            icon: Icons.accessibility,
            points: 7,
            duration: 2,
          ),
          Exercise(
            name: 'Leg Circles',
            description: 'Circle one leg while lying down.',
            benefits: 'Strengthens hips and improves mobility.',
            icon: Icons.accessibility,
            points: 6,
            duration: 4,
          ),
        ],
      ),
      FitnessActivity(
        title: 'Flexibility Training',
        description: 'Exercises aimed at improving muscle elasticity.',
        benefits: 'Enhances range of motion and reduces injury risk.',
        icon: Icons.accessibility_new,
        exercises: [
          Exercise(
            name: 'Hamstring Stretch',
            description: 'Stretch the back of your thighs.',
            benefits: 'Improves flexibility of hamstrings.',
            icon: Icons.directions_run,
            points: 5,
            duration: 3,
          ),
          Exercise(
            name: 'Quad Stretch',
            description: 'Stretch the front of your thighs.',
            benefits: 'Increases flexibility of quadriceps.',
            icon: Icons.directions_run,
            points: 5,
            duration: 2,
          ),
          Exercise(
            name: 'Shoulder Stretch',
            description: 'Stretch shoulder muscles to relieve tension.',
            benefits: 'Improves shoulder flexibility.',
            icon: Icons.accessibility_new,
            points: 5,
            duration: 2,
          ),
        ],
      ),
    ];
  }
}
