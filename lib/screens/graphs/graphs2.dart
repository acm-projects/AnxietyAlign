import 'package:flutter/material.dart';
import 'package:anxiety_align/screens/graphs/graphs1.dart';
import 'package:anxiety_align/screens/home.dart';
import 'package:anxiety_align/screens/graphs/pchart1.dart';
import 'package:anxiety_align/screens/graphs/graphs3.dart';
import 'package:anxiety_align/screens/graphs/gdata.dart';
import 'package:anxiety_align/widgets/bottombar.dart';
import 'package:anxiety_align/services/auth.dart';
import 'package:anxiety_align/services/database.dart';

class Graphs2 extends StatefulWidget {
  const Graphs2({Key? key}) : super(key: key);

  @override
  _Graphs2State createState() => _Graphs2State();
}

class _Graphs2State extends State<Graphs2> {

  final AuthService _auth = AuthService();
  String userID = AuthService().currUserID!;
  List<num> triggers = List.filled(5, 0);
  List<num> calmers = List.filled(5, 0);

  final List<GraphData> data1 = [
    GraphData(count: 0, section: "conflict w/\n loved one", color: Color(0xFF9EBB99)),
    GraphData(count: 0, section: "social\nevent", color: Color(0xFF5C8B50)),
    GraphData(count: 0, section: "academic\nstress", color: Color(0xFF20FF00)),
    GraphData(count: 0, section: "financial\ndistress", color: Color(0xFF94E888)),
    GraphData(count: 0, section: "other", color: Color(0xFFD3FBCD)),
  ];
  final List<GraphData> data2 = [
    GraphData(count: 0, section: "breathing\nexercise", color: Color(0xFF94E888)),
    GraphData(count: 0, section: "focus\nobject", color: Color(0xFF9FD591)),
    GraphData(count: 0, section: "light\nexercise", color: Color(0xFF20FF00)),
    GraphData(count: 0, section: "leaving\nenvironment", color: Color(0xFF9CDE94)),
    GraphData(count: 0, section: "other", color: Color(0xFFD3FBCD)),
  ];

  void initState() {
    getTriggers();
    getCalmers();
    setTriggers();
    setCalmers;
    super.initState();
  }

  Future<void> getTriggers() async {
    triggers = (await DatabaseService(userID: userID).getGraphData('triggers'))!;
    setState(() => triggers = triggers);
  }

  Future<void> getCalmers() async {
    calmers = (await DatabaseService(userID: userID).getGraphData('solution'))!;
    setState(() => calmers = calmers);
  }

  List<GraphData>setTriggers() {
    for(int i=0; i < data1.length; i++)
    {
      data1[i].count = triggers[i].toInt();
    }
    return data1;
  }

  List<GraphData>setCalmers() {
    for(int i=0; i < data2.length; i++)
    {
      data2[i].count = calmers[i].toInt();
    }
    return data2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF96B4A0),
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: BottomBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_sharp, size: 40),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Graphs1()));
                    },
                  )),
              Align(
                  child: Container(
                      height: 50.0,
                      width: 50.0,
                      child: Image.asset(
                        'assets/images/Vector.png',
                        fit: BoxFit.cover,
                      ))),
              SizedBox(height: 5.0),
              PieChart1(data: setTriggers(), text: "which triggers are most common?"),
              PieChart1(data: setCalmers(), text: "most common calming methods:"),
              SizedBox(height: 25.0),
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
                  'view others',
                  style: TextStyle(fontFamily: 'WingDing', fontWeight: FontWeight.bold, color: Color(0xFF000000)),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Graphs3()));
                },
              ),
            ],
          ),
        ));
  }
}
