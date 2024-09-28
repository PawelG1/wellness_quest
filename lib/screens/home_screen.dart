// File: lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellness_quest/providers/user_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Wellness Quest Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Przejdź do ekranu edycji danych użytkownika
              Navigator.pushNamed(context, '/user_info');
            },
          ),
          // Usuń przycisk wylogowania
          // IconButton(
          //   icon: Icon(Icons.logout),
          //   onPressed: () {
          //     // Wyloguj użytkownika
          //     userProvider.clearUserData();
          //     Navigator.pushReplacementNamed(context, '/user_info');
          //   },
          // ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Witaj, ${user?.name ?? 'Gościu'}!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/plan');
              },
              child: Text('Zobacz swój plan'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/mindfulness');
              },
              child: Text('Aktywności mindfulness'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/progress');
              },
              child: Text('Zobacz postępy'),
            ),
          ],
        ),
      ),
    );
  }
}
