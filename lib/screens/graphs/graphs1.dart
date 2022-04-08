import 'package:flutter/material.dart';
import 'package:anxiety_align/services/auth.dart';
import 'package:intl/intl.dart';
import 'package:anxiety_align/screens/graphs/bg.dart';
import 'package:anxiety_align/screens/graphs/gdata.dart';
import 'package:anxiety_align/screens/graphs/graphs2.dart';
import 'package:anxiety_align/screens/home.dart';
import 'package:anxiety_align/widgets/bottombar.dart';

class Graphs1 extends StatelessWidget {
  final AuthService _auth = AuthService();
  final now = DateTime.now();
  final DateFormat Dformatter = DateFormat.yMd();
  final DateFormat Tformatter = DateFormat.jm();
  final List<GraphData> data = [
    GraphData(count: 0, section: "Jan", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Feb", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Mar", color: Color(0xFFD3FBCD)),
    GraphData(count: 4, section: "Apr", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "May", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Jun", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Jul", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Aug", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Sep", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Oct", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Nov", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Dec", color: Color(0xFFD3FBCD)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF96B4A0),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomBar(),
      body: Column(
        children: <Widget>[
          SizedBox(height: 30.0),
          Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back_sharp, size: 40),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.0),
            child: Column(
              children: [
                Container(
                    height: 45.0,
                    width: 45.0,
                    child: Image.asset(
                      'assets/images/Vector.png',
                      fit: BoxFit.cover,
                    )),
                Container(
                    child: Text("your stats",
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 28.0,
                            letterSpacing: 4.0,
                            fontFamily: 'WingDing',
                            fontWeight: FontWeight.bold))),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("days without an attack:",
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 20,
                          letterSpacing: 2.0,
                          fontFamily: 'WingDing',
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFFD3FBCD),
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "10.0",
                          style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 22,
                              fontFamily: 'WingDing',
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("average anxiety ratings:",
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 20,
                          letterSpacing: 2.0,
                          fontFamily: 'WingDing',
                          fontWeight: FontWeight.bold)),
                ),
                Row(
                  children: [
                    SizedBox(width: 45.0),
                    Column(
                      children: [
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFFD3FBCD),
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "4.5",
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 22,
                                      fontFamily: 'WingDing',
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "past month",
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 12,
                              letterSpacing: 1.0,
                              fontFamily: 'WingDing',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      children: [
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFFD3FBCD),
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "5.0",
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 22,
                                      fontFamily: 'WingDing',
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "past 6 months",
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 12,
                              fontFamily: 'WingDing',
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(width: 20.0),
                    Column(
                      children: [
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFFD3FBCD),
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "6.7",
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 22,
                                      fontFamily: 'WingDing',
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "past year",
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 12,
                              fontFamily: 'WingDing',
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                /*Align(
                alignment: Alignment.center,
                child: Container(
                  child: Text(
                    Dformatter.format(now) + "\t " + Tformatter.format(now),
                    style: TextStyle(
                        color: Color(0xFF2A2B2A),
                        fontSize: 20,
                        fontFamily: 'WingDing',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),*/
                //AList(),
                BarGraph(
                  data: data,
                ),
                SizedBox(height: 10.0),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Color(0xff3a8628))),
                    primary: Colors.black,
                    backgroundColor: Colors.white,
                    minimumSize: Size(100.0, 45.0),
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                    side: BorderSide(
                      color: Color(0xff3a8628),
                      width: 4.0,
                    ),
                  ),
                  child: Text(
                    'more stats',
                    style: TextStyle(
                        fontFamily: 'WingDing',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF000000)),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Graphs2()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
