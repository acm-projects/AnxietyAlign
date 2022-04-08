import 'package:flutter/material.dart';
import 'package:anxiety_align/widgets/bottombar.dart';
import 'package:anxiety_align/screens/settings/settings.dart';
import 'package:anxiety_align/screens/settings/medpage.dart';

class MedSettings1 extends StatefulWidget {
  const MedSettings1({Key? key}) : super(key: key);

  @override
  _MedSettings1State createState() => _MedSettings1State();
}

class _MedSettings1State extends State<MedSettings1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff96b4a0),
      bottomNavigationBar: BottomBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                    alignment: Alignment(-.8, 1),
                    child: OutlinedButton.icon(
                      label: Text('back'),
                      icon: Icon(Icons.arrow_back_sharp, size: 28),
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Settings()));
                      },
                    )),
                SizedBox(
                  height: 15,
                ),
                Text('Current Medications:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5.0,
                      color: Colors.black,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text('None',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5.0,
                      color: Colors.black,
                    )),
                SizedBox(height: 30.0),
                Align(
                    alignment: Alignment(-.7, 1),
                    child: OutlinedButton(
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
                      child: Text('+ add another'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MedPage()));
                      },
                    )),
                SizedBox(height: 30.0)
              ]),
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
      onPressed: (){},
      backgroundColor: Color(0xff96b4a0),
      child: Text('yes'),
    ),*/
    );
  }
}
