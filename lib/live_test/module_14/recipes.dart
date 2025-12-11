import 'package:flutter/material.dart';

class Recipe {
  final String title;
  final List<String> ingredients;
  final int time;

  Recipe({
    required this.title,
    required this.ingredients,
    required this.time,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      ingredients: List<String>.from(json['ingredients']),
      time: json['time'],
    );
  }
}
