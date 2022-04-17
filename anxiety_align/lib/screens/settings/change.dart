import 'package:flutter/material.dart';
import 'package:anxiety_align/widgets/bottombar.dart';
import 'package:anxiety_align/services/auth.dart';
import 'package:anxiety_align/screens/settings/settings.dart';


class ChangePass extends StatefulWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  _ChangePassState createState() => _ChangePassState();
}

Widget _buildPopupDialog(
    BuildContext context, String text, String subtext, bool changeScreen) {
  return new AlertDialog(
    title: Text(text),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(subtext),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          if (changeScreen) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Settings()));
          } else {
            Navigator.of(context).pop();
          }
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}

class _ChangePassState extends State<ChangePass> {
  final AuthService _auth = AuthService();
  String oldPassword = '';
  String newPass = '';
  String confirmPass = '';
  String error = '';
  String title = '';
  bool change = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xff96b4a0),
        bottomNavigationBar: BottomBar(),
        body: SingleChildScrollView(
          reverse: true,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 30.0),
                Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_sharp, size: 40),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Settings()));
                      },
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(children: [
                    Container(child: Image.asset('assets/images/Tlogo.png')),
                    Text('AnxietyAlign',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5.0,
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                        color: Color(0xffd3fbcd),
                        thickness: 2,
                        indent: 20,
                        endIndent: 20),
                    SizedBox(height: 15.0),
                    Text('current password:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5.0,
                          color: Colors.black,
                        )),
                    SizedBox(height: 15.0),
                    Container(
                      width: 300.0,
                      child: TextFormField(
                          decoration: InputDecoration(
                            hintStyle:
                                TextStyle(fontSize: 16, fontFamily: 'WingDing'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                width: 3,
                                style: BorderStyle.none,
                                color: Color(0xffd3fbcd),
                              ),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.all(16),
                            fillColor: Color(0xFFFFFFFF),
                          ),
                          obscureText: true,
                          validator: (String? val) {
                            if (val != null && val.length == 0) {
                              return "Password cannot be empty";
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() => oldPassword = val);
                          }),
                    ),
                    SizedBox(height: 15.0),
                    Text('new password:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5.0,
                          color: Colors.black,
                        )),
                    SizedBox(height: 15.0),
                    Container(
                      width: 300.0,
                      child: TextFormField(
                          decoration: InputDecoration(
                            hintStyle:
                                TextStyle(fontSize: 16, fontFamily: 'WingDing'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                width: 3,
                                style: BorderStyle.none,
                                color: Color(0xffd3fbcd),
                              ),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.all(16),
                            fillColor: Color(0xFFFFFFFF),
                          ),
                          obscureText: true,
                          validator: (String? val) {
                            if (val != null && val.length == 0) {
                              return "New Password cannot be empty";
                            } else if (val != null && val.length < 6) {
                              return "New Password has to be more than 6 characters";
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() => newPass = val);
                          }),
                    ),
                    SizedBox(height: 5.0),
                    Text('confirm new password:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5.0,
                          color: Colors.black,
                        )),
                    SizedBox(height: 15.0),
                    Container(
                      width: 300.0,
                      child: TextFormField(
                          decoration: InputDecoration(
                            hintStyle:
                                TextStyle(fontSize: 16, fontFamily: 'WingDing'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                width: 3,
                                style: BorderStyle.none,
                                color: Color(0xffd3fbcd),
                              ),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.all(16),
                            fillColor: Color(0xFFFFFFFF),
                          ),
                          obscureText: true,
                          validator: (String? val) {
                            if (val != null && val.length == 0) {
                              return "New Password cannot be empty";
                            } else if (val != null && val != newPass) {
                              return "New Password must match";
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() => confirmPass = val);
                          }),
                    ),
                    SizedBox(height: 25.0),
                    //SizedBox(height: 30.0),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Color(0xff3a8628))),
                          primary: Colors.black,
                          backgroundColor: Colors.white,
                          minimumSize: Size(110, 55),
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
                        child: Text('change password'),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            dynamic result =
                                _auth.changePassword(oldPassword, newPass);
                            if (result == null) {
                              title = 'FAILURE!';
                              setState(() => error = 'Password Change Failed');
                            } else {
                              error = 'Password Changed Success';
                              title = 'SUCCESS!';
                              change = true;
                            }
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    _buildPopupDialog(
                                        context, title, error, change));
                          }
                        }),
                    SizedBox(height: 30.0)
                  ]),
                ),
              ],
            ),
          ),
          /*floatingActionButton: FloatingActionButton(
      onPressed: (){},
      backgroundColor: Color(0xff96b4a0),
      child: Text('yes'),
    ),*/
        ));
  }
}
