import 'package:flutter/material.dart';
import 'package:anxiety_align/services/auth.dart';
import 'package:anxiety_align/services/database.dart';
import 'package:anxiety_align/screens/journal/journals.dart';
import 'package:anxiety_align/screens/journal/card.dart' as card;

class Journal extends StatefulWidget {
  const Journal({Key? key}) : super(key: key);
  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  late final String userID;
  late List<String> timestamps;
  late Widget buildHelper;

  @override
  void initState() {
    userID = AuthService().currUserID!;
    buildHelper = Journals(
        userID: userID,
        timestamp: DateTime.now(),
        timestamps: const <String>[],
        updateTimestamps: updateTimestamps,
        buildCard: buildCard);
    initAsync();
    super.initState();
  }

  Future<void> initAsync() async {
    timestamps = await DatabaseService(userID: userID).getJournalTimestamps();
    buildJournals();
  }

  @override
  Widget build(BuildContext context) => buildHelper;

  void buildJournals() => setState(() => buildHelper = Journals(
      userID: userID,
      timestamp: DateTime.now(),
      timestamps: timestamps,
      updateTimestamps: updateTimestamps,
      buildCard: buildCard));

  Future<void> updateTimestamps() =>
      DatabaseService(userID: userID).getJournalTimestamps().then((timestamps) {
        this.timestamps = timestamps;
        buildJournals();
        setState(() {});
      });

  void buildCard(String timestamp) => setState(() => buildHelper = card.Card(
      userID: userID, timestamp: timestamp, buildJournals: buildJournals));
}
