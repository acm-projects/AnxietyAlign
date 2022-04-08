import 'package:flutter/material.dart';
import 'package:counter/services/auth.dart';
import 'package:counter/services/database.dart';
import 'package:counter/pages/attack/confirm.dart';
import 'package:counter/pages/attack/rating.dart';
import 'package:counter/pages/attack/question.dart';
import 'package:counter/pages/attack/other.dart';
import 'package:counter/pages/attack/journal.dart';

class Attack extends StatefulWidget {
  const Attack({Key? key}) : super(key: key);
  @override
  State<Attack> createState() => _AttackState();
}

enum Page { confirm, rating, question, other, journal }
enum Section { symptoms, rating, triggers, thoughts, solution, journal }

class _AttackState extends State<Attack> {
  late final String userID;
  late DateTime timestamp;
  late Page page;
  late Section section;
  late int rating;
  late List<int> options;
  late List<String> others;

  @override
  void initState() {
    userID = AuthService().currUserID!;
    page = Page.confirm;
    section = Section.symptoms;rating = -1;
    options = List<int>.filled(4, -1);
    others = List<String>.filled(4, '');
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
      DatabaseService(userID: userID).logAttack(timestamp, rating, options,
      others);
    }
    setState(() => this.section = section);
  }
  void setTimestamp(DateTime timestamp) => this.timestamp = timestamp;
  void changeRating(int rating) => setState(() => this.rating = rating);
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
      case Section.solution:
        if(page == Page.other && text == 'prev') break;
        if(page == Page.other && text == 'next' && options[3] == option) break;
        options[3] = options[3] == option ? -1 : option;
        break;
      default:
    }
    setState(() { });
  }
  void changeOther(String other) {
    switch(section) {
      case Section.symptoms: others[0] = other; break;
      case Section.triggers: others[1] = other; break;
      case Section.thoughts: others[2] = other; break;
      case Section.solution: others[3] = other; break;
      default:
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
      case Page.rating:
        return Rating(
          page: page,
          section: section,
          rating: rating,
          options: options,
          changePage: changePage,
          changeSection: changeSection,
          changeRating: changeRating,
          changeOption: changeOption,
          changeOther: changeOther
        );
      case Page.question:
        return Question(
          page: page,
          section: section,
          rating: rating,
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
          rating: rating,
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
