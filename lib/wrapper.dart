import 'package:anxiety_align/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:anxiety_align/Screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:anxiety_align/screens/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final MyUser? user = Provider.of<MyUser?>(context);
    print(user);

    if(user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}

