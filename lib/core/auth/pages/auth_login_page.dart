import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_me/common/utils/navigation_utils.dart';
import 'package:mobile_me/core/auth/bloc/auth_cubit.dart';
import 'package:mobile_me/core/auth/model/auth_login_request.dart';
import 'package:mobile_me/core/auth/service/auth_service.dart';
import 'package:mobile_me/core/home/pages/home_page.dart';

class AuthLoginPage extends StatefulWidget {
  const AuthLoginPage({super.key});

  @override
  State<AuthLoginPage> createState() => _AuthLoginPageState();
}

class _AuthLoginPageState extends State<AuthLoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Sign in',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(hintText: 'Username'),
              controller: _usernameController,
              onChanged: (_) => _setErrorMessage(null),
            ),
            SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(hintText: 'Password'),
              controller: _passwordController,
              onChanged: (_) => _setErrorMessage(null),
              obscureText: true,
            ),
            _buildErrorMessage(),
            SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 48),
              ),
              onPressed: _signIn,
              child: Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorMessage() {
    final errorMessage = _errorMessage;
    return errorMessage == null
        ? Container()
        : Column(
          children: [
            SizedBox(height: 32),
            Text(errorMessage, style: TextStyle(color: Colors.red)),
          ],
        );
  }

  _setErrorMessage(String? errorMessage) {
    _errorMessage = errorMessage;
    setState(() {});
  }

  _signIn() async {
    _setErrorMessage(null);

    final request = AuthLoginRequest(
      username: _usernameController.text,
      password: _passwordController.text,
      expiresInMins: 120,
    );

    final response = await AuthService().login(request);

    response.fold((error) {
      _setErrorMessage(error.message);
    }, (response) {
      context.read<AuthCubit>().setUser(response);
      NavigationUtils.pushAndRemove(context, const HomePage());
    });
  }
}
