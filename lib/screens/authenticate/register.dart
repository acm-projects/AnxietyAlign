import 'package:flutter/material.dart';
import 'package:anxiety_align/services/auth.dart';
import 'package:anxiety_align/screens/authenticate/sign_in.dart';
import 'package:anxiety_align/screens/settings/YNMed.dart';

class Register extends StatefulWidget {
  final bool showSignin;
  Register({required this.showSignin});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //field states

  String user = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xFF96B4A0),
        /*appBar: AppBar(
          backgroundColor: Colors.blue[100],
          elevation: 0.0,
          title: Text('Create Account'),
          actions: <Widget>[
            FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Sign In'),
                onPressed: () {
                  widget.toggleView();
                })
          ],
        ),*/
        body: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(children: [
              SizedBox(height: 70.0),

              Container(
                  height: 100.0,
                  width: 120.0,
                  child: Image.asset(
                    'assets/images/Tlogo.png',
                    fit: BoxFit.cover,
                  )),
              Container(
                  child: Text("anxietyalign",
                      style: TextStyle(
                          color: Color(0xFF2A2B2A),
                          fontSize: 48,
                          fontFamily: 'WingDing',
                          fontWeight: FontWeight.bold))),
              Divider(
                height: 20,
                thickness: 1,
                color: Color(0xFFD3FBCD),
              ),
              Container(
                  child: Text("name:",
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 22,
                          fontFamily: 'WingDing',
                          fontWeight: FontWeight.bold))),
              SizedBox(height: 10.0),
              Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Name',
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
                          contentPadding: EdgeInsets.all(10),
                          fillColor: Color(0xFFFFFFFF),
                        ),
                        validator: (String? val) {
                          if (val != null && val.isEmpty) {
                            return "Name cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (val) {
                          setState(() => user = val);
                        }),
                    SizedBox(height: 5.0),
                    Container(
                        child: Text("email:",
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 22,
                                fontFamily: 'WingDing',
                                fontWeight: FontWeight.bold))),
                    SizedBox(height: 10.0),
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
                          contentPadding: EdgeInsets.all(10),
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
                    SizedBox(height: 5.0),
                    Container(
                        child: Text("password:",
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 22,
                                fontFamily: 'WingDing',
                                fontWeight: FontWeight.bold))),
                    SizedBox(height: 10.0),
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
                                color: Color(0xFF97C8A7)),
                          ),
                          filled: true,
                          contentPadding: EdgeInsets.all(10),
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
                    SizedBox(height: 5.0),
                    Container(
                        child: Text("confirm password:",
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 22,
                                fontFamily: 'WingDing',
                                fontWeight: FontWeight.bold))),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
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
                        contentPadding: EdgeInsets.all(10),
                        fillColor: Color(0xFFFFFFFF),
                      ),
                      obscureText: true,
                      validator: (String? val) {
                        if (val != null && val.isEmpty) {
                          return "Password cannot be empty";
                        } else if (val != null && val.length < 6) {
                          return "Password has to be more than 6 characters";
                        } else if (val != null && val != password) {
                          return "Passwords Must Match";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
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
                          'Create Account',
                          style: TextStyle(fontFamily: 'WingDing', fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            dynamic result =
                                await _auth.registerWithEmailAndPassword(
                                    email, password, user);
                            print(result);
                            if (result == null) {
                              setState(() => error = 'Enter a Valid Email');
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => YNMed()));
                            }
                          }
                        }),
                    SizedBox(height: 10.0),
                    Text(error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0)),
                    TextButton(
                      child: Text(
                        "already have an account?",
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
                                    SignIn(showSignin: true)));
                      },
                    ),
                  ]))
            ])));
  }
}
