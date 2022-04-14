import 'package:flutter/material.dart';
import 'package:anxiety_align/widgets/bottombar.dart';
import 'package:anxiety_align/widgets/journal_entry.dart';

class JournalList extends StatefulWidget {
  final String userID;
  final DateTime timestamp;
  final List<String> timestamps;
  final Function updateTimestamps;
  final Function buildCard;
  final Color lightGreen;
  final Color darkGreen;
  final double horizontalMargin;
  final SizedBox sectionSpace;
  final SizedBox widgetSpace;
  const JournalList({
    Key? key,
    required this.userID,
    required this.timestamp,
    required this.timestamps,
    required this.updateTimestamps,
    required this.buildCard,
    this.lightGreen = const Color(0xFF96B4A0),
    this.darkGreen = const Color(0xFF3A8628),
    this.horizontalMargin = 15.0,
    this.sectionSpace = const SizedBox(height: 30.0),
    this.widgetSpace = const SizedBox(height: 10.0)
  }) : super(key: key);
  @override
  State<JournalList> createState() => _JournalListState();
}

class _JournalListState extends State<JournalList> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: widget.lightGreen,
    body: body(),
    resizeToAvoidBottomInset: false,
    bottomNavigationBar: const BottomBar()
  );

  Widget body() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.sectionSpace,
          JournalEntry(
            userID: widget.userID,
            timestamp: widget.timestamp,
            onSave: () => widget.updateTimestamps(widget.timestamp.toString()),
            lightGreen: widget.lightGreen,
            darkGreen: widget.darkGreen,
            sectionSpace: widget.sectionSpace,
            widgetSpace: widget.widgetSpace
          ),
          widget.sectionSpace,
          const Text(
            'past entries:',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'WingDings'
            )
          ),
          widget.widgetSpace,
          pastEntries()
        ]
      )
    );
  }

  Widget pastEntries() => ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        cardButton(widget.timestamps[index].toString()),
        widget.widgetSpace
      ]
    ),
    itemCount: widget.timestamps.length
  );

  String formatTimestamp(String timestamp) {
    return timestamp.substring(5, 7) + '/' + timestamp.substring(8, 10) + '/'
      + timestamp.substring(2, 4);
  }

  Widget cardButton(String timestamp) => Ink(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[const Color(0xFF97C8A7), widget.lightGreen]
      )
    ),
    child: TextButton(
      onPressed: () => widget.buildCard(timestamp),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 1.0,
          horizontal: 5.0
        ),
        minimumSize: const Size(0.0, 70.0),
        alignment: Alignment.topLeft
      ),
      child: Text(
        'entry ' + formatTimestamp(timestamp),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Wingdings'
        )
      )
    )
  );
}
