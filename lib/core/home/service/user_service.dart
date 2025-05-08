import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_me/common/http/http_error_response.dart';
import 'package:mobile_me/common/service/service_locator.dart';
import 'package:mobile_me/core/home/model/user_model.dart';

class UserService {
  final http.Client client = locator<http.Client>();

  Future<Either<HttpErrorResponse, UserModel>> getUser(int id) async {
    final response = await client.get(Uri.https('dummyjson.com', 'users/$id'));

    if (response.statusCode != HttpStatus.ok) {
      return Left(HttpErrorResponse.fromJson(response.body));
    }

    return Right(UserModel.fromJson(response.body));
  }
}
