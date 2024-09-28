
import '../models/user_preferences.dart';
import '../models/wellness_plan.dart';
import '../models/fitness_activity.dart';
import '../models/mental_health_activity.dart';
import '../models/exercise.dart';
import 'package:flutter/material.dart';

class PlanGenerator {
  UserPreferences preferences;

  PlanGenerator(this.preferences);

  WellnessPlan generatePlan() {
    List<FitnessActivity> fitnessActivities = _generateFitnessActivities();
    List<MentalHealthActivity> mentalHealthActivities =
        _generateMentalHealthActivities();
    List<String> nutritionGuidelines = _generateNutritionGuidelines();

    return WellnessPlan(
      fitnessActivities: fitnessActivities,
      mentalHealthActivities: mentalHealthActivities,
      nutritionGuidelines: nutritionGuidelines,
    );
  }

  List<FitnessActivity> _generateFitnessActivities() {
    List<FitnessActivity> activities = [];

    if (preferences.fitnessGoals.contains('Build Muscle')) {
      activities.add(FitnessActivity(
        title: 'Strength Training',
        description:
            'Ćwiczenia skupiające się na zwiększaniu siły i masy mięśniowej.',
        benefits:
            'Pomaga budować masę mięśniową i poprawia ogólną siłę.',
        icon: Icons.fitness_center,
        exercises: [
          Exercise(
            name: 'Przysiady ze sztangą',
            description:
                'Wykonuj przysiady z użyciem sztangi dla dodatkowego obciążenia.',
            benefits: 'Wzmacnia nogi i mięśnie korpusu.',
            icon: Icons.accessibility_new,
            points: 5, 
            duration: 2,
          ),
          Exercise(
            name: 'Martwy ciąg',
            description:
                'Podnoszenie sztangi z podłogi do wysokości bioder.',
            benefits: 'Pracuje nad wieloma grupami mięśni, w tym pleców i nóg.',
            icon: Icons.fitness_center,
            points: 5, duration: 2,
          ),
          Exercise(
            name: 'Wyciskanie na ławce',
            description:
                'Wyciskanie sztangi w pozycji leżącej na ławce.',
            benefits: 'Trenuje mięśnie klatki piersiowej, ramion i tricepsów.',
            icon: Icons.fitness_center,
            points: 5, duration: 2,
          ),
        ],
      ));
      activities.add(FitnessActivity(
        title: 'Trening oporowy',
        description:
            'Wykorzystaj taśmy oporowe lub ciężary do wykonywania ćwiczeń.',
        benefits:
            'Zwiększa tonus mięśniowy i wytrzymałość.',
        icon: Icons.accessibility,
        exercises: [
          Exercise(
            name: 'Wiosłowanie z taśmą oporową',
            description:
                'Użyj taśmy oporowej do wykonywania ruchów wiosłowania.',
            benefits: 'Wzmacnia mięśnie pleców.',
            icon: Icons.accessibility_new,
            points: 5, duration: 2,
          ),
          Exercise(
            name: 'Uginanie bicepsów',
            description:
                'Uginaj przedramiona z hantlami, pracując nad bicepsami.',
            benefits: 'Buduje siłę ramion.',
            icon: Icons.fitness_center,
            points: 5, duration: 2,
          ),
          Exercise(
            name: 'Prostowanie tricepsów',
            description:
                'Prostuj ramiona nad głową z hantlami, celując w tricepsy.',
            benefits: 'Wzmacnia tylną część ramion.',
            icon: Icons.fitness_center,
            points: 5, duration: 2,
          ),
        ],
      ));
    }

    if (preferences.fitnessGoals.contains('Lose Weight')) {
      activities.add(FitnessActivity(
        title: 'Trening cardio',
        description: 'Ćwiczenia aerobowe zwiększające tętno.',
        benefits:
            'Spala kalorie i poprawia zdrowie układu krążenia.',
        icon: Icons.directions_run,
        exercises: [
          Exercise(
            name: 'Bieganie',
            description: 'Bieganie w stałym tempie.',
            benefits: 'Spala kalorie i wzmacnia nogi.',
            icon: Icons.directions_run,
            points: 5, duration: 2,
          ),
          Exercise(
            name: 'Jazda na rowerze',
            description: 'Jazda na rowerze na zewnątrz lub stacjonarnym.',
            benefits: 'Niskoobciążeniowe cardio poprawiające siłę nóg.',
            icon: Icons.pedal_bike,
            points: 5, duration: 2,
          ),
          Exercise(
            name: 'Pływanie',
            description: 'Pływanie na basenie.',
            benefits: 'Trening całego ciała łagodny dla stawów.',
            icon: Icons.pool,
            points: 5, duration: 2,
          ),
        ],
      ));
      activities.add(FitnessActivity(
        title: 'Sesje HIIT',
        description:
            'Trening interwałowy o wysokiej intensywności z intensywnymi seriami ćwiczeń.',
        benefits:
            'Efektywne spalanie kalorii i przyspieszenie metabolizmu.',
        icon: Icons.timer,
        exercises: [
          Exercise(
            name: 'Burpees',
            description: 'Ćwiczenie całego ciała łączące przysiad, pompkę i wyskok.',
            benefits: 'Spala kalorie i buduje siłę.',
            icon: Icons.fitness_center,
            points: 5, duration: 2,
          ),
          Exercise(
            name: 'Pajacyki',
            description: 'Skakanie z rozkrokiem i uniesieniem ramion.',
            benefits: 'Szybko zwiększa tętno.',
            icon: Icons.accessibility_new,
            points: 5, duration: 2,
          ),
          Exercise(
            name: 'Mountain Climbers',
            description: 'Naprzemienne przyciąganie kolan do klatki w pozycji deski.',
            benefits: 'Pracuje nad mięśniami korpusu i zwiększa tętno.',
            icon: Icons.fitness_center,
            points: 5, duration: 2,
          ),
        ],
      ));
    }

    if (preferences.fitnessGoals.contains('Improve Flexibility')) {
      activities.add(FitnessActivity(
        title: 'Joga',
        description:
            'Praktyka pozycji zwiększających elastyczność i równowagę.',
        benefits:
            'Poprawia elastyczność, równowagę i redukuje stres.',
        icon: Icons.self_improvement,
        exercises: [
          Exercise(
            name: 'Pozycja psa z głową w dół',
            description: 'Podstawowa pozycja jogi rozciągająca całe ciało.',
            benefits: 'Rozciąga ścięgna i łydki; wzmacnia ramiona.',
            icon: Icons.self_improvement,
            points: 5, 
            duration: 2,
          ),
          Exercise(
            name: 'Pozycja dziecka',
            description: 'Pozycja relaksacyjna rozciągająca plecy.',
            benefits: 'Relaksuje ciało i redukuje stres.',
            icon: Icons.self_improvement,
            points: 5,
            duration: 2,
          ),
          Exercise(
            name: 'Pozycja wojownika II',
            description: 'Pozycja stojąca otwierająca biodra.',
            benefits: 'Wzmacnia nogi i poprawia równowagę.',
            icon: Icons.self_improvement,
            points: 5,
            duration: 2,
          ),
        ],
      ));
      activities.add(FitnessActivity(
        title: 'Pilates',
        description:
            'Ćwiczenia skupiające się na sile korpusu i elastyczności.',
        benefits:
            'Poprawia postawę i elastyczność.',
        icon: Icons.accessibility,
        exercises: [
          Exercise(
            name: 'The Hundred',
            description: 'Ćwiczenie oddechowe rozgrzewające ciało.',
            benefits: 'Wzmacnia mięśnie korpusu.',
            icon: Icons.accessibility,
            points: 5,
            duration: 2,
          ),
          Exercise(
            name: 'Roll-Up',
            description: 'Powolne unoszenie i opuszczanie kręgosłupa.',
            benefits: 'Zwiększa elastyczność kręgosłupa.',
            icon: Icons.accessibility,
            points: 5,
            duration: 2,
          ),
          Exercise(
            name: 'Krążenie nogą',
            description: 'Krążenie jednej nogi w leżeniu.',
            benefits: 'Wzmacnia biodra i poprawia ruchomość.',
            icon: Icons.accessibility,
            points: 5,
            duration: 2,
          ),
        ],
      ));
    }

    // Dodaj więcej celów fitness i powiązanych aktywności tutaj

    return activities;
  }

