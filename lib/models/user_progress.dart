
class UserProgress {
  int fitnessPoints;
  int mindfulnessPoints;
  int nutritionPoints;

  UserProgress({
    this.fitnessPoints = 0,
    this.mindfulnessPoints = 0,
    this.nutritionPoints = 0,
  });

  Map<String, dynamic> toJson() => {
        'fitnessPoints': fitnessPoints,
        'mindfulnessPoints': mindfulnessPoints,
        'nutritionPoints': nutritionPoints,
      };

  factory UserProgress.fromJson(Map<String, dynamic> json) => UserProgress(
        fitnessPoints: json['fitnessPoints'],
        mindfulnessPoints: json['mindfulnessPoints'],
        nutritionPoints: json['nutritionPoints'],
      );
}
