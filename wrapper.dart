import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:counter/models/my_user.dart';
import 'package:counter/pages/auth/auth.dart';
import 'package:counter/pages/attack/attack.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MyUser? user = Provider.of<MyUser?>(context);
    return user == null ? const Auth() : const Attack();
  }
}
