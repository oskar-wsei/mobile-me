import 'package:mobile_me/core/auth/model/auth_login_response.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class AuthUnauthenticatedState extends AuthState {}

class AuthAuthenticatedState extends AuthState {
  final AuthLoginResponse user;

  AuthAuthenticatedState({required this.user});
}
