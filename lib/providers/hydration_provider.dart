import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_progress.dart';
import 'user_provider.dart';
import 'dart:async';

class HydrationProvider with ChangeNotifier {
  late UserProvider userProvider;
  Timer? _dailyResetTimer;
  final String _lastResetKey = 'lastResetDate';

  HydrationProvider({required this.userProvider}) {
    _initialize();
  }

  // Metoda do aktualizacji referencji UserProvider
  void updateUserProvider(UserProvider newUserProvider) {
    userProvider = newUserProvider;
    notifyListeners();
  }

  Future<void> _initialize() async {
    await _checkAndResetIfNeeded();
    _scheduleDailyReset();
  }

  Future<void> _checkAndResetIfNeeded() async {
    final prefs = await SharedPreferences.getInstance();
    final lastResetString = prefs.getString(_lastResetKey);
    final today = DateTime.now();

    if (lastResetString != null) {
      final lastResetDate = DateTime.parse(lastResetString);
      if (!_isSameDay(lastResetDate, today)) {
        resetDailyFluidIntake();
      }
    } else {
      // Jeśli nie ma zapisanej daty resetu, ustaw dzisiejszą datę
      prefs.setString(_lastResetKey, today.toIso8601String());
    }
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  void addFluidIntake(int amount) {
    if (userProvider.user != null) {
      userProvider.user!.progress.fluidIntake += amount;
      
      // Przyznawanie punktów za nawadnianie
      int pointsToAdd = (amount / 250).floor(); // 1 punkt za każde 250 ml
      userProvider.user!.progress.hydrationPoints += pointsToAdd;
      
      userProvider.updateProgress(userProvider.user!.progress);
      debugPrint(
          'Dodano $amount ml. Całkowite spożycie: ${userProvider.user!.progress.fluidIntake} ml');
      debugPrint(
          'Dodano $pointsToAdd punktów nawadniania. Całkowite punkty: ${userProvider.user!.progress.hydrationPoints}');
      notifyListeners();
    } else {
      debugPrint('Błąd: Użytkownik nie jest ustawiony.');
    }
  }

  Future<void> resetDailyFluidIntake() async {
    if (userProvider.user != null) {
      userProvider.user!.progress.fluidIntake = 0;
      userProvider.user!.progress.hydrationPoints = 0; // Resetowanie punktów nawadniania
      userProvider.updateProgress(userProvider.user!.progress);
      debugPrint('Dzienne spożycie zostało zresetowane.');
      notifyListeners();

      // Aktualizuj datę ostatniego resetu
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(_lastResetKey, DateTime.now().toIso8601String());
    } else {
      debugPrint('Błąd: Użytkownik nie jest ustawiony.');
    }
  }

  bool hasMetDailyGoal() {
    if (userProvider.user != null) {
      return userProvider.user!.progress.fluidIntake >=
          userProvider.user!.progress.dailyFluidGoal;
    }
    return false;
  }

  void _scheduleDailyReset() {
    final now = DateTime.now();
    final nextMidnight = DateTime(now.year, now.month, now.day + 1, 0, 0, 0);
    final initialDelay = nextMidnight.difference(now);

    _dailyResetTimer = Timer(initialDelay, () {
      resetDailyFluidIntake();
      _scheduleDailyReset(); // Ponownie zaplanuj reset na następny dzień
    });

    debugPrint(
        'Timer zaplanowany na: ${nextMidnight.toLocal().toIso8601String()} (za ${initialDelay.inSeconds} sekund)');
  }

  @override
  void dispose() {
    _dailyResetTimer?.cancel();
    super.dispose();
  }
}
