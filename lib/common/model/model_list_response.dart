class ModelListResponse<TModel> {
  final List<TModel> items;
  final bool hasNextPage;

  const ModelListResponse({required this.items, required this.hasNextPage});
}
