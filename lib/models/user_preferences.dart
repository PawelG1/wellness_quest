// File: lib/models/user_preferences.dart

class UserPreferences {
  List<String> fitnessGoals;
  List<String> mentalHealthGoals;
  List<String> dietaryRestrictions;

  UserPreferences({
    required this.fitnessGoals,
    required this.mentalHealthGoals,
    required this.dietaryRestrictions,
  });

  Map<String, dynamic> toJson() => {
        'fitnessGoals': fitnessGoals,
        'mentalHealthGoals': mentalHealthGoals,
        'dietaryRestrictions': dietaryRestrictions,
      };

  factory UserPreferences.fromJson(Map<String, dynamic> json) => UserPreferences(
        fitnessGoals: List<String>.from(json['fitnessGoals']),
        mentalHealthGoals: List<String>.from(json['mentalHealthGoals']),
        dietaryRestrictions: List<String>.from(json['dietaryRestrictions']),
      );
}
