import 'package:flutter/material.dart';
import 'package:anxiety_align/widgets/journal_entry.dart';

class Journal extends StatefulWidget {
  final String userID;
  final DateTime timestamp;
  final Color lightGreen;
  final Color darkGreen;
  final double horizontalMargin;
  final SizedBox sectionSpace;
  final SizedBox widgetSpace;
  const Journal({
    Key? key,
    required this.userID,
    required this.timestamp,
    this.lightGreen = const Color(0xFF96B4A0),
    this.darkGreen = const Color(0xFF3A8628),
    this.horizontalMargin = 15.0,
    this.sectionSpace = const SizedBox(height: 30.0),
    this.widgetSpace = const SizedBox(height: 10.0)
  }) : super(key: key);
  @override
  State<Journal> createState() => _AttackJournalState();
}

class _AttackJournalState extends State<Journal> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: widget.lightGreen,
    body: body(),
    resizeToAvoidBottomInset: false
  );

  Widget body() => Container(
    margin: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
    child: Column(
      children: <Widget>[
        widget.sectionSpace,
        Image.asset('assets/icons/book_open.png'),
        widget.sectionSpace,
        JournalEntry(
          userID: widget.userID,
          timestamp: widget.timestamp,
          lightGreen: widget.lightGreen,
          darkGreen: widget.darkGreen,
          sectionSpace: widget.sectionSpace,
          widgetSpace: widget.widgetSpace
        )
      ]
    )
  );
}
