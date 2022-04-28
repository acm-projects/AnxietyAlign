import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anxiety_align/services/auth.dart';
import 'package:anxiety_align/screens/graphs/graphs1.dart';
import 'package:anxiety_align/screens/settings/settings.dart';
import 'package:flutter/rendering.dart';
import 'package:anxiety_align/screens/authenticate/sign_in.dart';
import 'package:anxiety_align/services/database.dart';
import 'package:anxiety_align/screens/journal/journal.dart';
import 'package:anxiety_align/widgets/bottombar.dart';
import 'package:anxiety_align/screens/attack/attack.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showSignIn = true;
  final AuthService _auth = AuthService();
  late String userID = AuthService().currUserID!;
  String? username;
  bool _isEnable = false;

  void initState() {
    getUser();
    super.initState();
  }

  Future<void> getUser() async {
    username = (await DatabaseService().getUsernameFromID(userID));
    setState(() => username = username);
  }

  Future<void> setUser(String user) async {
    await DatabaseService(userID: userID).setUsername(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff96b4a0),
        bottomNavigationBar: BottomBar(),
        body: SingleChildScrollView(
            reverse: true,
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buttonSpace(80.0),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                        child: Icon(
                          Icons.face_rounded,
                          size: 100,
                          color: Colors.white
                        )
                      ),
                      nameDisplay(),
                      buttonSpace(40.0),
                      button("Log Attack", Attack(), Colors.red),
                      buttonSpace(40.0),
                      button("Journal", Journal(), Color(0xff3a8628)),
                      buttonSpace(40.0),
                      button("Statistics", Graphs1(), Color(0xff3a8628)),
                      buttonSpace(40.0),
                      button("Settings", Settings(), Color(0xff3a8628)),
                      buttonSpace(40.0),
                      signOut(),
                    ]))));
  }

  Widget button(String text, Widget navigate, Color color) => OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: BorderSide(color: color)),
          primary: Colors.black,
          backgroundColor: Colors.white,
          fixedSize: const Size(280, 55),
          textStyle: TextStyle(
            color: Colors.black,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
          side: BorderSide(
            color: color,
            width: 4.0,
          ),
        ),
        child: Text(text,
            style:
                TextStyle(fontFamily: 'WingDing', fontWeight: FontWeight.bold)),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => navigate));
        },
      );

  Widget buttonSpace(double height) => SizedBox(height: height);

  Widget nameDisplay() => Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Wrap(children: [
              Container(
                  width: 250,
                  child: Text((username ?? 'John'),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5.0,
                          color: Colors.black,
                          fontFamily: 'WingDing'))), //flexible//flexible
            ])
          ]);

  Widget signOut() => OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Color(0xff3a8628))),
        primary: Colors.black,
        backgroundColor: Colors.white,
        fixedSize: const Size(280, 55),
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
        side: BorderSide(
          color: Color(0xff3a8628),
          width: 4.0,
        ),
      ),
      child: Text('Log Out',
          style:
              TextStyle(fontFamily: 'WingDing', fontWeight: FontWeight.bold)),
      onPressed: () async {
        await _auth.signOut();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SignIn(showSignin: true)));
      });
}
