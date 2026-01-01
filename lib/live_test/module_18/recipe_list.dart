import 'package:flutter/material.dart';
import 'package:flutter_classes/live_test/module_18/recipe_model.dart';


import 'json_parse.dart';

class RecipeList extends StatelessWidget {
  RecipeList({super.key});

  final List<Recipe> recipes = parseRecipes(recipeJson!).cast<Recipe>();

  static String? get recipeJson => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🍽 Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text(
                recipe.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(recipe.description),
              leading: const Icon(Icons.restaurant_menu),
            ),
          );
        },
      ),
    );
  }
}
