import 'package:flutter/material.dart';
import 'package:anxiety_align/screens/authenticate/sign_in.dart';
import 'package:anxiety_align/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;


  @override
  Widget build(BuildContext context) {
    if(showSignIn) {
      return SignIn(showSignin: !showSignIn,);
    } else {
      return Register(showSignin: !showSignIn);
    }
  }
}
