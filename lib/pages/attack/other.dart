import 'package:flutter/material.dart';
import 'package:counter/widgets/arrow_buttons.dart';
import 'package:counter/pages/attack/attack.dart' as attack;

class Other extends StatefulWidget {
  final attack.Page page;
  final attack.Section section;
  final int rating;
  final Function changePage;
  final Function changeSection;
  final Function changeOption;
  final Function changeOther;
  final Color highlightGreen;
  final Color lightGreen;
  final Color darkGreen;
  final double horizontalMargin;
  final SizedBox wideSpace;
  final SizedBox sectionSpace;
  final SizedBox widgetSpace;
  const Other({
    Key? key,
    required this.page,
    required this.section,
    required this.rating,
    required this.changePage,
    required this.changeSection,
    required this.changeOption,
    required this.changeOther,
    this.highlightGreen = const Color(0xFFD3FBCD),
    this.lightGreen = const Color(0xFF96B4A0),
    this.darkGreen = const Color(0xFF3A8628),
    this.horizontalMargin = 30.0,
    this.wideSpace = const SizedBox(height: 60.0),
    this.sectionSpace = const SizedBox(height: 30.0),
    this.widgetSpace = const SizedBox(height: 10.0)
  }) : super(key: key);
  @override
  State<Other> createState() => _OtherState();
}

class _OtherState extends State<Other> {
  late TextEditingController textController;

  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: widget.lightGreen,
    resizeToAvoidBottomInset: false,
    body: body()
  );

  Widget body() => Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
        child: Column(
          children: <Widget>[
            widget.wideSpace,
            Center(child: Image.asset('assets/icons/messages.png')),
            widget.sectionSpace,
            title(),
            widget.sectionSpace,
            otherButton(),
            widget.sectionSpace,
            textEntry(),
            widget.wideSpace
          ]
        )
      ),
      ArrowButtons(
        page: widget.page,
        section: widget.section,
        changePage: widget.changePage,
        changeSection: widget.changeSection,
        changeOption: widget.changeOption,
        changeOther: widget.changeOther,
        rating: widget.rating,
        other: textController.text,
        darkGreen: widget.darkGreen
      )
    ]
  );

  Widget title() => const Text(
    'what physical reactions are you having?',
    style: TextStyle(
      color: Colors.black,
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 5.0
    ),
    textAlign: TextAlign.center
  );

  Widget otherButton() => Container(
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: widget.highlightGreen,
      border: Border.all(
        color: widget.darkGreen,
        width: 2.5
      ),
      borderRadius: BorderRadius.circular(7.5)
    ),
    height: 45.0,
    child: const Text(
      '   other',
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 3.0
      ),
    )
  );

  Widget textEntry() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'enter text here (5 words max.):',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 3.0
        )
      ),
      widget.widgetSpace,
      TextFormField(
        controller: textController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.darkGreen,
              width: 2.5
            ),
            borderRadius: BorderRadius.circular(7.5)
          ),
          filled: true,
          fillColor: Colors.white
        ),
        style: const TextStyle(fontSize: 12.0),
        maxLines: 5,
        minLines: 5,
        onChanged: (text) => setState(() { })
      )
    ]
  );
}
