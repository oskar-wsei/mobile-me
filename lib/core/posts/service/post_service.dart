import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_me/common/http/http_error_response.dart';
import 'package:mobile_me/common/service/service_locator.dart';
import 'package:mobile_me/core/posts/model/post_model.dart';

class PostService {
  final http.Client client = locator<http.Client>();

  Future<Either<HttpErrorResponse, List<PostModel>>> list() async {
    final response = await client.get(Uri.https('dummyjson.com', 'posts'));

    if (response.statusCode != HttpStatus.ok) {
      return Left(HttpErrorResponse.fromJson(response.body));
    }

    final body = json.decode(response.body);
    final posts = body['posts'] as List;
    return Right(posts.map((post) => PostModel.fromMap(post)).toList());
  }
}
