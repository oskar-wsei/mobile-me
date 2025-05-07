import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_me/common/http/http_error_response.dart';
import 'package:mobile_me/common/service/service_locator.dart';
import 'package:mobile_me/core/recipes/model/recipe_model.dart';

class RecipeService {
  final http.Client client = locator<http.Client>();

  Future<Either<HttpErrorResponse, List<RecipeModel>>> list() async {
    final response = await client.get(Uri.https('dummyjson.com', 'recipes'));

    if (response.statusCode != HttpStatus.ok) {
      return Left(HttpErrorResponse.fromJson(response.body));
    }

    final body = json.decode(response.body);
    final recipes = body['recipes'] as List;
    return Right(recipes.map((recipe) => RecipeModel.fromMap(recipe)).toList());
  }
}
