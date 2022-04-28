import 'package:flutter/material.dart';
import 'package:anxiety_align/services/auth.dart';
import 'package:anxiety_align/services/database.dart';
import 'package:anxiety_align/screens/attack/confirm.dart';
import 'package:anxiety_align/screens/attack/rating.dart';
import 'package:anxiety_align/screens/attack/question.dart';
import 'package:anxiety_align/screens/attack/other.dart';
import 'package:anxiety_align/screens/attack/journal.dart';

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
  late List<List<bool>> options;
  late List<String> others;

  @override
  void initState() {
    userID = AuthService().currUserID!;
    page = Page.confirm;
    section = Section.symptoms;rating = -1;
    options = <List<bool>>[
      List<bool>.filled(5, false),
      List<bool>.filled(5, false),
      List<bool>.filled(5, false),
      List<bool>.filled(5, false)
    ];
    others = List<String>.filled(4, '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) => buildHelper();

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
        if(page == Page.other && text == 'next' && options[0][option]) break;
        options[0][option] = !options[0][option];
        break;
      case Section.triggers:
        if(page == Page.other && text == 'prev') break;
        if(page == Page.other && text == 'next' && options[1][option]) break;
        options[1][option] = !options[1][option];
        break;
      case Section.thoughts:
        if(page == Page.other && text == 'prev') break;
        if(page == Page.other && text == 'next' && options[2][option]) break;
        options[2][option] = !options[2][option];
        break;
      case Section.solution:
        if(page == Page.other && text == 'prev') break;
        if(page == Page.other && text == 'next' && options[3][option]) break;
        options[3][option] = !options[3][option];
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
          changeOther: changeOther,
          changeRating: changeRating
        );
      case Page.other:
        return Other(
          page: page,
          section: section,
          rating: rating,
          changePage: changePage,
          changeSection: changeSection,
          changeOption: changeOption,
          changeOther: changeOther,
          changeRating: changeRating
        );
      default:
        return Journal(
          userID: userID,
          timestamp: timestamp
        );
    }
  }
}
