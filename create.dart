import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    backgroundColor: Color(0xff96b4a0),
    body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(child: Image.asset('assets/images/logo.png')),
            Text('AnxietyAlign',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                  color: Colors.black,
                )),
            SizedBox(height: 15.0),
            Divider(color:Color(0xffd3fbcd),
                thickness: 2,
                indent: 20,
                endIndent: 20),
            SizedBox(height: 15.0),
            Text('name:',
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
                  style: TextStyle(fontSize: 15, height: .5),
                  decoration: new InputDecoration(
                    labelText: "",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd3fbcd), width: 3.0),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd3fbcd), width: 3.0),
                    ),
                    //fillColor: Colors.green
                  ),
                )),
            SizedBox(height: 15.0),
            Text('email:',
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
                  style: TextStyle(fontSize: 15, height: .5),
                  decoration: new InputDecoration(
                    labelText: "",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd3fbcd), width: 3.0),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd3fbcd), width: 3.0),
                    ),
                    //fillColor: Colors.green
                  ),
                )),
            SizedBox(height: 15.0),
            Text('password:',
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
                  style: TextStyle(fontSize: 15, height: .5),
                  decoration: new InputDecoration(
                    labelText: "",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd3fbcd), width: 3.0),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd3fbcd), width: 3.0),
                    ),
                    //fillColor: Colors.green
                  ),
                )),
            SizedBox(height: 15.0),
            Text('confirm password:',
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
                  style: TextStyle(fontSize: 15, height: .5),
                  decoration: new InputDecoration(
                    labelText: "",
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd3fbcd), width: 3.0),
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd3fbcd), width: 3.0),
                    ),
                    //fillColor: Colors.green
                  ),
                )),
            SizedBox(height: 30.0),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.white,
                minimumSize: Size(110.0, 55.0),
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
                side: BorderSide(color: Color(0xff3a8628),
                  width: 4.0,
                ),
              ),
              child: Text('create account'),
              onPressed: () {},
            ),
            SizedBox(height: 10.0),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
                textStyle: TextStyle(
                    //color: Colors.black,
                    fontSize: 20,
                decoration: TextDecoration.underline)
              ),
              child: Text('already have an account?'),
              onPressed: () {  },
      /*OutlinedButton(
              style: OutlinedButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.white,
                  minimumSize: Size(110.0, 55.0),
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  side: BorderSide(color: Color(0xff3a8628),
                    width: 4.0,
                  )
              ),
              child: Text('already have an account?'),
              onPressed: () {  },*/
            )]
      ),
    ),
    /*floatingActionButton: FloatingActionButton(
      onPressed: (){},
      backgroundColor: Color(0xff96b4a0),
      child: Text('yes'),
    ),*/
  ),
));