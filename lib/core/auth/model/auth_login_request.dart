import 'dart:convert';

class AuthLoginRequest {
  final String username;
  final String password;
  final int expiresInMins;

  AuthLoginRequest({
    required this.username,
    required this.password,
    required this.expiresInMins,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'expiresInMins': expiresInMins,
    };
  }

  factory AuthLoginRequest.fromMap(Map<String, dynamic> map) {
    return AuthLoginRequest(
      username: map['username'],
      password: map['password'],
      expiresInMins: map['expiresInMins'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthLoginRequest.fromJson(String source) =>
      AuthLoginRequest.fromMap(json.decode(source));

  @override
  String toString() =>
      'AuthLoginModel(username: $username, password: $password, expiresInMins: $expiresInMins)';
}
