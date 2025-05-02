import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/core/auth/bloc/auth_cubit.dart';
import 'package:mobile_me/core/auth/bloc/auth_state.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      title: Text(
        'Mobile Me',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      actions: [
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is! AuthAuthenticatedState) return Container();

            final name = '${state.user.firstName} ${state.user.lastName}';

            return Row(
              children: [
                Text(name, style: TextStyle(fontSize: 16)),
                SizedBox(width: 10),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.indigo,
                  child: Text(
                    _createInitials(name),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
              ],
            );
          },
        ),
      ],
    );
  }

  String _createInitials(String name) {
    return name.trim().split(' ').map((e) => e[0]).take(2).join().toUpperCase();
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
