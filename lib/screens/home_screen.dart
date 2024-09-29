import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'mindfulness_screen.dart';
import 'fitness_activities_screen.dart';
import 'progress_dashboard.dart';
import 'hydration_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      if (userProvider.user == null) {
        // Przekieruj użytkownika do ekranu /user_info po zakończeniu budowania widgetów
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, '/user_info'); // lub '/home' jeśli dodałeś tę trasę
        });
      }
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    // Jeśli użytkownik jest nadal null, wyświetl wskaźnik ładowania
    if (user == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Wellness Quest'), // Tytuł aplikacji
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Przejdź do ekranu edycji danych użytkownika
              Navigator.pushNamed(context, '/user_info');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dodana ikona
            Icon(
              Icons.all_inclusive,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Witaj, ${user.name}!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Jedna kolumna
                  childAspectRatio: 3, // Wysokość do szerokości przycisków
                  mainAxisSpacing: 20,
                ),
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/plan');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: Size(double.infinity, 60),
                    ),
                    child: Text(
                      'Zobacz swój plan',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MindfulnessScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: Size(double.infinity, 60),
                    ),
                    child: Text(
                      'Aktywności mindfulness',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FitnessActivitiesScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: Size(double.infinity, 60),
                    ),
                    child: Text(
                      'Aktywności fitness',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/progress');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: Size(double.infinity, 60),
                    ),
                    child: Text(
                      'Zobacz postępy',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  // Dodajemy nowy przycisk dla Nawadniania i Odżywiania
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/hydration');
                      // Lub jeśli używasz bezpośredniej nawigacji:
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => HydrationScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: Size(double.infinity, 60),
                    ),
                    child: Text(
                      'Nawadnianie',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
