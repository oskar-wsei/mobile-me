import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_me/common/http/http_error_response.dart';
import 'package:mobile_me/common/service/service_locator.dart';
import 'package:mobile_me/core/auth/model/auth_login_request.dart';
import 'package:mobile_me/core/auth/model/auth_login_response.dart';

class AuthService {
  final http.Client client = locator<http.Client>();

  Future<Either<HttpErrorResponse, AuthLoginResponse>> login(AuthLoginRequest model) async {
    final response = await client.post(
      Uri.https('dummyjson.com', 'auth/login'),
      body: model.toJson(),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    if (response.statusCode != HttpStatus.ok) {
      return Left(HttpErrorResponse.fromJson(response.body));
    }
    
    return Right(AuthLoginResponse.fromJson(response.body));
  }
}