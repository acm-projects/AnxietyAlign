import 'package:flutter/material.dart';
import 'package:anxiety_align/widgets/arrow_buttons.dart';
import 'package:anxiety_align/screens/attack/attack.dart' as attack;

class Question extends StatefulWidget {
  final attack.Page page;
  final attack.Section section;
  final int rating;
  final List<int> options;
  final Function changePage;
  final Function changeSection;
  final Function changeOption;
  final Function changeOther;
  final Color highlightGreen;
  final Color lightGreen;
  final Color darkGreen;
  final SizedBox sectionSpace;
  const Question({
    Key? key,
    required this.page,
    required this.section,
    required this.rating,
    required this.options,
    required this.changePage,
    required this.changeSection,
    required this.changeOption,
    required this.changeOther,
    this.highlightGreen = const Color(0xFFD3FBCD),
    this.lightGreen = const Color(0xFF96B4A0),
    this.darkGreen = const Color(0xFF3A8628),
    this.sectionSpace = const SizedBox(height: 30.0)
  }) : super(key: key);
  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: widget.lightGreen,
    body: body()
  );

  Widget body() {
    List<String> options = getOptions(widget.section);
    return Column(
      children: <Widget>[
        const SizedBox(height: 75.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: title()
        ),
        const SizedBox(height: 50.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: <Widget>[
              questionButton(0, options[0]),
              widget.sectionSpace,
              questionButton(1, options[1]),
              widget.sectionSpace,
              questionButton(2, options[2]),
              widget.sectionSpace,
              questionButton(3, options[3]),
              widget.sectionSpace,
              questionButton(4, 'other')
            ]
          )
        ),
        const SizedBox(height: 50.0),
        ArrowButtons(
          page: widget.page,
          section: widget.section,
          changePage: widget.changePage,
          changeSection: widget.changeSection,
          changeOption: widget.changeOption,
          changeOther: widget.changeOther,
          rating: widget.rating,
          darkGreen: widget.darkGreen
        )
      ]
    );
  }

  List<String> getOptions(attack.Section section) {
    if(section == attack.Section.symptoms) {
      return <String>[
        'rapid breathing',
        'increased heart rate',
        'trembling / shaking',
        'feeling dizzy'
      ];
    }
    else if(section == attack.Section.triggers) {
      return <String>[
        'conflict with a loved one',
        'a social event',
        'academic stress',
        'financial distress'
      ];
    }
    else if(section == attack.Section.thoughts) {
      return <String>[
        'i feel stressed',
        'i feel upset',
        'i feel exhausted',
        'i feel inadequate'
      ];
    }
    else {
      return <String>[
        'breathing exercises',
        'found a focus object',
        'light exercise (ex. walking)',
        'leaving current environment'
      ];
    }
  }

  Widget title() => Text(
    getTitle(),
    style: const TextStyle(
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 5.0,
      color: Colors.black
    ),
    textAlign: TextAlign.center
  );
  String getTitle() {
    switch(widget.section) {
      case attack.Section.symptoms:
        return 'what physical reactions are you having?';
      case attack.Section.triggers:
        return 'what was the source of your anxious feeling?';
      case attack.Section.thoughts:
        return 'what are your thoughts at the moment?';
      default:
        return 'what did you do to calm down?';
    }
  }

  Widget questionButton(int option, String text) => OutlinedButton(
    onPressed: () {
      if(option == 4) {
        widget.changePage(attack.Page.other);
        return;
      }
      widget.changeOption(option);
    },
    style: OutlinedButton.styleFrom(
      primary: Colors.black,
      backgroundColor: isHighlighted(option) ? widget.highlightGreen
        : Colors.white,
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 3.0
      ),
      minimumSize: const Size(75.0, 45.0),
      side: BorderSide(
        color: widget.darkGreen,
        width: 2.5
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.5),
        side: BorderSide(color: widget.darkGreen)
      )
    ),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text('   ' + text)
    )
  );
  bool isHighlighted(int option) {
    int highlighted;
    switch(widget.section) {
      case attack.Section.symptoms: highlighted = widget.options[0]; break;
      case attack.Section.triggers: highlighted = widget.options[1]; break;
      case attack.Section.thoughts: highlighted = widget.options[2]; break;
      default: highlighted = widget.options[3];
    }
    return option == highlighted ? true : false;
  }
}
