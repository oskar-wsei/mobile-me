import 'package:mobile_me/common/bloc/model_bloc.dart';
import 'package:mobile_me/core/posts/model/post_model.dart';
import 'package:mobile_me/core/posts/service/post_service.dart';

class PostBloc extends ModelBloc<PostModel, PostService> {
  @override
  final service = PostService();
}