  List<MentalHealthActivity> _generateMentalHealthActivities() {
    List<MentalHealthActivity> activities = [];

    if (preferences.mentalHealthGoals.contains('Reduce Stress')) {
      activities.add(MentalHealthActivity(
        title: 'Medytacja',
        description:
            'Praktyka uważności i skupienia na chwili obecnej.',
        benefits:
            'Redukuje stres i poprawia samopoczucie emocjonalne.',
        icon: Icons.self_improvement,
        exercises: [
          Exercise(
            name: 'Uważne oddychanie',
            description: 'Skup się na oddechu przez 5-10 minut.',
            benefits: 'Uspokaja umysł i redukuje lęk.',
            icon: Icons.air,
            points: 5,
            duration: 2,
          ),
          Exercise(
            name: 'Wizualizacja',
            description: 'Wyobraź sobie uspokajające obrazy lub scenariusze.',
            benefits: 'Promuje relaks i redukcję stresu.',
            icon: Icons.landscape,
            points: 5,
            duration: 3,
          ),
          Exercise(
            name: 'Medytacja miłującej dobroci',
            description: 'Kultywuj uczucia współczucia i życzliwości.',
            benefits: 'Poprawia nastrój i regulację emocji.',
            icon: Icons.favorite,
            points: 5,
            duration: 2,
          ),
        ],
      ));
      activities.add(MentalHealthActivity(
        title: 'Ćwiczenia oddechowe',
        description:
            'Praktykuj techniki oddechowe dla uspokojenia układu nerwowego.',
        benefits:
            'Obniża poziom stresu i poprawia jasność umysłu.',
        icon: Icons.air,
        exercises: [
          Exercise(
            name: 'Oddychanie 4-7-8',
            description: 'Wdech przez 4, zatrzymaj na 7, wydech przez 8 sekund.',
            benefits: 'Redukuje stres i pomaga zasnąć.',
            icon: Icons.air,
            points: 5,
            duration: 1,
          ),
          Exercise(
            name: 'Oddychanie pudełkowe',
            description: 'Wdech, zatrzymaj, wydech, zatrzymaj po 4 sekundy.',
            benefits: 'Balansuje układ nerwowy.',
            icon: Icons.crop_square,
            points: 5,
            duration: 2,
          ),
          Exercise(
            name: 'Oddychanie naprzemienne',
            description: 'Oddychaj na przemian przez jedną i drugą dziurkę nosa.',
            benefits: 'Poprawia koncentrację i redukuje lęk.',
            icon: Icons.airline_seat_flat,
            points: 5,
            duration: 2,
          ),
        ],
      ));
    }

    if (preferences.mentalHealthGoals.contains('Improve Focus')) {
      activities.add(MentalHealthActivity(
        title: 'Ćwiczenia uważności',
        description:
            'Praktykuj bycie obecnym i w pełni zaangażowanym w bieżącą czynność.',
        benefits:
            'Poprawia koncentrację i redukuje rozproszenia.',
        icon: Icons.filter_center_focus,
        exercises: [
          Exercise(
            name: 'Uważne jedzenie',
            description: 'Zwracaj pełną uwagę na doświadczenie jedzenia.',
            benefits: 'Poprawia trawienie i cieszenie się posiłkiem.',
            icon: Icons.restaurant,
            points: 5,
            duration: 3,
          ),
          Exercise(
            name: 'Skanowanie ciała',
            description: 'Mentalnie przeglądaj ciało od stóp do głów.',
            benefits: 'Zwiększa świadomość ciała i relaksację.',
            icon: Icons.accessibility_new,
            points: 5,
            duration: 3,
          ),
          Exercise(
            name: 'Uważny spacer',
            description: 'Spaceruj powoli, zauważając każdy ruch.',
            benefits: 'Zwiększa świadomość i redukuje stres.',
            icon: Icons.directions_walk,
            points: 5,
            duration: 3,
          ),
        ],
      ));
      activities.add(MentalHealthActivity(
        title: 'Gry trenujące mózg',
        description:
            'Zajmuj się grami wyzwalającymi pamięć i zdolności poznawcze.',
        benefits:
            'Poprawia zwinność umysłu i koncentrację.',
        icon: Icons.videogame_asset,
        exercises: [
          Exercise(
            name: 'Gry pamięciowe',
            description: 'Dopasowywanie par kart z pamięci.',
            benefits: 'Wzmacnia pamięć.',
            icon: Icons.memory,
            points: 5,
            duration: 3,
          ),
          Exercise(
            name: 'Rozwiązywanie łamigłówek',
            description: 'Praca nad puzzlami lub krzyżówkami.',
            benefits: 'Poprawia umiejętności rozwiązywania problemów.',
            icon: Icons.extension,
            points: 5,
            duration: 3,
          ),
          Exercise(
            name: 'Łamigłówki logiczne',
            description: 'Rozwiązywanie zagadek i łamigłówek logicznych.',
            benefits: 'Stymuluje myślenie krytyczne.',
            icon: Icons.lightbulb_outline,
            points: 5,
            duration: 3,
          ),
        ],
      ));
    }

    if (preferences.mentalHealthGoals.contains('Enhance Sleep Quality')) {
      activities.add(MentalHealthActivity(
        title: 'Praktyki higieny snu',
        description:
            'Przyjmij nawyki promujące lepszą jakość snu.',
        benefits:
            'Poprawia ogólne zdrowie i poziom energii.',
        icon: Icons.bedtime,
        exercises: [
          Exercise(
            name: 'Stały harmonogram snu',
            description: 'Kładź się spać i wstawaj o tej samej porze każdego dnia.',
            benefits: 'Reguluje rytm dobowy.',
            icon: Icons.schedule,
            points: 5,
            duration: 3,
          ),
          Exercise(
            name: 'Ogranicz czas przed ekranem przed snem',
            description: 'Unikaj ekranów co najmniej godzinę przed snem.',
            benefits: 'Zwiększa produkcję melatoniny.',
            icon: Icons.phonelink_off,
            points: 5,
            duration: 3,
          ),
          Exercise(
            name: 'Stwórz spokojne otoczenie',
            description: 'Upewnij się, że sypialnia jest ciemna, cicha i chłodna.',
            benefits: 'Sprzyja głębszemu snu.',
            icon: Icons.nights_stay,
            points: 5,
            duration: 3,
          ),
        ],
      ));
      activities.add(MentalHealthActivity(
        title: 'Techniki relaksacyjne',
        description:
            'Praktykuj metody relaksacji umysłu i ciała przed snem.',
        benefits:
            'Redukuje bezsenność i poprawia jakość snu.',
        icon: Icons.spa,
        exercises: [
          Exercise(
            name: 'Progresywna relaksacja mięśni',
            description: 'Napinaj i rozluźniaj grupy mięśniowe po kolei.',
            benefits: 'Łagodzi napięcie fizyczne.',
            icon: Icons.accessibility_new,
            points: 5,
            duration: 8,
          ),
          Exercise(
            name: 'Ciepła kąpiel',
            description: 'Weź ciepłą kąpiel dla rozluźnienia mięśni.',
            benefits: 'Promuje relaks i redukuje stres.',
            icon: Icons.bathtub,
            points: 5,
            duration: 10,
          ),
          Exercise(
            name: 'Aromaterapia',
            description: 'Użyj uspokajających zapachów, takich jak lawenda.',
            benefits: 'Poprawia nastrój i promuje sen.',
            icon: Icons.local_florist,
            points: 5,
            duration: 12,
          ),
        ],
      ));
    }

    // Dodaj więcej celów zdrowia psychicznego i powiązanych aktywności tutaj

    return activities;
  }

//--------

  List<String> _generateNutritionGuidelines() {
    List<String> guidelines = [];

    if (preferences.dietaryRestrictions.contains('Vegan')) {
      guidelines.add(
          'Adopt a plant-based diet rich in fruits, vegetables, grains, and legumes.');
    }

    if (preferences.dietaryRestrictions.contains('Vegetarian')) {
      guidelines.add(
          'Include a variety of plant foods and dairy or eggs as per preference.');
    }

    if (preferences.dietaryRestrictions.contains('Gluten-Free')) {
      guidelines.add(
          'Avoid gluten-containing grains like wheat, barley, and rye.');
    }

    if (preferences.dietaryRestrictions.contains('Keto')) {
      guidelines.add(
          'Follow a low-carb, high-fat diet to promote ketosis.');
    }

    if (guidelines.isEmpty) {
      guidelines.add(
          'Maintain a balanced diet with a mix of all essential nutrients.');
    }

    return guidelines;
  }
}
