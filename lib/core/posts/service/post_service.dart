import 'package:mobile_me/common/model/model_service.dart';
import 'package:mobile_me/core/posts/model/post_model.dart';

class PostService extends ModelService<PostModel> {
  @override
  final path = 'posts';

  @override
  PostModel fromMap(Map<String, dynamic> map) {
    return PostModel.fromMap(map);
  }
}
