import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/core/posts/bloc/post_event.dart';
import 'package:mobile_me/core/posts/bloc/post_state.dart';
import 'package:mobile_me/core/posts/service/post_service.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final _service = PostService();

  PostBloc() : super(PostInitialState()) {
    on<PostLoadEvent>((event, emit) async {
      emit(PostLoadingState());

      final response = await _service.list();

      response.fold(
        (error) => emit(PostErrorState(message: error.message)),
        (posts) => emit(PostLoadedState(posts: posts)),
      );
    });

    add(PostLoadEvent());
  }
}
