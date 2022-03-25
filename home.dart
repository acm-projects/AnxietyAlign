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
          children: <Widget>[
            Icon(Icons.face_rounded,
                size:100,
                color:Colors.white
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                    child: Text('John Doe',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5.0,
                          color: Colors.black,
                        ))//flexible
                ),
                new Container(
                    child: Align(
                      alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.mode_edit,
                        size:40,
                        color:Color(0xffd3fbcd)
                    )))//flexible
                ),//container
              ],
            ),
            SizedBox(height: 20.0),
            Divider(color:Color(0xffd3fbcd),
                thickness: 2,
                indent: 20,
                endIndent: 20),
            SizedBox(height: 30.0),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.white,
                fixedSize: const Size(280, 55),
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
                side: BorderSide(color: Color(0xff3a8628),
                  width: 4.0,
                ),
              ),
              child: Text('Statistics'),
              onPressed: () {},
            ),
            SizedBox(height: 30.0),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.white,
                fixedSize: const Size(280, 55),
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
                side: BorderSide(color: Color(0xff3a8628),
                  width: 4.0,
                ),
              ),
              child: Text('Journal'),
              onPressed: () {},
            ),
            SizedBox(height: 30.0),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.white,
                fixedSize: const Size(280, 55),
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
                side: BorderSide(color: Color(0xff3a8628),
                  width: 4.0,
                ),
              ),
              child: Text('Attack Log'),
              onPressed: () {},
            ),
            SizedBox(height: 30.0),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.white,
                fixedSize: const Size(280, 55),
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
                side: BorderSide(color: Color(0xff3a8628),
                  width: 4.0,
                ),
              ),
              child: Text('Settings'),
              onPressed: () {},
            ),
            SizedBox(height: 30.0),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.white,
                fixedSize: const Size(280, 55),
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
                side: BorderSide(color: Colors.red,
                  width: 4.0,
                ),
              ),
              child: Text('Log Out'),
              onPressed: () {},
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