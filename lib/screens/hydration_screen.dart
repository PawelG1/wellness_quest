// File: lib/screens/hydration_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/hydration_provider.dart';

class HydrationScreen extends StatefulWidget {
  @override
  _HydrationScreenState createState() => _HydrationScreenState();
}

class _HydrationScreenState extends State<HydrationScreen> {
  final TextEditingController _controller = TextEditingController();

  void _addFluidIntake() {
    final hydrationProvider =
        Provider.of<HydrationProvider>(context, listen: false);
    int amount = int.tryParse(_controller.text) ?? 0;
    if (amount > 0) {
      hydrationProvider.addFluidIntake(amount);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nawadnianie i Odżywianie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Sekcja Nawadniania
            Text(
              'Monitorowanie Spożycia Płynów',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Consumer<HydrationProvider>(
              builder: (context, hydration, child) {
                return Column(
                  children: [
                    Text(
                      'Dzienne Spożycie: ${hydration.userProvider.user?.progress.fluidIntake ?? 0} ml / ${hydration.userProvider.user?.progress.dailyFluidGoal ?? 2000} ml',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: (hydration.userProvider.user?.progress.fluidIntake ?? 0) /
                          (hydration.userProvider.user?.progress.dailyFluidGoal ?? 2000),
                      color: Colors.green,
                      backgroundColor: Colors.green.withOpacity(0.3),
                      minHeight: 20,
                    ),
                    SizedBox(height: 20),
                  ],
                );
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Ilość spożytych płynów (ml)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addFluidIntake,
                  child: Text('Dodaj'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(80, 60),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<HydrationProvider>(context, listen: false)
                    .resetDailyFluidIntake();
              },
              child: Text('Resetuj dzienne spożycie'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
              ),
            ),
            SizedBox(height: 30),
            // Sekcja Odżywiania (możesz ją rozszerzyć według potrzeb)
            Text(
              'Monitorowanie Odżywiania',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            // Dodaj tutaj funkcjonalności związane z odżywianiem
            // ...
          ],
        ),
      ),
    );
  }
}
