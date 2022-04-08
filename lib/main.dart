import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:counter/wrapper.dart';
import 'package:counter/models/my_user.dart';
import 'package:counter/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      initialData: null,
      value: AuthService().usersStream,
      child: const MaterialApp(
        title: 'AnxietyAlign',
        home: Wrapper()
      )
    );
  }
}
