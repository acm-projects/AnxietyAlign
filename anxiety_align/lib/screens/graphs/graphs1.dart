import 'package:flutter/material.dart';
import 'package:anxiety_align/services/auth.dart';
import 'package:anxiety_align/services/database.dart';
import 'package:intl/intl.dart';
import 'package:anxiety_align/screens/graphs/bg.dart';
import 'package:anxiety_align/screens/graphs/gdata.dart';
import 'package:anxiety_align/screens/graphs/graphs2.dart';
import 'package:anxiety_align/screens/home.dart';
import 'package:anxiety_align/widgets/bottombar.dart';

class Graphs1 extends StatefulWidget {
  const Graphs1({Key? key}) : super(key: key);

  @override
  _Graphs1State createState() => _Graphs1State();
}

class _Graphs1State extends State<Graphs1> {
  final AuthService _auth = AuthService();
  String userID = AuthService().currUserID!;
  int daysFrom = 0;
  List<int> months = List.filled(12, 0);
  List<num> ratings = List.filled(6, 0);
  List<GraphData> data = [
    GraphData(count: 0, section: "Jan", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Feb", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Mar", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Apr", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "May", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Jun", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Jul", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Aug", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Sep", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Oct", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Nov", color: Color(0xFFD3FBCD)),
    GraphData(count: 0, section: "Dec", color: Color(0xFFD3FBCD)),
  ];

  void initState() {
    getDaysWithoutAttack();
    getMonths();
    setData();
    getRatings();
    super.initState();
  }

  Future<void> getDaysWithoutAttack() async {
    daysFrom = (await DatabaseService(userID: userID).getDaysWithoutAttack());
    setState(() => daysFrom = daysFrom);
  }

  Future<void> getMonths() async {
    months = (await DatabaseService(userID: userID).getAttacksByMonth())!;
    setState(() => months = months);
  }

  Future<void> getRatings() async {
    ratings = (await DatabaseService(userID: userID).getRatings())!;
    setState(() => ratings = ratings);
  }

  List<GraphData> setData() {
    for (int i = 0; i < data.length; i++) {
      data[i].count = months[i];
    }
    return data;
  }

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
                          color: Color(0xFFFFFFFF),
                          fontSize: 20,
                          letterSpacing: 2.0,
                          fontFamily: 'WingDing',
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 10.0),
                Row(children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFD3FBCD),
                          border: Border.all(
                            color: Color(0xFFD3FBCD),
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            daysFrom.toString(),
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontSize: 22,
                                fontFamily: 'WingDing',
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                  Flexible(
                      child: Text(
                    (() {
                      if (daysFrom < 100 && daysFrom >= 10) {
                        return "Great Progress";
                      } else if (daysFrom >= 3 && daysFrom < 10) {
                        return "Good Start";
                      } else if (daysFrom >= 100 && daysFrom < 365) {
                        return "YOU'RE DOING AMAZING!";
                      } else if (daysFrom >= 365) {
                        return "WHAT! A WHOLE YEAR! INCREDIBLE!";
                      } else {
                        return "Keep trying! You've got this!";
                      }
                    })(),
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 22,
                        letterSpacing: 2.0,
                        fontFamily: 'WingDing',
                        fontWeight: FontWeight.w800),
                  )),
                ]),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("average anxiety ratings:",
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
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
                                color: Color(0xFFD3FBCD),
                                border: Border.all(
                                  color: Color(0xFFD3FBCD),
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  ratings[0].toStringAsPrecision(2),
                                  style: TextStyle(
                                      color: Color(0xFF000000),
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
                                color: Color(0xFFD3FBCD),
                                border: Border.all(
                                  color: Color(0xFFD3FBCD),
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  ratings[2].toStringAsPrecision(2),
                                  style: TextStyle(
                                      color: Color(0xFF000000),
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
                                color: Color(0xFFD3FBCD),
                                border: Border.all(
                                  color: Color(0xFFD3FBCD),
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  ratings[4].toStringAsPrecision(2),
                                  style: TextStyle(
                                      color: Color(0xFF000000),
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
                BarGraph(
                  data: setData(),
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
