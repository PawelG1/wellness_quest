// File: lib/models/user_progress.dart

class UserProgress {
  int fitnessPoints;
  int mindfulnessPoints;
  int nutritionPoints;
  int fluidIntake; // Dzienne spożycie płynów w ml
  final int dailyFluidGoal; // Dzienne zapotrzebowanie na płyny w ml

  UserProgress({
    this.fitnessPoints = 0,
    this.mindfulnessPoints = 0,
    this.nutritionPoints = 0,
    this.fluidIntake = 0,
    this.dailyFluidGoal = 2000, // Przykładowy cel: 2000 ml
  });

  Map<String, dynamic> toJson() => {
        'fitnessPoints': fitnessPoints,
        'mindfulnessPoints': mindfulnessPoints,
        'nutritionPoints': nutritionPoints,
        'fluidIntake': fluidIntake,
        'dailyFluidGoal': dailyFluidGoal,
      };

  factory UserProgress.fromJson(Map<String, dynamic> json) => UserProgress(
        fitnessPoints: json['fitnessPoints'],
        mindfulnessPoints: json['mindfulnessPoints'],
        nutritionPoints: json['nutritionPoints'],
        fluidIntake: json['fluidIntake'],
        dailyFluidGoal: json['dailyFluidGoal'],
      );
}
