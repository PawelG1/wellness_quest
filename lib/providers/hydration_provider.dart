// File: lib/providers/hydration_provider.dart

import 'package:flutter/material.dart';
import '../models/user_progress.dart';
import 'user_provider.dart';
import 'dart:async';

class HydrationProvider with ChangeNotifier {
  UserProvider userProvider;
  Timer? _dailyResetTimer;

  HydrationProvider({required this.userProvider}) {
    _scheduleDailyReset();
  }

  // Metoda do aktualizacji referencji UserProvider
  void updateUserProvider(UserProvider newUserProvider) {
    userProvider = newUserProvider;
    notifyListeners();
  }

  void addFluidIntake(int amount) {
    if (userProvider.user != null) {
      userProvider.user!.progress.fluidIntake += amount;
      userProvider.updateProgress(userProvider.user!.progress);
      notifyListeners();
    }
  }

  void resetDailyFluidIntake() {
    if (userProvider.user != null) {
      userProvider.user!.progress.fluidIntake = 0;
      userProvider.updateProgress(userProvider.user!.progress);
      notifyListeners();
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
    final nextMidnight =
        DateTime(now.year, now.month, now.day + 1, 0, 0, 0);
    final initialDelay = nextMidnight.difference(now);

    _dailyResetTimer = Timer(initialDelay, () {
      resetDailyFluidIntake();
      _scheduleDailyReset(); // Ponownie zaplanuj reset na następny dzień
    });
  }

  @override
  void dispose() {
    _dailyResetTimer?.cancel();
    super.dispose();
  }
}
