
import 'user_preferences.dart';
import 'user_progress.dart';

class User {
  String name;
  UserPreferences preferences;
  UserProgress progress;

  User({
    required this.name,
    required this.preferences,
    required this.progress,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'preferences': preferences.toJson(),
        'progress': progress.toJson(),
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'],
        preferences: UserPreferences.fromJson(json['preferences']),
        progress: UserProgress.fromJson(json['progress']),
      );
}
