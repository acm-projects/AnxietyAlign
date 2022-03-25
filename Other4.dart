import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Scaffold(
        backgroundColor: Color(0xff96b4a0),
        body: Center(
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 60.0),
                child: Image(
                  image: AssetImage('assets/q.png'),
                ),
              ),
              Align(
                  alignment: Alignment(0.0, -0.15),
                  child: Text('what did you do to calm down?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5.0,
                        color: Colors.black,
                      ))),
              SizedBox(height: 40.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Color(0xff3a8628))),
                      primary: Colors.black,
                      backgroundColor: Color(0xffd3fbcd),
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
              SizedBox(height: 30.0),
              Text('enter text here (5 words max): ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 3.0,
                    color: Colors.black,
                  )),
              SizedBox(height: 30.0),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 50),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Color(0xff3a8628), width: 3),
                            borderRadius: BorderRadius.circular(7.5)),
                        filled: true,
                        fillColor: Colors.white),
                    keyboardType: TextInputType.text,
                  )),
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
            ])))));