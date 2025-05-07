import 'package:flutter/material.dart';
import 'package:mobile_me/common/utils/navigation_utils.dart';
import 'package:mobile_me/core/recipes/model/recipe_model.dart';
import 'package:mobile_me/core/recipes/pages/recipe_page.dart';
import 'package:mobile_me/core/recipes/widgets/recipe_difficulty_widget.dart';
import 'package:mobile_me/core/widgets/image_widget.dart';
import 'package:mobile_me/core/widgets/rating_widget.dart';
import 'package:mobile_me/core/widgets/tags_widget.dart';

class RecipeItemWidget extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeItemWidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          InkWell(
            onTap:
                () => NavigationUtils.push(context, RecipePage(recipe: recipe)),
            child: Column(
              children: [
                ImageWidget(source: recipe.image),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      recipe.name,
                      style: const TextStyle(
                        fontSize: 24,
                        height: 0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: RecipeDifficultyWidget(
                      difficulty: recipe.difficulty,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                TagsWidget(tags: recipe.tags),
                SizedBox(height: 4),
                _TextIconWidget(
                  Icons.menu_book,
                  '${recipe.prepTimeMinutes} min preparation',
                ),
                _TextIconWidget(
                  Icons.timer_outlined,
                  '${recipe.cookTimeMinutes} min cooking',
                ),
                _TextIconWidget(
                  Icons.restaurant,
                  '${recipe.servings} servings',
                ),
                _TextIconWidget(
                  Icons.local_pizza,
                  '${recipe.caloriesPerServing} kcal',
                ),
                RatingWidget(rating: recipe.rating),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TextIconWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const _TextIconWidget(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Padding(padding: EdgeInsets.only(bottom: 3), child: Icon(icon)),
        Text(text),
      ],
    );
  }
}
