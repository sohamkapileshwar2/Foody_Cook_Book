import 'package:flutter/material.dart';
import '../models/meals.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;

  FavouritesScreen(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {
    if(favouriteMeal.isEmpty){
      return Center(
      child: Text('You have no Favourites yet'),
    );
    }
    else{
    }
  }
}
