import 'package:anxiety_align/services/auth.dart';
import 'package:flutter/material.dart';
import'package:anxiety_align/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:anxiety_align/models/user.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return StreamProvider<MyUser?>.value(
        initialData: null,
        value: AuthService().usersStream,
          child: MaterialApp(
            title: 'AnxietyAlign',
            debugShowCheckedModeBanner: false,
            home: Wrapper(),
      ),
    );
  }
}
