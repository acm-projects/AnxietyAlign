import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:anxiety_align/services/database.dart';
import 'package:anxiety_align/services/auth.dart';
import 'package:anxiety_align/screens/settings/medication_list.dart';

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
          tsdate.minute.toString() +
          ":" +
          tsdate.second.toString();
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
                      Spacing(40, 0),
                      backButton(),
                      Spacing(15, 0),
                      subTitles('What is the name of your medication?'),
                      Spacing(15, 0),
                      nameDisplay(),
                      Spacing(15, 0),
                      subTitles('What is the dosage?'),
                      Spacing(15, 0),
                      milligrams(),
                      Spacing(15, 0),
                      subTitles('When do you have to take it?'),
                      Spacing(15, 0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            dayButton("Su", 0),
                            Spacing(0, 15),
                            dayButton("Mo", 1),
                            Spacing(0, 15),
                            dayButton("Tu", 2),
                            Spacing(0, 15),
                            dayButton("W", 3),
                          ]),
                      Spacing(15, 0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            dayButton("Th", 4),
                            Spacing(0, 15),
                            dayButton("F", 5),
                            Spacing(0, 15),
                            dayButton("Sa", 6),
                            Spacing(15, 0),
                          ]),
                      Spacing(15, 0),
                      subTitles(
                          'How many times per day do you have to take it?'),
                      Spacing(15, 0),
                      numberButtons(),
                      Spacing(30, 0),
                      next(setTimestamp)
                    ]))));
  }

  Widget subTitles(String text) => Text(text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 5.0,
        color: Colors.black,
      ));
  Widget Spacing(double heightv, double widthv) => SizedBox(height: heightv, width: widthv);
  Widget next(Function setTimestamp) => Align(
      alignment: Alignment(.8, -.9),
      child: OutlinedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            timestamp = DateTime.now().millisecondsSinceEpoch;
            print(myController.text);
            DatabaseService(userID: userID).setMedications(
                setTimestamp(timestamp), name, myController.text, days, times);
            print(name);
            print(times);
            print(days);

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MedicationList()));
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
      ));

  Widget dayButton(String day, int index) => Container(
          child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.black,
          backgroundColor: toggle[index] ? Color(0xFFD3FBCD) : Colors.white,
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
        child: Text(day),
        onPressed: () {
          setState(() => toggle[index] = !toggle[index]);
          if (toggle[index]) {
            days[index] = day;
          } else {
            days[index] = " ";
          }
        },
      ) //flexible
          );

  Widget numberButtons() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
                child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                backgroundColor:
                    isSelected[0] ? Color(0xFFD3FBCD) : Colors.white,
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
            Spacing(0, 15),
            new Container(
                child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                backgroundColor:
                    isSelected[1] ? Color(0xFFD3FBCD) : Colors.white,
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
            Spacing(0, 15),
            new Container(
                child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                backgroundColor:
                    isSelected[2] ? Color(0xFFD3FBCD) : Colors.white,
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
            Spacing(0, 15),
            new Container(
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor:
                          isSelected[3] ? Color(0xFFD3FBCD) : Colors.white,
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
                    }))
          ]);

  Widget milligrams() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: new Flexible(
              child: new Container(
                  width: 300.0,
                  child: TextFormField(
                      controller: myController,
                      style: TextStyle(fontSize: 15, height: .5),
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        labelText: "",
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffd3fbcd), width: 3.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffd3fbcd), width: 3.0),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (String? val) {
                        if (val != null && val.isEmpty) {
                          return "dosage cant be empty";
                        } else if (val != null && double.parse(val) > 1000) {
                          return "dosage cant be more than 1000mg";
                        }
                      })),
            ), //flexible
          ),
          Spacing(0, 15),
          new Text('mg',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 5.0,
                color: Colors.black,
              )), //container
        ],
      );

  Widget nameDisplay() => Container(
      width: 300.0,
      child: TextFormField(
          style: TextStyle(fontSize: 15, height: .5),
          decoration: new InputDecoration(
            labelText: "",
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffd3fbcd), width: 3.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffd3fbcd), width: 3.0),
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
          }));

  Widget backButton() => Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Icon(Icons.arrow_back_sharp, size: 40),
        color: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
      ));
}
