import 'dart:convert';

import 'package:flutter/foundation.dart';

class RecipeModel {
  final int id;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String difficulty;
  final String cuisine;
  final int caloriesPerServing;
  final List<String> tags;
  final int userId;
  final String image;
  final double rating;
  final int reviewCount;
  final List<String> mealType;

  RecipeModel({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'ingredients': ingredients,
      'instructions': instructions,
      'prepTimeMinutes': prepTimeMinutes,
      'cookTimeMinutes': cookTimeMinutes,
      'servings': servings,
      'difficulty': difficulty,
      'cuisine': cuisine,
      'caloriesPerServing': caloriesPerServing,
      'tags': tags,
      'userId': userId,
      'image': image,
      'rating': rating,
      'reviewCount': reviewCount,
      'mealType': mealType,
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      id: map['id'],
      name: map['name'],
      ingredients: List<String>.from(map['ingredients']),
      instructions: List<String>.from(map['instructions']),
      prepTimeMinutes: map['prepTimeMinutes'],
      cookTimeMinutes: map['cookTimeMinutes'],
      servings: map['servings'],
      difficulty: map['difficulty'],
      cuisine: map['cuisine'],
      caloriesPerServing: map['caloriesPerServing'],
      tags: List<String>.from(map['tags']),
      userId: map['userId'],
      image: map['image'],
      rating: map['rating'].toDouble(),
      reviewCount: map['reviewCount'],
      mealType: List<String>.from(map['mealType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeModel.fromJson(String source) =>
      RecipeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RecipeModel(id: $id, name: $name, ingredients: $ingredients, instructions: $instructions, prepTimeMinutes: $prepTimeMinutes, cookTimeMinutes: $cookTimeMinutes, servings: $servings, difficulty: $difficulty, cuisine: $cuisine, caloriesPerServing: $caloriesPerServing, tags: $tags, userId: $userId, image: $image, rating: $rating, reviewCount: $reviewCount, mealType: $mealType)';
  }

  @override
  bool operator ==(covariant RecipeModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.ingredients, ingredients) &&
        listEquals(other.instructions, instructions) &&
        other.prepTimeMinutes == prepTimeMinutes &&
        other.cookTimeMinutes == cookTimeMinutes &&
        other.servings == servings &&
        other.difficulty == difficulty &&
        other.cuisine == cuisine &&
        other.caloriesPerServing == caloriesPerServing &&
        listEquals(other.tags, tags) &&
        other.userId == userId &&
        other.image == image &&
        other.rating == rating &&
        other.reviewCount == reviewCount &&
        listEquals(other.mealType, mealType);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        ingredients.hashCode ^
        instructions.hashCode ^
        prepTimeMinutes.hashCode ^
        cookTimeMinutes.hashCode ^
        servings.hashCode ^
        difficulty.hashCode ^
        cuisine.hashCode ^
        caloriesPerServing.hashCode ^
        tags.hashCode ^
        userId.hashCode ^
        image.hashCode ^
        rating.hashCode ^
        reviewCount.hashCode ^
        mealType.hashCode;
  }
}
