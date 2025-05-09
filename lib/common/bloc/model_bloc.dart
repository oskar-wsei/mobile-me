import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/common/bloc/model_event.dart';
import 'package:mobile_me/common/bloc/model_state.dart';
import 'package:mobile_me/common/model/model_service.dart';

abstract class ModelBloc<TModel, TService extends ModelService>
    extends Bloc<ModelEvent, ModelState> {
  abstract final TService service;

  ModelBloc() : super(ModelInitialState()) {
    on<ModelLoadEvent>((event, emit) async {
      // Show the full-screen loader only when loading the first page
      // Otherwise inline list loader should be shown
      if (event.page == 1) emit(ModelLoadingState());

      final state = this.state;

      // If next page is requested prepare cached items to be
      // prepended before loaded items in state
      final existingItems =
          state is ModelLoadedState<TModel> ? state.items : [];

      final response = await service.list(event.page);

      response.fold(
        (error) => emit(ModelErrorState(message: error.message)),
        (response) => emit(
          ModelLoadedState<TModel>(
            items: [...existingItems, ...response.items],
            page: event.page,
            hasNextPage: response.hasNextPage,
          ),
        ),
      );
    });

    add(ModelLoadEvent());
  }
}
