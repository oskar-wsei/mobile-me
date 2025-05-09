import 'package:mobile_me/common/model/model_service.dart';
import 'package:mobile_me/core/recipes/model/recipe_model.dart';

class RecipeService extends ModelService<RecipeModel> {
  @override
  final path = 'recipes';

  @override
  RecipeModel fromMap(Map<String, dynamic> map) {
    return RecipeModel.fromMap(map);
  }
}
