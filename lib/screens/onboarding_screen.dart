// File: lib/screens/onboarding_screen.dart

import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Treści onboardingowe, np. slajdy z informacjami o aplikacji
    return Scaffold(
      appBar: AppBar(
        title: Text('Wprowadzenie'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Witamy w Wellness Quest!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('Rozpocznij'),
            ),
          ],
        ),
      ),
    );
  }
}
