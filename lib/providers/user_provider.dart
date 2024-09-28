
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/user.dart';
import '../models/user_progress.dart'; // Dodaj ten import

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  UserProvider() {
    _loadUser();
  }

  void setUser(User user) {
    _user = user;
    _saveUser();
    notifyListeners();
  }

  void updateProgress(UserProgress progress) {
    if (_user != null) {
      _user!.progress = progress;
      _saveUser();
      notifyListeners();
    }
  }

  void _saveUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', jsonEncode(_user?.toJson()));
  }

  void _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('user');
    if (userData != null) {
      _user = User.fromJson(jsonDecode(userData));
      notifyListeners();
    }
  }
}
