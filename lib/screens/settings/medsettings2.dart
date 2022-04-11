import 'package:flutter/material.dart';
import 'package:anxiety_align/services/auth.dart';
import 'package:anxiety_align/services/database.dart';
import 'package:anxiety_align/screens/settings/settings.dart';
import 'package:anxiety_align/screens/settings/medpage.dart';
import 'package:anxiety_align/widgets/bottombar.dart';
import 'package:anxiety_align/screens/home.dart';

class MedSettings2 extends StatefulWidget {
  String? name;
  String? dosage;
  int freq;
  List<dynamic> days;

  MedSettings2(
      {required this.name,
      required this.dosage,
      required this.freq,
      required this.days});

  @override
  _MedSettings2State createState() => _MedSettings2State();
}

class _MedSettings2State extends State<MedSettings2> {
  String userID = AuthService().currUserID!;
  List<String> name = <String>[];
  List<String> dosage = <String>[];
  List<int> freq = <int>[];
  List<List<dynamic>> days = [];

  void initState() {
    getMedName();
    getDosage();
    getFreq();
    getDays();
    super.initState();
  }

  Future<void> getMedName() async {
    name = (await DatabaseService(userID: userID).getMedicationName());
    setState(() => name = name);
    //print(name);
  }

  Future<void> getDosage() async {
    dosage = (await DatabaseService(userID: userID).getDosage());
    setState(() => dosage = dosage);
    //print(dosage);
  }

  Future<void> getFreq() async {
    freq = (await DatabaseService(userID: userID).getFreq());
    setState(() => freq = freq);
    //print(freq);
  }

  Future<void> getDays() async {
    days = (await DatabaseService(userID: userID).getDays());
    setState(() => days = days);
    //print(days);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff96b4a0),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(children: [
              SizedBox(
                height: 20,
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
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Name:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5.0,
                        color: Colors.black,
                      )),
                  SizedBox(width: 10),
                  Text((widget.name!.length > 0) ? widget.name! : "name",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5.0,
                        color: Colors.black,
                      )), //container
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Dosage:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5.0,
                        color: Colors.black,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                      (widget.dosage!.length > 0) ? widget.dosage! : 'sizehere',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5.0,
                        color: Colors.black,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text('mg',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5.0,
                        color: Colors.black,
                      )) //container
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text('Frequency per week:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5.0,
                    color: Colors.black,
                  )),
              SizedBox(
                height: 10,
              ),
              Text((widget.days.length > 0) ? widget.days.join(" ") : " ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5.0,
                    color: Colors.black,
                  )),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Frequency per day:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5.0,
                        color: Colors.black,
                      )),
                  Text((widget.freq > 0) ? widget.freq.toString() : " ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5.0,
                        color: Colors.black,
                      )) //container
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Color(0xff3a8628))),
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      minimumSize: Size(30.0, 50.0),
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                      side: BorderSide(
                        color: Color(0xff3a8628),
                        width: 4.0,
                      ),
                    ),
                    child: Text('remove'),
                    onPressed: () async {
                      for (int i = 0; i < name.length; i++) {
                        if(name[i] == widget.name)
                          {
                            name.removeAt(i);
                            dosage.removeAt(i);
                            days.removeAt(i);
                            freq.removeAt(i);
                            await DatabaseService(userID: userID).removeMed(widget.name);
                          }
                      }
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                  ) //flexible
                      ),
                  SizedBox(
                    width: 120,
                  ),
                  new Container(
                      child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Color(0xff3a8628))),
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      minimumSize: Size(30.0, 50.0),
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
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
                    onPressed: () {
                      for (int i = 0; i < name.length; i++) {
                        if (name[name.length - 1] == widget.name) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        } else if (name[i] == widget.name) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MedSettings2(
                                      name: name[i + 1],
                                      dosage: dosage[i + 1],
                                      freq: freq[i + 1],
                                      days: days[i + 1])));
                        }
                      }
                    },
                  ) //flexible
                      ), //container
                ],
              ),
              SizedBox(height: 40.0),
              Align(
                  alignment: Alignment(-.9, 1),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: BorderSide(color: Color(0xff3a8628))),
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      minimumSize: Size(30.0, 50.0),
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                      side: BorderSide(
                        color: Color(0xff3a8628),
                        width: 4.0,
                      ),
                    ),
                    child: Text('+ add another'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MedPage()));
                    },
                  )),
              SizedBox(height: 30.0)
            ]),
          ),
        ],
      ),
      /*floatingActionButton: FloatingActionButton(
      onPressed: (){},
      backgroundColor: Color(0xff96b4a0),
      child: Text('yes'),
    ),*/
    );
  }
}
