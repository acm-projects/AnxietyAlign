import 'package:flutter/material.dart';
import 'package:anxiety_align/screens/attack/attack.dart' as attack;
import 'package:anxiety_align/widgets/arrow_buttons.dart';

class Rating extends StatefulWidget {
  final attack.Page page;
  final attack.Section section;
  final int rating;
  final List<int> options;
  final Function changePage;
  final Function changeSection;
  final Function changeRating;
  final Function changeOption;
  final Function changeOther;
  final Color highlightGreen;
  final Color lightGreen;
  final Color darkGreen;
  final double horizontalMargin;
  const Rating({
    Key? key,
    required this.page,
    required this.section,
    required this.rating,
    required this.options,
    required this.changePage,
    required this.changeSection,
    required this.changeRating,
    required this.changeOption,
    required this.changeOther,
    this.highlightGreen = const Color(0xFFD3FBCD),
    this.lightGreen = const Color(0xFF96B4A0),
    this.darkGreen = const Color(0xFF3A8628),
    this.horizontalMargin = 15.0
  }) : super(key: key);
  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: widget.lightGreen,
    body: body()
  );

  Widget body() => Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
        child: title()
      ),
      ratingButtons(),
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

  Widget title() => const Text(
    'rate your attack on a scale from 1 to 10',
    style: TextStyle(
      color: Colors.black,
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
      letterSpacing: 5.0
    ),
    textAlign: TextAlign.center
  );

  Widget ratingButtons() {
    SizedBox buttonSpace = const SizedBox(width: 15.0);
    SizedBox rowSpace = const SizedBox(height: 15.0);
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ratingButton(1),
            buttonSpace,
            ratingButton(2),
            buttonSpace,
            ratingButton(3)
          ]
        ),
        rowSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ratingButton(4),
            buttonSpace,
            ratingButton(5),
            buttonSpace,
            ratingButton(6)
          ]
        ),
        rowSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ratingButton(7),
            buttonSpace,
            ratingButton(8),
            buttonSpace,
            ratingButton(9)
          ]
        ),
        rowSpace,
        ratingButton(10)
      ],
    );
  }
  Widget ratingButton(int rating) => OutlinedButton(
    onPressed: () => widget.changeRating(rating),
    style: OutlinedButton.styleFrom(
      primary: Colors.black,
      backgroundColor: widget.rating == rating ? widget.highlightGreen
        : Colors.white,
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 3.0
      ),
      fixedSize: const Size(60.0, 60.0),
      side: BorderSide(
        color: widget.darkGreen,
        width: 4.0
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: widget.darkGreen),
        borderRadius: BorderRadius.circular(10.0)
      ),
      alignment: Alignment.center
    ),
    child: Text(rating.toString())
  );
}
