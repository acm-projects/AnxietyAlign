import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anxiety_align/services/database.dart';
import 'package:anxiety_align/services/auth.dart';
import 'package:anxiety_align/screens/home.dart';

class MedPage extends StatefulWidget {
  @override
  _MedPageState createState() => _MedPageState();
}

class _MedPageState extends State<MedPage> {
  String name = '';
  List<bool> toggle = [false, false, false, false, false, false, false];
  List<String> days = List.filled(7, " ");
  int times = 0;
  final myController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<bool> isSelected = [false, false, false, false];
  late String userID = AuthService().currUserID!;
  late int timestamp;

  @override
  Widget build(BuildContext context) {
    String setTimestamp(int ts) {
      DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(timestamp);
      String datetime = tsdate.year.toString() +
          "-" +
          tsdate.month.toString() +
          "-" +
          tsdate.day.toString() +
          " " +
          tsdate.hour.toString() +
          ":" +
          tsdate.minute.toString();
      return datetime;
    }

    return Scaffold(
        backgroundColor: Color(0xff96b4a0),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          reverse: true,
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Align(
                      alignment: Alignment(-.7, 1),
                      child: OutlinedButton.icon(
                        label: Text('back'),
                        icon: Icon(Icons.arrow_back_sharp, size: 28),
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor: Colors.white,
                          minimumSize: Size(110.0, 50.0),
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
                          Navigator.pop(context);
                        },
                      )),
                  SizedBox(height: 15.0),
                  Text('What is the name of your medication?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5.0,
                        color: Colors.black,
                      )),
                  SizedBox(height: 15.0),
                  Container(
                      width: 300.0,
                      child: TextFormField(
                          style: TextStyle(fontSize: 15, height: .5),
                          decoration: new InputDecoration(
                            labelText: "",
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffd3fbcd), width: 3.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffd3fbcd), width: 3.0),
                            ),
                            //fillColor: Colors.green
                          ),
                          validator: (String? val) {
                            if (val != null && val.isEmpty) {
                              return "name cant be empty";
                            }
                          },
                          onChanged: (val) {
                            setState(() => name = val);
                          })),
                  SizedBox(height: 15.0),
                  Text('What is the dosage?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5.0,
                        color: Colors.black,
                      )),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        child: new Flexible(
                          child: new Container(
                              width: 300.0,
                              child: TextFormField(
                                  controller: myController,
                                  style: TextStyle(fontSize: 15, height: .5),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: new InputDecoration(
                                    labelText: "",
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffd3fbcd), width: 3.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffd3fbcd), width: 3.0),
                                    ),
                                    //fillColor: Colors.green
                                  ),
                                  validator: (String? val) {
                                    if (val != null && val.isEmpty) {
                                      return "dosage cant be empty";
                                    } else if (val != null && val.length > 1) {
                                      return "dosage cant be more than one number";
                                    }
                                  })),
                        ), //flexible
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      new Text('mg',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 5.0,
                            color: Colors.black,
                          )), //container
                    ],
                  ),
                  SizedBox(height: 15),
                  Text('When do you have to take it?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5.0,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                          child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor:
                              toggle[0] ? Color(0xFFD3FBCD) : Colors.white,
                          minimumSize: Size(30.0, 55.0),
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
                        child: Text('Su'),
                        onPressed: () {
                          setState(() => toggle[0] = !toggle[0]);
                          if (toggle[0]) {
                            days[0] = "Su";
                          } else {
                            days[0] = " ";
                          }
                        },
                      ) //flexible
                          ),
                      SizedBox(
                        width: 15,
                      ),
                      new Container(
                          child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor:
                              toggle[1] ? Color(0xFFD3FBCD) : Colors.white,
                          minimumSize: Size(30.0, 55.0),
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
                        child: Text('M'),
                        onPressed: () {
                          setState(() => toggle[1] = !toggle[1]);
                          if (toggle[1]) {
                            days[1] = "M";
                          } else {
                            days[1] = " ";
                          }
                        },
                      ) //flexible
                          ),
                      SizedBox(
                        width: 15,
                      ),
                      new Container(
                          child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor:
                              toggle[2] ? Color(0xFFD3FBCD) : Colors.white,
                          minimumSize: Size(30.0, 55.0),
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
                        child: Text('Tu'),
                        onPressed: () {
                          setState(() => toggle[2] = !toggle[2]);
                          if (toggle[2]) {
                            days[2] = "Tu";
                          } else {
                            days[2] = " ";
                          }
                        },
                      ) //flexible
                          ),
                      SizedBox(
                        width: 15,
                      ),
                      new Container(
                          child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor:
                              toggle[3] ? Color(0xFFD3FBCD) : Colors.white,
                          minimumSize: Size(30.0, 55.0),
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
                        child: Text('W'),
                        onPressed: () {
                          setState(() => toggle[3] = !toggle[3]);
                          if (toggle[3]) {
                            days[3] = "W";
                          } else {
                            days[3] = " ";
                          }
                        },
                      ) //flexible
                          ), //container
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                          child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor:
                              toggle[4] ? Color(0xFFD3FBCD) : Colors.white,
                          minimumSize: Size(30.0, 55.0),
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
                        child: Text('Th'),
                        onPressed: () {
                          setState(() => toggle[4] = !toggle[4]);
                          if (toggle[4]) {
                            days[4] = "Th";
                          } else {
                            days[4] = " ";
                          }
                        },
                      ) //flexible
                          ),
                      SizedBox(
                        width: 15,
                      ),
                      new Container(
                          child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor:
                              toggle[5] ? Color(0xFFD3FBCD) : Colors.white,
                          minimumSize: Size(30.0, 55.0),
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
                        child: Text('F'),
                        onPressed: () {
                          setState(() => toggle[5] = !toggle[5]);
                          if (toggle[5]) {
                            days[5] = "F";
                          } else {
                            days[5] = " ";
                          }
                        },
                      ) //flexible
                          ),
                      SizedBox(
                        width: 15,
                      ),
                      new Container(
                          child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor:
                              toggle[6] ? Color(0xFFD3FBCD) : Colors.white,
                          minimumSize: Size(30.0, 55.0),
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
                        child: Text('Sa'),
                        onPressed: () {
                          setState(() => toggle[6] = !toggle[6]);
                          if (toggle[6]) {
                            days[6] = "Sa";
                          } else {
                            days[6] = " ";
                          }
                        },
                      ) //flexible
                          ), //container
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('How many times per day do you have to take it?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5.0,
                        color: Colors.black,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                          child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor:
                              isSelected[0] ? Color(0xFFD3FBCD): Colors.white ,
                          minimumSize: Size(30.0, 55.0),
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
                        child: Text('1'),
                        onPressed: () {
                          if (isSelected[1] || isSelected[2] || isSelected[3]) {
                            setState(() => isSelected[1] = false);
                            setState(() => isSelected[2] = false);
                            setState(() => isSelected[3] = false);
                          }
                          setState(() => isSelected[0] = !isSelected[0]);
                          times = 1;
                        },
                      ) //flexible
                          ),
                      SizedBox(
                        width: 15,
                      ),
                      new Container(
                          child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor:
                              isSelected[1] ? Color(0xFFD3FBCD): Colors.white,
                          minimumSize: Size(30.0, 55.0),
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
                        child: Text('2'),
                        onPressed: () {
                          if (isSelected[0] || isSelected[2] || isSelected[3]) {
                            setState(() => isSelected[0] = false);
                            setState(() => isSelected[2] = false);
                            setState(() => isSelected[3] = false);
                          }
                          setState(() => isSelected[1] = !isSelected[1]);
                          times = 2;
                        },
                      ) //flexible
                          ),
                      SizedBox(
                        width: 15,
                      ),
                      new Container(
                          child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor:
                              isSelected[2] ? Color(0xFFD3FBCD): Colors.white,
                          minimumSize: Size(30.0, 55.0),
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
                        child: Text('3'),
                        onPressed: () {
                          if (isSelected[1] || isSelected[0] || isSelected[3]) {
                            setState(() => isSelected[1] = false);
                            setState(() => isSelected[0] = false);
                            setState(() => isSelected[3] = false);
                          }
                          setState(() => isSelected[2] = !isSelected[2]);
                          times = 3;
                        },
                      ) //flexible
                          ),
                      SizedBox(
                        width: 15,
                      ),
                      new Container(
                          child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.black,
                          backgroundColor:
                              isSelected[3] ? Color(0xFFD3FBCD): Colors.white,
                          minimumSize: Size(30.0, 55.0),
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
                        child: Text('4'),
                        onPressed: () {
                          if (isSelected[1] || isSelected[2] || isSelected[0]) {
                            setState(() => isSelected[1] = false);
                            setState(() => isSelected[2] = false);
                            setState(() => isSelected[0] = false);
                          }
                          setState(() => isSelected[3] = !isSelected[3]);
                          times = 4;
                        },
                      ) //flexible
                          ), //container
                    ],
                  ),
                  SizedBox(height: 20.0),
                  /*Align(
                      alignment: Alignment(-.8, .5),
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
                        onPressed: () {},
                      )),*/
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment(.8, -.9),
                      child: OutlinedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            timestamp = DateTime.now().millisecondsSinceEpoch;
                            print(myController.text);
                            DatabaseService(userID: userID).setMedications(
                                setTimestamp(timestamp),
                                name,
                                myController.text,
                                days,
                                times);
                            print(name);
                            print(times);
                            print(days);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          }
                        },
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
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('next'), // <-- Text
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.arrow_forward_sharp, size: 25),
                          ],
                        ),
                      ))
                ]),
          ),
        ));
  }
}
