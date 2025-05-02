import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/common/theme/application_theme.dart';
import 'package:mobile_me/core/auth/bloc/auth_cubit.dart';
import 'package:mobile_me/core/auth/pages/auth_login_page.dart';
import 'package:mobile_me/core/posts/bloc/post_bloc.dart';
import 'package:mobile_me/core/products/bloc/product_bloc.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => PostBloc()),
        BlocProvider(create: (_) => ProductBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mobile Me',
        theme: ApplicationTheme.theme,
        home: AuthLoginPage(),
      ),
    );
  }
}
