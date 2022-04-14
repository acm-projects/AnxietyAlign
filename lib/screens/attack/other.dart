import 'package:flutter/material.dart';
import 'package:anxiety_align/screens/attack/attack.dart' as attack;
import 'package:anxiety_align/widgets/arrow_buttons.dart';

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
    this.horizontalMargin = 15.0,
    this.wideSpace = const SizedBox(height: 60.0),
    this.sectionSpace = const SizedBox(height: 30.0),
    this.widgetSpace = const SizedBox(height: 10.0)
  }) : super(key: key);
  @override
  State<Other> createState() => _OtherState();
}

class _OtherState extends State<Other> {
  late TextEditingController textController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    textController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: widget.lightGreen,
    resizeToAvoidBottomInset: false,
    body: body()
  );

  Widget body() => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Container(
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
        child: Column(
          children: <Widget>[
            Center(child: Image.asset('assets/images/messages.png')),
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
        darkGreen: widget.darkGreen,
        onNext: () => formKey.currentState!.validate()
      )
    ]
  );

  Widget title() => Text(
    getTitle(),
    style: const TextStyle(
      color: Colors.black,
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 5.0
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

  Widget otherButton() => Container(
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
      color: widget.highlightGreen,
      border: Border.all(
        color: widget.darkGreen,
        width: 2.5
      ),
      borderRadius: BorderRadius.circular(10.0)
    ),
    height: 40.0,
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

  OutlineInputBorder textEntryBorder() => OutlineInputBorder(
    borderSide: BorderSide(
      color: widget.darkGreen,
      width: 2.5
    ),
    borderRadius: BorderRadius.circular(10.0)
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
      Form(
        key: formKey,
        child: TextFormField(
          controller: textController,
          decoration: InputDecoration(
            errorBorder: textEntryBorder(),
            focusedBorder: textEntryBorder(),
            focusedErrorBorder: textEntryBorder(),
            enabledBorder: textEntryBorder(),
            filled: true,
            fillColor: Colors.white
          ),
          style: const TextStyle(fontSize: 22.0),
          cursorColor: Colors.black,
          maxLines: 2,
          minLines: 2,
          onChanged: (text) => setState(() { }),
          validator: ((text) {
            if(text == null) return 'Text cannot be empty';
            int words = 0;
            for(int i = 0; i < text.length; i++) {
              if(text[i].trim() == '') continue;
              if(i == 0 || text[i - 1].trim() == '') words++;
            }
            if(words == 0) return 'Text cannot be empty';
            if(words > 5) return 'Text cannot be more than five words';
            return null;
          })
        )
      ),
      widget.widgetSpace,
      const Text(
        '(you can add more in your journal at the end of the log!)',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          letterSpacing: 3.0
        )
      )
    ]
  );
}
