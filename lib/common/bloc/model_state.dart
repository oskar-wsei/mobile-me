abstract class ModelState {}

class ModelInitialState extends ModelState {}

class ModelLoadingState extends ModelState {}

class ModelLoadedState<TModel> extends ModelState {
  final List<TModel> items;
  final int page;
  final bool hasNextPage;

  ModelLoadedState({
    required this.items,
    required this.page,
    required this.hasNextPage,
  });
}

class ModelErrorState extends ModelState {
  final String message;

  ModelErrorState({required this.message});
}
