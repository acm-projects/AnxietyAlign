import 'package:flutter/material.dart';
import 'package:anxiety_align/screens/home.dart';
import 'package:anxiety_align/screens/graphs/graphs1.dart';
import 'package:anxiety_align/services/auth.dart';
import 'package:anxiety_align/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:anxiety_align/screens/settings/medication_list.dart';
import 'package:anxiety_align/screens/settings/change.dart';
import 'package:anxiety_align/widgets/bottombar.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  late User currUser = AuthService().currUser!;
  late String userID = AuthService().currUserID!;
  String? username;
  bool _isEnable = false;

  void initState() {
    getUser();
    super.initState();
  }

  Future<void> getUser() async {
    username = (await DatabaseService().getUsernameFromID(userID))!;
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
        child: Column(children: <Widget>[
          SizedBox(height: 30.0),
          Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back_sharp, size: 40),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
              )),
          SizedBox(height: 90.0),
          Icon(Icons.face_rounded, size: 100, color: Colors.white),
          Row(
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
              ]),
          SizedBox(height: 5),
          Text('Email:',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 5.0,
                color: Colors.black,
              )),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(currUser.email!,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                  color: Colors.black,
                  //decoration: TextDecoration.underline,
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
              color: Color(0xffd3fbcd),
              thickness: 2,
              indent: 20,
              endIndent: 20),
          SizedBox(height: 20.0),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Color(0xff3a8628))),
              primary: Colors.black,
              backgroundColor: Colors.white,
              fixedSize: const Size(320, 55),
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
            child: Text('change password',
                style: TextStyle(
                    fontFamily: 'WingDing', fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChangePass()));
            },
          ),
          SizedBox(height: 30.0),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Color(0xff3a8628))),
                primary: Colors.black,
                backgroundColor: Colors.white,
                fixedSize: const Size(320, 55),
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
              child: Text('medication settings',
                  style: TextStyle(
                      fontFamily: 'WingDing', fontWeight: FontWeight.bold)),
              onPressed: () async => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MedicationList()))),
        ]),
      ),
      /*floatingActionButton: FloatingActionButton(
      onPressed: (){},
      backgroundColor: Color(0xff96b4a0),
      child: Text('yes'),
    ),*/
    );
  }
}
