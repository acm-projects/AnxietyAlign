import 'package:anxiety_align/screens/settings/medpage.dart';
import 'package:flutter/material.dart';
import 'package:anxiety_align/screens/home.dart';

class YNMed extends StatelessWidget {
  const YNMed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff96b4a0),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Are you taking any medications?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5.0,
                    color: Colors.black,
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
                  side: BorderSide(
                    color: Color(0xff3a8628),
                    width: 4.0,
                  ),
                ),
                child: Text('yes'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MedPage()));
                },
              ),
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
                    side: BorderSide(
                      color: Color(0xff3a8628),
                      width: 4.0,
                    )),
                child: Text('no'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home()));
                },
              )
            ]),
      ),
      /*floatingActionButton: FloatingActionButton(
      onPressed: (){},
      backgroundColor: Color(0xff96b4a0),
      child: Text('yes'),
    ),*/
    );
  }
}
