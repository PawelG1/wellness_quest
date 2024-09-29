import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellness_quest/models/user.dart';
import 'package:wellness_quest/models/user_preferences.dart';
import 'package:wellness_quest/models/user_progress.dart';
import 'package:wellness_quest/providers/user_provider.dart';
import 'package:wellness_quest/utils/constants.dart';

class UserInfoScreen extends StatefulWidget {
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  List<String> _selectedFitnessGoals = [];
  List<String> _selectedMentalHealthGoals = [];
  List<String> _dietaryRestrictions = [];
  final TextEditingController _nameController = TextEditingController();

  void _submitUserInfo() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      debugPrint('Formularz został zapisany.');

      UserPreferences preferences = UserPreferences(
        fitnessGoals: _selectedFitnessGoals,
        mentalHealthGoals: _selectedMentalHealthGoals,
        dietaryRestrictions: _dietaryRestrictions,
      );

      User user = User(
        name: _nameController.text.trim(),
        preferences: preferences,
        progress: UserProgress(),
      );

      Provider.of<UserProvider>(context, listen: false).setUser(user);
      debugPrint('Użytkownik został ustawiony: ${user.name}');

      // Przejdź do ekranu głównego
      Navigator.pushReplacementNamed(context, '/'); // lub '/home' jeśli dodałeś tę trasę
    } else {
      debugPrint('Formularz zawiera błędy.');
    }
  }

  Widget _buildCheckboxList(
      String title, List<String> options, List<String> selectedOptions) {
    return ExpansionTile(
      title: Text(title),
      children: options.map((option) {
        return CheckboxListTile(
          title: Text(option),
          value: selectedOptions.contains(option),
          onChanged: (bool? value) {
            setState(() {
              if (value == true) {
                selectedOptions.add(option);
              } else {
                selectedOptions.remove(option);
              }
            });
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wprowadź swoje dane'),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Twoje imię'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Proszę wprowadź swoje imię';
                      }
                      return null;
                    },
                  ),
                ),
                _buildCheckboxList(
                    'Wybierz swoje cele fitness',
                    FITNESS_GOALS,
                    _selectedFitnessGoals),
                _buildCheckboxList(
                    'Wybierz swoje cele dotyczące zdrowia psychicznego',
                    MENTAL_HEALTH_GOALS,
                    _selectedMentalHealthGoals),
                _buildCheckboxList('Wybierz ograniczenia dietetyczne',
                    DIETARY_RESTRICTIONS, _dietaryRestrictions),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitUserInfo,
                  child: Text('Zapisz i kontynuuj'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 60),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
