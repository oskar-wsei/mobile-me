abstract class ModelEvent {}

class ModelLoadEvent extends ModelEvent {
  final int page;

  ModelLoadEvent({this.page = 1});
}
