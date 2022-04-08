import 'package:flutter/material.dart';
import 'package:anxiety_align/screens/journal/journal.dart';
import 'package:anxiety_align/screens/graphs/graphs1.dart';
import 'package:anxiety_align/screens/home.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: BottomAppBar(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 12),
                    IconButton(
                        icon: Icon(Icons.bar_chart,
                            size: 68, color: Color(0xff3a8628)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Graphs1()));
                        }),
                    SizedBox(width: 95),
                    Align(
                      alignment: Alignment.center,
                      child: IconButton(
                          icon: Icon(Icons.face_rounded,
                              size: 60, color: Color(0xff3a8628)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          }),
                    ),
                    SizedBox(width: 95),
                    IconButton(
                      icon: Icon(Icons.book_rounded,
                          size: 60, color: Color(0xff3a8628)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Journal()));
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
