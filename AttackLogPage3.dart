import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xff96b4a0),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            child: Column(children: <Widget>[
              SizedBox(height: 75.0),
              Align(
                  alignment: Alignment(0.0, -0.55),
                  child: Text('what was the source of your anxious feeling?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 5.0,
                        color: Colors.black,
                      ))),
              SizedBox(height: 50.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Color(0xff3a8628))),
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      minimumSize: Size(75.0, 45.0),
                      textStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: 3.0,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      side: BorderSide(
                        color: Color(0xff3a8628),
                        width: 4.0,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('   conflict with a loved one'),
                    ),
                    onPressed: () {}),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Color(0xff3a8628))),
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      minimumSize: Size(75.0, 45.0),
                      textStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: 3.0,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      side: BorderSide(
                        color: Color(0xff3a8628),
                        width: 4.0,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('   a social event'),
                    ),
                    onPressed: () {}),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Color(0xff3a8628))),
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      minimumSize: Size(75.0, 45.0),
                      textStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: 3.0,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      side: BorderSide(
                        color: Color(0xff3a8628),
                        width: 4.0,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('   academic stress'),
                    ),
                    onPressed: () {}),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Color(0xff3a8628))),
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      minimumSize: Size(75.0, 45.0),
                      textStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: 3.0,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      side: BorderSide(
                        color: Color(0xff3a8628),
                        width: 4.0,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('   financial distress'),
                    ),
                    onPressed: () {}),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Color(0xff3a8628))),
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      minimumSize: Size(75.0, 45.0),
                      textStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: 3.0,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                      side: BorderSide(
                        color: Color(0xff3a8628),
                        width: 4.0,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('   other'),
                    ),
                    onPressed: () {}),
              ),
              SizedBox(height: 50.0),
              Container(
                  child: Row(children: <Widget>[
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Color(0xff3a8628))),
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        minimumSize: Size(100.0, 45.0),
                        textStyle: TextStyle(
                          color: Colors.black,
                          letterSpacing: 3.0,
                          fontSize: 22.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                        side: BorderSide(
                          color: Color(0xff3a8628),
                          width: 4.0,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('prev'),
                      ),
                      onPressed: () {}),
                )),
                SizedBox(height: 30.0),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Color(0xff3a8628))),
                          primary: Colors.black,
                          backgroundColor: Colors.white,
                          minimumSize: Size(100.0, 45.0),
                          textStyle: TextStyle(
                            color: Colors.black,
                            letterSpacing: 3.0,
                            fontSize: 22.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                          side: BorderSide(
                            color: Color(0xff3a8628),
                            width: 4.0,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('next'),
                        ),
                        onPressed: () {}),
                  ),
                )
              ]))
            ])),
      ),
    ));
