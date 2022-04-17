import 'package:flutter/material.dart';
import 'package:anxiety_align/screens/attack/attack.dart' as attack;
import 'package:anxiety_align/screens/home.dart';

class Confirm extends StatefulWidget {
  final attack.Section section;
  final Function changePage;
  final Function setTimestamp;
  final Color lightGreen;
  final Color darkGreen;
  final double horizontalMargin;
  final SizedBox sectionSpace;
  final SizedBox widgetSpace;
  const Confirm({
    Key? key,
    required this.section,
    required this.changePage,
    required this.setTimestamp,
    this.lightGreen = const Color(0xFF96B4A0),
    this.darkGreen = const Color(0xFF3A8628),
    this.horizontalMargin = 15.0,
    this.sectionSpace = const SizedBox(height: 30.0),
    this.widgetSpace = const SizedBox(height: 10.0)
  }) : super(key: key);
  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: widget.lightGreen,
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
      child: body()
    )
  );

  Widget body() {
    List<Widget> children = <Widget>[];
    if(widget.section == attack.Section.journal) {
      children.add(icon());
      children.add(widget.widgetSpace);
    }
    children.addAll(<Widget>[
      title(),
      widget.sectionSpace,
      button('yes'),
      widget.sectionSpace,
      button('no')
    ]);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children
    );
  }

  Widget icon() => Image.asset('assets/images/book_open.png');

  Widget title() => Text(
    widget.section == attack.Section.journal ?
      'do you want to add anything else?' : 'are you logging an attack?',
    style: const TextStyle(
      color: Colors.black,
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 5.0
    ),
    textAlign: TextAlign.center
  );

  OutlinedButton button(String text) => OutlinedButton(
    onPressed: () {
      if(text == 'yes') {
        if(widget.section == attack.Section.journal) {
          widget.changePage(attack.Page.journal);
          return;
        }
        widget.setTimestamp(DateTime.now());
        widget.changePage(attack.Page.question);
        return;
      }
      else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home())
        );
      }
    },
    style: OutlinedButton.styleFrom(
      primary: Colors.black,
      backgroundColor: Colors.white,
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 28.0,
        fontWeight: FontWeight.bold
      ),
      minimumSize: const Size(110.0, 55.0),
      side: BorderSide(
        color: widget.darkGreen,
        width: 4.0
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
    ),
    child: Text(text)
  );
}
