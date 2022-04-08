import 'package:flutter/material.dart';
import 'package:anxiety_align/services/auth.dart';
import 'package:anxiety_align/services/database.dart';
import 'package:anxiety_align/screens/settings/settings.dart';
import 'package:anxiety_align/screens/settings/medpage.dart';
import 'package:anxiety_align/widgets/bottombar.dart';

class MedSettings2 extends StatefulWidget {
  const MedSettings2({Key? key}) : super(key: key);

  @override
  _MedSettings2State createState() => _MedSettings2State();

}

class _MedSettings2State extends State<MedSettings2> {
  late String userID = AuthService().currUserID!;
  String? name;
  String? dosage;
  int freq = 0;
  List<dynamic?> days = List.filled(7, " ");


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
    print(name);
  }

  Future<void> getDosage() async {
    dosage = (await DatabaseService(userID: userID).getDosage());
    setState(() => dosage = dosage);
    print(dosage);
  }

  Future<void> getFreq() async {
    freq = (await DatabaseService(userID: userID).getFreq())!;
    setState(() => freq = freq);
    print(freq);
  }

  Future<void> getDays() async {
    days = (await DatabaseService(userID: userID).getDays())!;
    setState(() => days = days);
    print(days);
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
                  SizedBox(
                    width: 10,
                  ),
                  Text(name ?? 'medhere',
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
                  Text(dosage ?? 'sizehere',
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
              Text(days.join(" "),
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
                  Text((freq.toString()),
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
                    child: Text('edit'),
                    onPressed: () {},
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MedSettings2()));
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
