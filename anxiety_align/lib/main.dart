import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:anxiety_align/models/user.dart';
import 'package:anxiety_align/services/auth.dart';
import 'package:anxiety_align/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => GestureDetector(
    child: StreamProvider<MyUser?>.value(
      value: AuthService().usersStream,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
        title: 'AnxietyAlign',
        debugShowCheckedModeBanner: false
      )
    ),
    onTap: () => FocusScope.of(context).requestFocus(FocusNode())
  );
}
