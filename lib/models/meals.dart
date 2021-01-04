import 'package:flutter/foundation.dart';

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String instructions;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> measure;

  const Meal(
      {@required this.categories,
      @required this.title,
      @required this.id,
      @required this.imageUrl,
      @required this.ingredients,
      @required this.instructions,
      @required this.measure});
}
