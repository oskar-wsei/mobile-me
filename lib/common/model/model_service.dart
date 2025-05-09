import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_me/common/http/http_error_response.dart';
import 'package:mobile_me/common/model/model_list_response.dart';
import 'package:mobile_me/common/service/service_locator.dart';

abstract class ModelService<TModel> {
  final http.Client client = locator<http.Client>();
  final authority = 'dummyjson.com';

  abstract final String path;

  TModel fromMap(Map<String, dynamic> map);

  Future<Either<HttpErrorResponse, ModelListResponse<TModel>>> list(
    int page,
  ) async {
    final limit = 10;
    final skip = limit * (page - 1);
    final query = {'limit': limit.toString(), 'skip': skip.toString()};

    final response = await client.get(Uri.https(authority, path, query));

    if (response.statusCode != HttpStatus.ok) {
      return Left(HttpErrorResponse.fromJson(response.body));
    }

    final body = json.decode(response.body);
    final items = body[path] as List;
    final total = body['total'] as int;
    final hasNextPage = limit + skip < total;
    final models = items.map((item) => fromMap(item)).toList();

    return Right(ModelListResponse(items: models, hasNextPage: hasNextPage));
  }
}
