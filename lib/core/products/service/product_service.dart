import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_me/common/http/http_error_response.dart';
import 'package:mobile_me/common/service/service_locator.dart';
import 'package:mobile_me/core/products/model/product_model.dart';

class ProductService {
  final http.Client client = locator<http.Client>();

  Future<Either<HttpErrorResponse, List<ProductModel>>> list() async {
    final response = await client.get(Uri.https('dummyjson.com', 'products'));

    if (response.statusCode != HttpStatus.ok) {
      return Left(HttpErrorResponse.fromJson(response.body));
    }

    final body = json.decode(response.body);
    final posts = body['products'] as List;
    return Right(posts.map((post) => ProductModel.fromMap(post)).toList());
  }
}
