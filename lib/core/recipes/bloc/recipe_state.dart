import 'package:mobile_me/core/recipes/model/recipe_model.dart';

abstract class RecipeState {}

class RecipeInitialState extends RecipeState {}

class RecipeLoadingState extends RecipeState {}

class RecipeLoadedState extends RecipeState {
  final List<RecipeModel> recipes;

  RecipeLoadedState({required this.recipes});
}

class RecipeErrorState extends RecipeState {
  final String message;

  RecipeErrorState({required this.message});
}
