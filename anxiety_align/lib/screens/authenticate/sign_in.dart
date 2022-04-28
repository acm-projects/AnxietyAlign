import 'package:anxiety_align/screens/authenticate/authenticate.dart';
import 'package:anxiety_align/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:anxiety_align/screens/authenticate/register.dart';
import 'package:anxiety_align/screens/home.dart';
import 'package:anxiety_align/screens/attack/attack.dart';

class SignIn extends StatefulWidget {
  final bool showSignin;
  SignIn({required this.showSignin});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //field states
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xFF96B4A0),
        /*appBar: AppBar(
          backgroundColor: Color(0xFF96B4A0),
          elevation: 0.0,
          title: Text('Sign in to Anxiety Align'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register'),
              onPressed: () {
                widget.toggleView();
              },
            )
          ],
        ),*/
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 50.0),
            child: Column(children: [
              Container(child: Image.asset('assets/images/Tlogo.png')),
              Container(
                  child: Text("anxietyalign",
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 48,
                          fontFamily: 'WingDing',
                          fontWeight: FontWeight.bold))),
              SizedBox(height: 10.0),
              Divider(
                height: 20,
                thickness: 1,
                color: Color(0xFFD3FBCD),
              ),
              Container(
                  child: Text("username/email:",
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 22,
                          fontFamily: 'WingDing',
                          fontWeight: FontWeight.bold))),
              Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle:
                              TextStyle(fontSize: 16, fontFamily: 'WingDing'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                                color: Color(0xFF97C8A7)),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(16),
                          fillColor: Color(0xFFFFFFFF),
                        ),
                        validator: (String? val) {
                          if (val != null && val.isEmpty) {
                            return "Email cannot be empty";
                          } else if (val != null && !val.contains('@')) {
                            return "Email must be valid";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() => email = val);
                        }),
                    SizedBox(height: 20.0),
                    Container(
                        child: Text("password:",
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 22,
                                fontFamily: 'WingDing',
                                fontWeight: FontWeight.bold))),
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle:
                              TextStyle(fontSize: 16, fontFamily: 'WingDing'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                              color: Color(0xFF97C8A7),
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
                          } else if (val != null && val.length < 6) {
                            return "Password has to be more than 6 characters";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() => password = val);
                        }),
                    SizedBox(height: 30.0),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Color(0xff3a8628))),
                          primary: Colors.black,
                          backgroundColor: Colors.white,
                          minimumSize: Size(100, 55),
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
                          'Sign in',
                          style: TextStyle(fontFamily: 'WingDing', fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() =>
                                  error = 'Username Or Password is Incorrect');
                            } else {
                              {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Attack()));
                              }
                            }
                          }
                        }),
                    SizedBox(height: 10.0),
                    Text(error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0)),
                    TextButton(
                      child: Text(
                        "don't have an account?",
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 15,
                            fontFamily: 'WingDing',
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Register(showSignin: false)));
                      },
                    ),
                  ]))
            ])));
  }
}
