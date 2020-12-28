import 'package:Foody_Cook_Book/screens/Meals_screen.dart';

import './dummy_data.dart';
import './models/meals.dart';


import 'package:flutter/material.dart';

import './screens/tabs_screen.dart';
import './screens/Meals_screen.dart';
import './screens/meal_detail_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeal = [];

  void _setFilters(Map<String, bool> filters){
    setState(() {
      _filters = filters;

      _availableMeals = DUMMY_MEALS.where((element) {
        if(_filters['gluten'] && !element.isGlutenFree){
          return false;
        }
        if(_filters['lactose'] && !element.isLactoseFree){
          return false;
        }
        if(_filters['vegan'] && !element.isVegan){
          return false;
        }
        if(_filters['vegeterian'] && !element.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId){
    final existingIndex = _favouriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0){
      setState(() {
        _favouriteMeal.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favouriteMeal.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool isMealFavourite(String mealId){
    return _favouriteMeal.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 50, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 50, 51, 1)),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      home: TabsScreen(_favouriteMeal),
      routes: {
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavourite , isMealFavourite),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) {
          MealsScreen();
        });
      },
    );
  }
}
