
import 'fitness_activity.dart';
import 'mental_health_activity.dart';

class WellnessPlan {
  List<FitnessActivity> fitnessActivities;
  List<MentalHealthActivity> mentalHealthActivities;
  List<String> nutritionGuidelines;

  WellnessPlan({
    required this.fitnessActivities,
    required this.mentalHealthActivities,
    required this.nutritionGuidelines,
  });
}
