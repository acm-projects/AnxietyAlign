import 'package:flutter/material.dart';
import 'package:anxiety_align/screens/attack/attack.dart' as attack;

class ArrowButtons extends StatefulWidget {
  final attack.Page page;
  final attack.Section section;
  final Function changePage;
  final Function changeSection;
  final Function changeOption;
  final Function changeOther;
  final int rating;
  final String other;
  final Function? onNext;
  final Color darkGreen;
  const ArrowButtons({
    Key? key,
    required this.page,
    required this.section,
    required this.changePage,
    required this.changeSection,
    required this.changeOption,
    required this.changeOther,
    required this.rating,
    this.other = '',
    this.darkGreen = const Color(0xFF3A8628),
    this.onNext
  }) : super(key: key);
  @override
  State<ArrowButtons> createState() => _ArrowButtonsState();
}

class _ArrowButtonsState extends State<ArrowButtons> {
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      arrowButton('prev'),
      arrowButton(widget.section == attack.Section.solution ? 'done' : 'next')
    ]
  );

  int wordcount(String string) {
    int words = 0;
    for(int i = 0; i < string.length; i++) {
      if(string[i].trim() == '') continue;
      if(i == 0 || string[i - 1].trim() == '') words++;
    }
    return words;
  }

  Widget arrowButton(String text) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: OutlinedButton(
      onPressed: () {
        if(text == 'prev') {
          if(widget.page == attack.Page.other) {
            widget.changeOption(4, text);
            widget.changePage(attack.Page.question);
            return;
          }
          else if(widget.page == attack.Page.rating) {
            widget.changePage(attack.Page.question);
          }
          if(widget.section == attack.Section.symptoms) {
            widget.changePage(attack.Page.confirm);
            return;
          }
          if(widget.page != attack.Page.other &&
          widget.section == attack.Section.triggers) {
            widget.changePage(attack.Page.rating);
          }
          widget.changeSection(attack.Section.values[widget.section.index - 1]);
          return;
        }
        if(widget.onNext != null) widget.onNext!();
        if(widget.page == attack.Page.other) {
          int words = wordcount(widget.other);
          if(words == 0 || words > 5) return;
          widget.changeOption(4, text);
          widget.changeOther(widget.other);
          widget.changePage(attack.Page.question);
        }
        else if(widget.page == attack.Page.rating) {
          widget.changePage(attack.Page.question);
        }
        if(widget.section == attack.Section.solution) {
          if(widget.rating == -1) return;
          widget.changePage(attack.Page.confirm);
          widget.changeSection(attack.Section.journal);
          return;
        }
        if(widget.section == attack.Section.symptoms) {
          widget.changePage(attack.Page.rating);
        }
        widget.changeSection(attack.Section.values[widget.section.index + 1]);
      },
      style: OutlinedButton.styleFrom(
        primary: Colors.black,
        backgroundColor: Colors.white,
        textStyle: const TextStyle(
          color: Colors.black,
          letterSpacing: 3.0,
          fontSize: 22.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold
        ),
        fixedSize: const Size(100.0, 40.0),
        side: BorderSide(
          color: widget.darkGreen,
          width: 3.0
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: widget.darkGreen)
        )
      ),
      child: Center(child: Icon(
        text == 'prev' ? Icons.arrow_back_sharp : Icons.arrow_forward_sharp,
        size: 28
      ))
    )
  );
}
