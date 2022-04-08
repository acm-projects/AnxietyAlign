import 'package:flutter/material.dart';
import 'package:anxiety_align/screens/graphs/graphs1.dart';
import 'package:anxiety_align/screens/graphs/graphs2.dart';

class Graphs3 extends StatelessWidget {
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
                      border: Border.all(
                        color: Color(0xFFFFFFFF),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "entry 1",
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
                SizedBox(height: 3.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFFFFFFF),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "entry 2",
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
                SizedBox(height: 3.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFFFFFFF),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "entry 3",
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
                      border: Border.all(
                        color: Color(0xFFFFFFFF),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "entry 1",
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
                SizedBox(height: 3.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFFFFFFF),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "entry 2",
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
                SizedBox(height: 3.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFFFFFFF),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "entry 3",
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
                      border: Border.all(
                        color: Color(0xFFFFFFFF),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "entry 1",
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
                SizedBox(height: 3.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFFFFFFF),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "entry 2",
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
                SizedBox(height: 3.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFFFFFFF),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "entry 3",
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
                      border: Border.all(
                        color: Color(0xFFFFFFFF),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "entry 1",
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
                SizedBox(height: 3.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFFFFFFF),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "entry 2",
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
                SizedBox(height: 3.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 30.0,
                    width: 440.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFFFFFFF),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "entry 3",
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
