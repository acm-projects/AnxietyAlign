import 'package:flutter/material.dart';
import 'package:counter/pages/auth/sign_in.dart';
import 'package:counter/pages/auth/register.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);
  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool _showSignInPage = true;
  @override
  Widget build(BuildContext context) => GestureDetector(
    child: _showSignInPage ? SignIn(toggleView: toggleView) :
      Register(toggleView: toggleView),
    onTap: () => FocusScope.of(context).requestFocus(FocusNode())
  );
  void toggleView() => setState(() => _showSignInPage = !_showSignInPage);
}
