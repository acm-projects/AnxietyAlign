import 'package:flutter/material.dart';
import 'package:counter/services/auth.dart';
import 'package:counter/services/database.dart';
import 'package:counter/pages/journal/journals.dart';
import 'package:counter/pages/journal/card.dart' as card;

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
      buildCard: buildCard
    );
    initAsync();
    super.initState();
  }
  Future<void> initAsync() async {
    timestamps = await DatabaseService(userID: userID).getJournalTimestamps();
    buildJournals();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    child: buildHelper,
    onTap: () => FocusScope.of(context).requestFocus(FocusNode())
  );

  void buildJournals() =>
    setState(() => buildHelper = Journals(
      userID: userID,
      timestamp: DateTime.now(),
      timestamps: timestamps,
      updateTimestamps: updateTimestamps,
      buildCard: buildCard
    )
  );

  Future<void> updateTimestamps() => DatabaseService(userID: userID)
  .getJournalTimestamps().then((timestamps) {
    this.timestamps = timestamps;
    buildJournals();
    setState(() { });
  });

  void buildCard(String timestamp) =>
    setState(() => buildHelper = card.Card(
      userID: userID,
      timestamp: timestamp,
      buildJournals: buildJournals
    )
  );
}
