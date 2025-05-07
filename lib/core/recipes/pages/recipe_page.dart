import 'package:flutter/material.dart';
import 'package:mobile_me/core/recipes/model/recipe_model.dart';
import 'package:mobile_me/core/widgets/drawer_widget.dart';
import 'package:mobile_me/core/widgets/header_widget.dart';
import 'package:mobile_me/core/widgets/image_widget.dart';
import 'package:mobile_me/core/widgets/text_list_widget.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key, required this.recipe});

  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageWidget(
                source: recipe.image,
                borderRadius: BorderRadius.zero,
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.name,
                      style: const TextStyle(
                        fontSize: 24,
                        height: 0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    _SectionTitleWidget(Icons.egg, 'Ingredients'),
                    SizedBox(height: 8),
                    TextListWidget(recipe.ingredients),
                    SizedBox(height: 16),
                    _SectionTitleWidget(Icons.blender, 'Instructions'),
                    SizedBox(height: 8),
                    TextListWidget(
                      recipe.instructions,
                      type: TextListType.ordered,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitleWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const _SectionTitleWidget(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Padding(padding: EdgeInsets.only(bottom: 3), child: Icon(icon)),
        Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
