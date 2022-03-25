import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    backgroundColor: Color(0xff96b4a0),
    body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(alignment: Alignment(-.7,1),
                child:
                OutlinedButton.icon(
                  label: Text('back'),
                  icon: Icon(Icons.arrow_back_sharp,
                      size: 28),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.white,
                    minimumSize: Size(110.0, 50.0),
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                    side: BorderSide(color: Color(0xff3a8628),
                      width: 4.0,
                    ),
                  ),
                  onPressed: () {},
                )),
            SizedBox(height: 15.0),
            Text('What is the name of your medication?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
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
            Text('What is the dosage?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                  color: Colors.black,
                )),
        SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child:new Flexible(
                child: new Container(
                    width: 300.0,
                    child: TextFormField(
                      style: TextStyle(fontSize: 15, height: .5),
                      keyboardType: TextInputType.number,
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
              ),//flexible
            ),
            SizedBox(width: 15,),
            new Text('mg',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                  color: Colors.black,
                )),//container
          ],
        ),
            SizedBox(height: 15),
            Text('When do you have to take it?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                  color: Colors.black,
                )),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      minimumSize: Size(30.0, 55.0),
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                      side: BorderSide(color: Color(0xff3a8628),
                        width: 4.0,
                      ),
                    ),
                    child: Text('Su'),
                    onPressed: () {},
                  )//flexible
                ),
                SizedBox(width: 15,),
                new Container(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        minimumSize: Size(30.0, 55.0),
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                        side: BorderSide(color: Color(0xff3a8628),
                          width: 4.0,
                        ),
                      ),
                      child: Text('M'),
                      onPressed: () {},
                    )//flexible
                ),
                SizedBox(width: 15,),
                new Container(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        minimumSize: Size(30.0, 55.0),
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                        side: BorderSide(color: Color(0xff3a8628),
                          width: 4.0,
                        ),
                      ),
                      child: Text('Tu'),
                      onPressed: () {},
                    )//flexible
                ),
                SizedBox(width: 15,),
                new Container(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        minimumSize: Size(30.0, 55.0),
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                        side: BorderSide(color: Color(0xff3a8628),
                          width: 4.0,
                        ),
                      ),
                      child: Text('W'),
                      onPressed: () {},
                    )//flexible
                ), //container
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        minimumSize: Size(30.0, 55.0),
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                        side: BorderSide(color: Color(0xff3a8628),
                          width: 4.0,
                        ),
                      ),
                      child: Text('Th'),
                      onPressed: () {},
                    )//flexible
                ),
                SizedBox(width: 15,),
                new Container(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        minimumSize: Size(30.0, 55.0),
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                        side: BorderSide(color: Color(0xff3a8628),
                          width: 4.0,
                        ),
                      ),
                      child: Text('F'),
                      onPressed: () {},
                    )//flexible
                ),
                SizedBox(width: 15,),
                new Container(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        minimumSize: Size(30.0, 55.0),
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                        side: BorderSide(color: Color(0xff3a8628),
                          width: 4.0,
                        ),
                      ),
                      child: Text('Sa'),
                      onPressed: () {},
                    )//flexible
                ), //container
              ],
            ),
            SizedBox(height: 15,),
            Text('How many times per day do you have to take it?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                  color: Colors.black,
                )),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        minimumSize: Size(30.0, 55.0),
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                        side: BorderSide(color: Color(0xff3a8628),
                          width: 4.0,
                        ),
                      ),
                      child: Text('1'),
                      onPressed: () {},
                    )//flexible
                ),
                SizedBox(width: 15,),
                new Container(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        minimumSize: Size(30.0, 55.0),
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                        side: BorderSide(color: Color(0xff3a8628),
                          width: 4.0,
                        ),
                      ),
                      child: Text('2'),
                      onPressed: () {},
                    )//flexible
                ),
                SizedBox(width: 15,),
                new Container(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        minimumSize: Size(30.0, 55.0),
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                        side: BorderSide(color: Color(0xff3a8628),
                          width: 4.0,
                        ),
                      ),
                      child: Text('3'),
                      onPressed: () {},
                    )//flexible
                ),
                SizedBox(width: 15,),
                new Container(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.white,
                        minimumSize: Size(30.0, 55.0),
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                        side: BorderSide(color: Color(0xff3a8628),
                          width: 4.0,
                        ),
                      ),
                      child: Text('4'),
                      onPressed: () {},
                    )//flexible
                ), //container
              ],
            ),
            SizedBox(height: 20.0),
            Align(alignment: Alignment(-.8,.5),
                child:
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
                  child: Text('+ add another'),
                  onPressed: () {},
                )),
            SizedBox(height: 10,),
            Align(alignment: Alignment(.8,-.9),
            child:
            OutlinedButton(
              onPressed: () {},
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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('next'), // <-- Text
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.arrow_forward_sharp,
                      size: 25),
                ],
              ),
            )
              /*OutlinedButton.icon(
              label: Text('next'),
              icon: Icon(Icons.arrow_forward_sharp,
              size: 25),
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
              onPressed: () {},
            )*/
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