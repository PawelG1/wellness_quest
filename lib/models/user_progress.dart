class UserProgress {
  int fitnessPoints;
  int mindfulnessPoints;
  int hydrationPoints; // Zmieniono z nutritionPoints na hydrationPoints
  int fluidIntake; // Dzienne spożycie płynów w ml
  final int dailyFluidGoal; // Dzienne zapotrzebowanie na płyny w ml

  UserProgress({
    this.fitnessPoints = 0,
    this.mindfulnessPoints = 0,
    this.hydrationPoints = 0, // Zmieniono domyślną wartość
    this.fluidIntake = 0,
    this.dailyFluidGoal = 2000, // Przykładowy cel: 2000 ml
  });

  Map<String, dynamic> toJson() => {
        'fitnessPoints': fitnessPoints,
        'mindfulnessPoints': mindfulnessPoints,
        'hydrationPoints': hydrationPoints, // Zmieniono z nutritionPoints
        'fluidIntake': fluidIntake,
        'dailyFluidGoal': dailyFluidGoal,
      };

  factory UserProgress.fromJson(Map<String, dynamic> json) => UserProgress(
        fitnessPoints: json['fitnessPoints'],
        mindfulnessPoints: json['mindfulnessPoints'],
        hydrationPoints: json['hydrationPoints'], // Zmieniono z nutritionPoints
        fluidIntake: json['fluidIntake'],
        dailyFluidGoal: json['dailyFluidGoal'],
      );
}
