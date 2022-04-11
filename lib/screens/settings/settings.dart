import 'package:flutter/material.dart';
import 'package:anxiety_align/screens/home.dart';
import 'package:anxiety_align/screens/graphs/graphs1.dart';
import 'package:anxiety_align/services/auth.dart';
import 'package:anxiety_align/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:anxiety_align/screens/settings/medsettings1.dart';
import 'package:anxiety_align/screens/settings/medsettings2.dart';
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
  List<String> name = <String>[];
  List<String> dosage = <String>[];
  List<int> freq = <int>[];
  List<List<dynamic>> days = [];
  bool _isEnable = false;

  void initState() {
    getUser();
    getMedName();
    getDosage();
    getFreq();
    getDays();
    super.initState();
  }

  Future<void> getUser() async {
    username = (await DatabaseService().getUsernameFromID(userID))!;
    setState(() => username = username);
  }

  Future<void> setUser(String user) async {
    await DatabaseService(userID: userID).setUsername(user);
  }

  Future<void> getMedName() async {
    name = (await DatabaseService(userID: userID).getMedicationName());
    setState(() => name = name);
    print(name);
  }

  Future<void> getDosage() async {
    dosage = (await DatabaseService(userID: userID).getDosage());
    setState(() => dosage = dosage);
    //print(dosage);
  }

  Future<void> getFreq() async {
    freq = (await DatabaseService(userID: userID).getFreq());
    setState(() => freq = freq);
    //print(freq);
  }

  Future<void> getDays() async {
    days = (await DatabaseService(userID: userID).getDays());
    setState(() => days = days);
    //print(days);
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
                      child: !_isEnable
                          ? Text((username ?? 'John'),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 5.0,
                                  color: Colors.black,
                                  fontFamily: 'WingDing'))
                          : TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Name',
                                  hintStyle: TextStyle(
                                      overflow: TextOverflow.visible,
                                      fontSize: 28,
                                      fontFamily: 'WingDing')),
                              initialValue: username ?? 'John Doe',
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (value) {
                                setState(() => {
                                      _isEnable = false,
                                      username = value,
                                      setUser(value)
                                    });
                              })), //flexible
                  Container(
                      child: IconButton(
                    icon: Icon(Icons.mode_edit,
                        size: 40, color: Color(0xffd3fbcd)),
                    onPressed: () {
                      setState(() {
                        _isEnable = true;
                      });
                    },
                  )) //flexible
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
            child: Text('change password', style: TextStyle(fontFamily: 'WingDing', fontWeight: FontWeight.bold)),
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
            child: Text('medication settings', style: TextStyle(fontFamily: 'WingDing', fontWeight: FontWeight.bold)),
            onPressed: () async {
              if (await DatabaseService(userID: userID).getCount() == 0) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MedSettings1()));
              } else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MedSettings2(name: name[0], dosage: dosage[0], freq: freq[0], days: days[0],)));
              }
            },
          )
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
