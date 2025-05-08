import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/core/home/bloc/user_cubit.dart';
import 'package:mobile_me/core/home/bloc/user_state.dart';
import 'package:mobile_me/core/widgets/drawer_widget.dart';
import 'package:mobile_me/core/widgets/header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      drawer: DrawerWidget(),
      body: SafeArea(
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is UserErrorState) {
              return Center(child: Text('Error: ${state.message}'));
            }

            if (state is UserLoadedState) {
              return SingleChildScrollView(
                child: Column(children: [Text(state.user.address.toString())]),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
