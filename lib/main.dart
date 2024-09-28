// File: lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'screens/home_screen.dart';
import 'screens/plan_screen.dart';
import 'screens/progress_dashboard.dart';
import 'screens/user_info_screen.dart';

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
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Zmieniono z 'primary'
            foregroundColor: Colors.white, // Zmieniono z 'onPrimary'
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black), // Zmieniono z 'bodyText1'
          bodyMedium: TextStyle(color: Colors.black), // Zmieniono z 'bodyText2'
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/user_info': (context) => UserInfoScreen(),
        '/plan': (context) => PlanScreen(),
        '/progress': (context) => ProgressDashboard(),
      },
    );
  }
}
