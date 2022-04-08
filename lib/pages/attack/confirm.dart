import 'package:flutter/material.dart';
import 'package:counter/pages/attack/attack.dart' as attack;

class Confirm extends StatefulWidget {
  final attack.Section section;
  final Function changePage;
  final Function setTimestamp;
  final Color lightGreen;
  final Color darkGreen;
  final SizedBox sectionSpace;
  const Confirm({
    Key? key,
    required this.section,
    required this.changePage,
    required this.setTimestamp,
    this.lightGreen = const Color(0xFF96B4A0),
    this.darkGreen = const Color(0xFF3A8628),
    this.sectionSpace = const SizedBox(height: 30.0)
  }) : super(key: key);
  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: widget.lightGreen,
    body: body()
  );

  Widget body() {
    List<Widget> children = <Widget>[];
    if(widget.section == attack.Section.journal) {
      children.add(const SizedBox(height: 80.0));
      children.add(icon());
      children.add(const SizedBox(height: 35.0));
    };
    children.addAll(<Widget>[
      title(),
      widget.sectionSpace,
      button('yes'),
      widget.sectionSpace,
      button('no')
    ]);
    return Column(
      mainAxisAlignment: widget.section == attack.Section.journal
        ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: children
    );
  }

  Widget icon() => Image.asset('assets/icons/book_open.png');

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
    ),
    child: Text(text)
  );
}
