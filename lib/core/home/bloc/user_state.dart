import 'package:mobile_me/core/home/model/user_model.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final UserModel user;

  UserLoadedState({required this.user});
}

class UserErrorState extends UserState {
  final String message;

  UserErrorState({required this.message});
}
