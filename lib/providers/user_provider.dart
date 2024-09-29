// File: lib/providers/user_provider.dart

import 'package:flutter/material.dart';
import '../models/user.dart';
import '../models/user_progress.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  // Metoda do ustawienia użytkownika
  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  // Metoda do aktualizacji postępów użytkownika
  void updateProgress(UserProgress progress) {
    if (_user != null) {
      _user!.progress = progress;
      notifyListeners();
      
    }
  }

  // Możesz dodać dodatkowe metody do zarządzania użytkownikiem
}
