import 'package:flutter/material.dart';
import 'package:anxiety_align/screens/graphs/graphs2.dart';
import 'package:anxiety_align/services/auth.dart';
import 'package:anxiety_align/services/database.dart';

class Graphs3 extends StatefulWidget {
  @override
  _Graphs3State createState() => _Graphs3State();
}

class _Graphs3State extends State<Graphs3> {

  final AuthService _auth = AuthService();
  String userID = AuthService().currUserID!;
  List<String> reactions = List.filled(3, " ");
  List<String> sources = List.filled(3, " ");
  List<String> thoughts = List.filled(3, " ");
  List<String> calming = List.filled(3, " ");

  void initState() {
    getReactions();
    getThoughts();
    getSources();
    getCalmers();
    super.initState();
  }

  Future<void> getReactions() async {
    reactions = (await DatabaseService(userID: userID).getOthers('symptoms'));
    setState(() => reactions = reactions);
    print(reactions);
  }

  Future<void> getSources() async {
    sources = (await DatabaseService(userID: userID).getOthers('triggers'));
    setState(() => sources = sources);
    print(sources);
  }

  Future<void> getThoughts() async {
    thoughts = (await DatabaseService(userID: userID).getOthers('thoughts'));
    setState(() => thoughts = thoughts);
    print(thoughts);
  }

  Future<void> getCalmers() async {
    calming = (await DatabaseService(userID: userID).getOthers('solution'));
    setState(() => calming = calming);
    print(calming);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF96B4A0),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: <Widget>[
          SizedBox(height: 30.0),
          Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back_sharp, size: 40),
                color: Colors.black,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Graphs2()));
                },
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("physical reactions:",
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 22,
                        fontFamily: 'WingDing',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      )),
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                        color: Color(0xFFD3FBCD),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          (reactions[0] != " ") ? reactions[0] : "entry 1",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 18,
                            fontFamily: 'WingDing',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFD3FBCD),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          (reactions[1] != " ") ? reactions[1] : "entry 2",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 18,
                            fontFamily: 'WingDing',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFD3FBCD),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          (reactions[2] != " ") ? reactions[2] : "entry 3",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 18,
                            fontFamily: 'WingDing',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("source of anxiety:",
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 22,
                        fontFamily: 'WingDing',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      )),
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFD3FBCD),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          (sources[0] != " ") ? sources[0] : "entry 1",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 18,
                            fontFamily: 'WingDing',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFD3FBCD),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          (sources[1] != " ") ? sources[1] : "entry 2",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 18,
                            fontFamily: 'WingDing',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFD3FBCD),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          (sources[2] != " ") ? sources[2] : "entry 3",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 18,
                            fontFamily: 'WingDing',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("thoughts at the moment:",
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 22,
                        fontFamily: 'WingDing',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      )),
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFD3FBCD),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          (thoughts[0] != " ") ? thoughts[0] : "entry 1",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 18,
                            fontFamily: 'WingDing',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFD3FBCD),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          (thoughts[1] != " ") ? thoughts[1] : "entry 2",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 18,
                            fontFamily: 'WingDing',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFD3FBCD),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          (thoughts[2] != " ") ? thoughts[2] : "entry 3",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 18,
                            fontFamily: 'WingDing',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("calming methods:",
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 22,
                        fontFamily: 'WingDing',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                      )),
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFD3FBCD),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          (calming[0] != " ") ? calming[0] : "entry 1",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 18,
                            fontFamily: 'WingDing',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFD3FBCD),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          (calming[1] != " ") ? calming[1] : "entry 2",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 18,
                            fontFamily: 'WingDing',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFD3FBCD),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          (calming[2] != " ") ? calming[2] : "entry 3",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 18,
                            fontFamily: 'WingDing',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
