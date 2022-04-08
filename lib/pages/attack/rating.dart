import 'package:flutter/material.dart';
import 'package:counter/widgets/arrow_buttons.dart';
import 'package:counter/pages/attack/attack.dart' as attack;

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
    this.darkGreen = const Color(0xFF3A8628)
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
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 150.0),
            title(),
            const SizedBox(height: 80.0)
          ]
        )
      ),
      ratingButtons(),
      const SizedBox(height: 100.0),
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
    SizedBox buttonSpace = const SizedBox(width: 20.0);
    SizedBox rowSpace = const SizedBox(height: 50.0);
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ratingButton(1),
            buttonSpace,
            ratingButton(2),
            buttonSpace,
            ratingButton(3),
            buttonSpace,
            ratingButton(4),
            buttonSpace,
            ratingButton(5)
          ]
        ),
        rowSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ratingButton(6),
            buttonSpace,
            ratingButton(7),
            buttonSpace,
            ratingButton(8),
            buttonSpace,
            ratingButton(9),
            buttonSpace,
            ratingButton(10)
          ]
        )
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
        borderRadius: BorderRadius.circular(8.0)
      ),
      alignment: Alignment.center
    ),
    child: Text(rating.toString())
  );
}
