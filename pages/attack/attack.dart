import 'package:flutter/material.dart';
import 'package:counter/services/auth.dart';
import 'package:counter/services/database.dart';
import 'package:counter/pages/attack/confirm.dart';
import 'package:counter/pages/attack/question.dart';
import 'package:counter/pages/attack/other.dart';
import 'package:counter/pages/attack/journal.dart';

class Attack extends StatefulWidget {
  const Attack({Key? key}) : super(key: key);
  @override
  State<Attack> createState() => _AttackState();
}

enum Page { confirm, question, rating, other, journal }
enum Section { rating, symptoms, triggers, thoughts, solution, journal }

class _AttackState extends State<Attack> {
  late String userID;
  late DateTime timestamp;
  late Page page;
  late Section section;
  List<int> options = List<int>.filled(4, -1);
  List<String> others = List<String>.filled(4, '');

  @override
  void initState() {
    userID = AuthService().currUserID!;
    page = Page.confirm;
    section = Section.symptoms;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    child: buildHelper(),
    onTap: () => FocusScope.of(context).requestFocus(FocusNode())
  );

  void changePage(Page page) => setState(() => this.page = page);
  void changeSection(Section section) {
    if(section == Section.journal) {
      DatabaseService(userID: userID).logAttack(options, others);
    }
    setState(() => this.section = section);
  }
  void setTimestamp(DateTime timestamp) => this.timestamp = timestamp;
  void changeOption(int option, [String text = '']) {
    switch(section) {
      case Section.symptoms:
        if(page == Page.other && text == 'prev') break;
        if(page == Page.other && text == 'next' && options[0] == option) break;
        options[0] = options[0] == option ? -1 : option;
        break;
      case Section.triggers:
        if(page == Page.other && text == 'prev') break;
        if(page == Page.other && text == 'next' && options[1] == option) break;
        options[1] = options[1] == option ? -1 : option;
        break;
      case Section.thoughts:
        if(page == Page.other && text == 'prev') break;
        if(page == Page.other && text == 'next' && options[2] == option) break;
        options[2] = options[2] == option ? -1 : option;
        break;
      default:
        if(page == Page.other && text == 'prev') break;
        if(page == Page.other && text == 'next' && options[3] == option) break;
        options[3] = options[3] == option ? -1 : option;
        break;
    }
    setState(() { });
  }
  void changeOther(String other) {
    switch(section) {
      case Section.symptoms: others[0] = other; break;
      case Section.triggers: others[1] = other; break;
      case Section.thoughts: others[2] = other; break;
      default: others[3] = other; break;
    }
  }

  Widget buildHelper() {
    switch(page) {
      case Page.confirm:
        return Confirm(
          section: section,
          changePage: changePage,
          setTimestamp: setTimestamp
        );
      case Page.question:
        return Question(
          page: page,
          section: section,
          options: options,
          changePage: changePage,
          changeSection: changeSection,
          changeOption: changeOption,
          changeOther: changeOther
        );
      case Page.other:
        return Other(
          page: page,
          section: section,
          changePage: changePage,
          changeSection: changeSection,
          changeOption: changeOption,
          changeOther: changeOther
        );
      default:
        return Journal(
          userID: userID,
          timestamp: timestamp
        );
    }
  }
}
