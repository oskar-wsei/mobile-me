import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/common/bloc/model_bloc.dart';
import 'package:mobile_me/common/bloc/model_event.dart';
import 'package:mobile_me/common/bloc/model_state.dart';

typedef ModelListWidgetItemBuilder<TModel> =
    Widget Function(BuildContext context, TModel mode);

class ModelListWidget<TModel, TModelBloc extends ModelBloc>
    extends StatelessWidget {
  final _scrollController = ScrollController();

  final ModelLoadedState<TModel> state;
  final ModelListWidgetItemBuilder itemBuilder;

  ModelListWidget(this.state, {super.key, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      child: ListView.separated(
        controller: _scrollController,
        itemCount: state.items.length + (state.hasNextPage ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == state.items.length) {
            return SizedBox(
              height: 120,
              child: Center(child: CircularProgressIndicator()),
            );
          }
          return itemBuilder(context, state.items[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 8),
      ),
      onNotification: (notification) {
        if (!state.hasNextPage) return false;

        final extent = _scrollController.position.maxScrollExtent;
        final current = _scrollController.position.pixels;
        final threshold = extent - 200;
        final delta = notification.dragDetails?.delta.dy;
        final hasScrolledBelowThreshold =
            (delta != null &&
                delta < 0 &&
                current >= threshold &&
                current + delta <= threshold);
        final hasScrolledToBottom = current == extent && delta == null;

        if (hasScrolledBelowThreshold || hasScrolledToBottom) {
          context.read<TModelBloc>().add(ModelLoadEvent(page: state.page + 1));
        }
        return false;
      },
    );
  }
}
