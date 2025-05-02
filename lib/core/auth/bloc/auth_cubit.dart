import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/core/auth/bloc/auth_state.dart';
import 'package:mobile_me/core/auth/model/auth_login_response.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  void setUser(AuthLoginResponse? user) {
    if (user == null) {
      emit(AuthUnauthenticatedState());
    } else {
      emit(AuthAuthenticatedState(user: user));
    }
  }
}
