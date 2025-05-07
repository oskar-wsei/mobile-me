import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/core/recipes/bloc/recipe_event.dart';
import 'package:mobile_me/core/recipes/bloc/recipe_state.dart';
import 'package:mobile_me/core/recipes/service/recipe_service.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final _service = RecipeService();

  RecipeBloc() : super(RecipeInitialState()) {
    on<RecipeLoadEvent>((event, emit) async {
      emit(RecipeLoadingState());

      final response = await _service.list();

      response.fold(
        (error) => emit(RecipeErrorState(message: error.message)),
        (recipes) => emit(RecipeLoadedState(recipes: recipes)),
      );
    });

    add(RecipeLoadEvent());
  }
}
