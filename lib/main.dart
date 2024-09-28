// File: lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellness_quest/providers/user_provider.dart';
import 'package:wellness_quest/screens/onboarding_screen.dart';
import 'package:wellness_quest/screens/home_screen.dart';
import 'package:wellness_quest/screens/plan_screen.dart';
import 'package:wellness_quest/screens/activity_screen.dart';
import 'package:wellness_quest/screens/mindfulness_screen.dart';
import 'package:wellness_quest/screens/progress_dashboard.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: WellnessQuestApp(),
    ),
  );
}

class WellnessQuestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wellness Quest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnboardingScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(
              builder: (context) => HomeScreen(),
            );
          case '/plan':
            return MaterialPageRoute(
              builder: (context) => PlanScreen(),
            );
          case '/activity':
            final String activityName = settings.arguments as String;
            return MaterialPageRoute(
              builder: (context) => ActivityScreen(activityName: activityName),
            );
          case '/mindfulness':
            return MaterialPageRoute(
              builder: (context) => MindfulnessScreen(),
            );
          case '/progress':
            return MaterialPageRoute(
              builder: (context) => ProgressDashboard(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => OnboardingScreen(),
            );
        }
      },
    );
  }
}
