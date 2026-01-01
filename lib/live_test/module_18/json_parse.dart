import 'dart:convert';

import '../module_14/recipes.dart';

List<Recipe> parseRecipes(String jsonString) {
  final decoded = json.decode(jsonString); // String → Map
  final List list = decoded['recipes'];    // recipes array

  return list.map((e) => Recipe.fromJson(e)).toList();
}
