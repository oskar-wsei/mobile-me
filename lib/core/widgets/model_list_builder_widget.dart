import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/common/bloc/model_bloc.dart';
import 'package:mobile_me/common/bloc/model_event.dart';
import 'package:mobile_me/common/bloc/model_state.dart';
import 'package:mobile_me/core/widgets/model_list_widget.dart';
import 'package:mobile_me/core/widgets/title_widget.dart';

class ModelListBuilderWidget<TModel, TModelBloc extends ModelBloc>
    extends StatelessWidget {
  final ModelState state;
  final String title;
  final IconData icon;
  final ModelListWidgetItemBuilder itemBuilder;

  const ModelListBuilderWidget({
    super.key,
    required this.state,
    required this.title,
    required this.icon,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final state = this.state;

    if (state is ModelLoadingState) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state is ModelErrorState) {
      return Center(child: Text('Error: ${state.message}'));
    }

    if (state is ModelLoadedState<TModel>) {
      return RefreshIndicator(
        onRefresh: () async {
          context.read<TModelBloc>().add(ModelLoadEvent());
        },
        child: Column(
          children: [
            TitleWidget(title: title, icon: icon),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ModelListWidget<TModel, TModelBloc>(
                  state,
                  itemBuilder: itemBuilder,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container();
  }
}
