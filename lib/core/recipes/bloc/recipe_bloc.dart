import 'package:mobile_me/common/bloc/model_bloc.dart';
import 'package:mobile_me/core/recipes/model/recipe_model.dart';
import 'package:mobile_me/core/recipes/service/recipe_service.dart';

class RecipeBloc extends ModelBloc<RecipeModel, RecipeService> {
  @override
  final service = RecipeService();
}
