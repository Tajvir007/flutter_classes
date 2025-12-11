import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_classes/live_test/module_14/recipes.dart';

class RecipeListPage extends StatelessWidget {
  final String jsonString;

  const RecipeListPage({super.key, required this.jsonString});

  @override
  Widget build(BuildContext context) {
    final recipes = parseRecipes(jsonString);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipes"),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index].title),
          );
        },
      ),
    );
  }


  List<Recipe> parseRecipes(String jsonString) {
    final data = jsonDecode(jsonString);
    final List<dynamic> list = data['recipes'];

    return list.map((item) => Recipe.fromJson(item)).toList();
  }

}
