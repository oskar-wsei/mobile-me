import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/core/recipes/bloc/recipe_bloc.dart';
import 'package:mobile_me/core/recipes/bloc/recipe_event.dart';
import 'package:mobile_me/core/recipes/bloc/recipe_state.dart';
import 'package:mobile_me/core/recipes/widgets/recipe_item_widget.dart';
import 'package:mobile_me/core/widgets/drawer_widget.dart';
import 'package:mobile_me/core/widgets/header_widget.dart';
import 'package:mobile_me/core/widgets/title_widget.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: BlocBuilder<RecipeBloc, RecipeState>(
          builder: (context, state) {
            if (state is RecipeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is RecipeErrorState) {
              return Center(child: Text('Error: ${state.message}'));
            }

            if (state is RecipeLoadedState) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<RecipeBloc>().add(RecipeLoadEvent());
                },
                child: Column(
                  children: [
                    TitleWidget(title: 'Recipes', icon: Icons.receipt_long),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.separated(
                          itemCount: state.recipes.length,
                          itemBuilder: (context, index) {
                            return RecipeItemWidget(
                              recipe: state.recipes[index],
                            );
                          },
                          separatorBuilder:
                              (context, index) => const SizedBox(height: 8),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
