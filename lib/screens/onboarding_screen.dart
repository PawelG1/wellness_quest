// File: lib/screens/onboarding_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wellness_quest/models/user.dart';
import 'package:wellness_quest/models/user_preferences.dart';
import 'package:wellness_quest/models/user_progress.dart';
import 'package:wellness_quest/providers/user_provider.dart';
import 'package:wellness_quest/utils/constants.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _formKey = GlobalKey<FormState>();
  List<String> _selectedFitnessGoals = [];
  List<String> _selectedMentalHealthGoals = [];
  List<String> _dietaryRestrictions = [];
  final TextEditingController _nameController = TextEditingController();

  void _submitPreferences() {
    if (_formKey.currentState!.validate()) {
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

      // Navigate to HomeScreen
      Navigator.pushReplacementNamed(context, '/home');
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
          title: Text('Set Up Your Wellness Quest'),
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
                    decoration: InputDecoration(labelText: 'Your Name'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                ),
                _buildCheckboxList(
                    'Select Your Fitness Goals', FITNESS_GOALS, _selectedFitnessGoals),
                _buildCheckboxList('Select Your Mental Health Goals',
                    MENTAL_HEALTH_GOALS, _selectedMentalHealthGoals),
                _buildCheckboxList('Select Dietary Restrictions',
                    DIETARY_RESTRICTIONS, _dietaryRestrictions),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitPreferences,
                  child: Text('Start Your Quest'),
                ),
              ],
            ),
          ),
        ));
  }
}
