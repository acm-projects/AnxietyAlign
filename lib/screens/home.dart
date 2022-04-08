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
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
              child: Column(children: <Widget>[
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
                    ]), //container
                SizedBox(height: 20.0),
                Divider(
                    color: Color(0xffd3fbcd),
                    thickness: 2,
                    indent: 20,
                    endIndent: 20),
                SizedBox(height: 30.0),
                OutlinedButton(
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
                  child: Text(
                    'Statistics',
                    style: TextStyle(
                        fontFamily: 'WingDing', fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Graphs1()));
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
                  child: Text('Journal',
                      style: TextStyle(
                          fontFamily: 'WingDing', fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Journal()));
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
                  child: Text('Attack Log',
                      style: TextStyle(
                          fontFamily: 'WingDing', fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Attack()));
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
                  child: Text('Settings',
                      style: TextStyle(
                          fontFamily: 'WingDing', fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settings()));
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
                    fixedSize: const Size(280, 55),
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                    side: BorderSide(
                      color: Colors.red,
                      width: 4.0,
                    ),
                  ),
                  child: Text('Log Out',
                      style: TextStyle(
                          fontFamily: 'WingDing', fontWeight: FontWeight.bold)),
                  onPressed: () async {
                    await _auth.signOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignIn(showSignin: true)));
                  },
                )
              ]),
              /*floatingActionButton: FloatingActionButton(
      onPressed: (){},
      backgroundColor: Color(0xff96b4a0),
      child: Text('yes'), ``
    ),*/
            )));
  }
}
