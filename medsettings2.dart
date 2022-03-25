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
            Align(alignment: Alignment(-.8,1),
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
            SizedBox(height: 15,),
            Text('Current Medications:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                  color: Colors.black,
                )),
            SizedBox(height: 10,),
            Text('None',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                  color: Colors.black,
                )),
            SizedBox(height: 30.0),
            Align(alignment: Alignment(-.7,1),
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