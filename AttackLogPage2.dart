import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xff96b4a0),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          child: Column(children: <Widget>[
            SizedBox(height: 150.0),
            Align(
                alignment: Alignment(0.0, -0.55),
                child: Text('rate your attack on a scale from 1 to 10',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 5.0,
                      color: Colors.black,
                    ))),
            SizedBox(height: 80.0),
            Row(children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
              Container(
                width: 60.0,
                height: 60.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
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
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                      side: BorderSide(
                        color: Color(0xff3a8628),
                        width: 4.0,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('1'),
                    ),
                    onPressed: () {}),
              )),
              SizedBox(width:20.0),
              Container(
                width: 60.0,
                height: 60.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
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
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                      side: BorderSide(
                        color: Color(0xff3a8628),
                        width: 4.0,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('2'),
                    ),
                    onPressed: () {}),
              )),
              SizedBox(width:20.0),
              Container(
                width: 60.0,
                height: 60.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
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
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                      side: BorderSide(
                        color: Color(0xff3a8628),
                        width: 4.0,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('3'),
                    ),
                    onPressed: () {}),
              )),
              SizedBox(width:20.0),
              Container(
                width: 60.0,
                height: 60.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
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
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                      side: BorderSide(
                        color: Color(0xff3a8628),
                        width: 4.0,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('4'),
                    ),
                    onPressed: () {}),
              )),
              SizedBox(width:20.0),
              Container(
                width: 60.0,
                height: 60.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
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
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                      ),
                      side: BorderSide(
                        color: Color(0xff3a8628),
                        width: 4.0,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('5'),
                    ),
                    onPressed: () {}),
              )),
            ]),
            SizedBox(height: 50.0),
          Row(children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
            Container(
              width: 60.0,
              height: 60.0,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
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
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                    side: BorderSide(
                      color: Color(0xff3a8628),
                      width: 4.0,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('6'),
                  ),
                  onPressed: () {}),
            )),
            SizedBox(width:20.0),
            Container(
              width: 60.0,
              height: 60.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
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
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                    side: BorderSide(
                      color: Color(0xff3a8628),
                      width: 4.0,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('7'),
                  ),
                  onPressed: () {}),
            )),
            SizedBox(width:20.0),
            Container(
              width: 60.0,
              height: 60.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
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
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                    side: BorderSide(
                      color: Color(0xff3a8628),
                      width: 4.0,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('8'),
                  ),
                  onPressed: () {}),
            )),
            SizedBox(width:20.0),
            Container(
              width: 60.0,
              height: 60.0,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
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
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                    side: BorderSide(
                      color: Color(0xff3a8628),
                      width: 4.0,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('9'),
                  ),
                  onPressed: () {}),
            )),
            SizedBox(width:20.0),
            Container(
              width: 60.0,
              height: 60.0,
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
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
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                    side: BorderSide(
                      color: Color(0xff3a8628),
                      width: 4.0,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('10'),
                  ),
                  onPressed: () {}),
            ),
            ),
                        ]),
            SizedBox(height: 100.0),
            Container(
                child: Row(
                    children: <Widget>[
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
                      SizedBox(height:30.0),
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
                      )])
            )
                      ])
            ),
          ),
        ));
