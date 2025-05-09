import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/common/bloc/model_state.dart';
import 'package:mobile_me/core/recipes/bloc/recipe_bloc.dart';
import 'package:mobile_me/core/recipes/model/recipe_model.dart';
import 'package:mobile_me/core/recipes/widgets/recipe_item_widget.dart';
import 'package:mobile_me/core/widgets/drawer_widget.dart';
import 'package:mobile_me/core/widgets/header_widget.dart';
import 'package:mobile_me/core/widgets/model_list_builder_widget.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: BlocBuilder<RecipeBloc, ModelState>(
          builder: (context, state) {
            return ModelListBuilderWidget<RecipeModel, RecipeBloc>(
              state: state,
              title: 'Recipes',
              icon: Icons.receipt_long,
              itemBuilder: (context, model) {
                return RecipeItemWidget(recipe: model);
              },
            );
          },
        ),
      ),
    );
  }
}
