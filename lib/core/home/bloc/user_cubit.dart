import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/core/auth/bloc/auth_cubit.dart';
import 'package:mobile_me/core/auth/bloc/auth_state.dart';
import 'package:mobile_me/core/home/bloc/user_state.dart';
import 'package:mobile_me/core/home/service/user_service.dart';

class UserCubit extends Cubit<UserState> {
  final AuthCubit authCubit;
  final _service = UserService();

  UserCubit({required this.authCubit}) : super(UserInitialState()) {
    authCubit.stream.listen((authState) {
      if (authState is AuthAuthenticatedState) {
        loadUserData(authState.user.id);
      } else {
        emit(UserErrorState(message: 'User not authenticated'));
      }
    });

    final currentAuthState = authCubit.state;
    if (currentAuthState is AuthAuthenticatedState) {
      loadUserData(currentAuthState.user.id);
    }
  }

  Future<void> loadUserData(int userId) async {
    emit(UserLoadingState());

    final response = await _service.getUser(userId);

    response.fold(
      (error) => emit(UserErrorState(message: error.message)),
      (user) => emit(UserLoadedState(user: user)),
    );
  }
}
