import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    backgroundColor: Color(0xff96b4a0),
    bottomNavigationBar: BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(icon: Icon(Icons.bar_chart, size:50, color: Color(0xff3a8628)), onPressed: () {}),
          SizedBox(width: 40),
          IconButton(icon: Icon(Icons.face_rounded, size: 50, color: Color(0xff3a8628)), onPressed: () {}),
          SizedBox(width: 40,),
          IconButton(icon: Icon(Icons.book_rounded, size: 50, color: Color(0xff3a8628)), onPressed: () {}),
        ],
      ),
    ),
    body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(alignment: Alignment(-.9,1),
                child:
                OutlinedButton.icon(
                  label: Text('back'),
                  icon: Icon(Icons.arrow_back_sharp,
                      size: 28),
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
                )),
            SizedBox(height: 10,),
            Text('Current Medications:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                  color: Colors.black,
                )),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                 Text('Name:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5.0,
                      color: Colors.black,
                    )),
                 SizedBox(width: 10,),
                 Text('medhere',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5.0,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    )),//container
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Dosage:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5.0,
                      color: Colors.black,
                    )),
                SizedBox(width: 10,),
                Text('sizehere',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5.0,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    )),
                SizedBox(width: 10,),
                Text('mg',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5.0,
                      color: Colors.black,
                    ))//container
              ],
            ),
            SizedBox(height: 30,),
            Text('Frequency per week:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                  color: Colors.black,
                )),
            SizedBox(height: 10,),
            Text('dayshere',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                )),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Frequency per day:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5.0,
                      color: Colors.black,
                    )),
                Text('n',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5.0,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ))//container
              ],
            ),
            SizedBox(height: 30,),
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
                      child: Text('edit'),
                      onPressed: () {},
                    )//flexible
                ),
                SizedBox(width: 120,),
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
                      onPressed: () {},
                    )//flexible
                ), //container
              ],
            ),
            SizedBox(height: 30.0),
            Align(alignment: Alignment(-.9,1),
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
            SizedBox(height: 30.0)]
      ),
    ),
    /*floatingActionButton: FloatingActionButton(
      onPressed: (){},
      backgroundColor: Color(0xff96b4a0),
      child: Text('yes'),
    ),*/
  ),
));