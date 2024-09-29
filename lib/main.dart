import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/user_provider.dart';
import 'providers/hydration_provider.dart';
import 'screens/home_screen.dart';
import 'screens/user_info_screen.dart';
import 'screens/plan_screen.dart';
import 'screens/progress_dashboard.dart';
import 'screens/hydration_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProxyProvider<UserProvider, HydrationProvider>(
          create: (context) => HydrationProvider(
            userProvider: Provider.of<UserProvider>(context, listen: false),
          ),
          update: (context, userProvider, hydrationProvider) =>
              hydrationProvider!..updateUserProvider(userProvider),
        ),
      ],
      child: WellnessQuestApp(),
    ),
  );
}

class WellnessQuestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/user_info': (context) => UserInfoScreen(),
        '/plan': (context) => PlanScreen(),
        '/progress': (context) => ProgressDashboard(),
        '/hydration': (context) => HydrationScreen(),
      },
    );
  }
}
