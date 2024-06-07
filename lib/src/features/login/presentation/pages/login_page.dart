import 'package:admin_panel/src/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';

const users =  {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'academy',
  'admin@gamil.com': '123',
};

class LoginPage extends StatelessWidget {
  static const loginPageName = '/login-page';
  const LoginPage({super.key});
  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return '';
    });
  }
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'ACADEMY Panel',
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        context.goNamed(HomePage.homePageName);
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
