import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:anxiety_align/widgets/audio_visualizer.dart';
import 'package:anxiety_align/services/database.dart';

class Card extends StatefulWidget {
  final String userID;
  final String timestamp;
  final Function buildJournals;
  final Duration timePerDecibel;
  final int decibelsPerStroke;
  final double strokeWidth;
  final double strokeGap;
  final Color lightGreen;
  final Color darkGreen;
  final double horizontalMargin;
  final SizedBox sectionSpace;
  final SizedBox widgetSpace;
  const Card({
    Key? key,
    required this.userID,
    required this.timestamp,
    required this.buildJournals,
    this.timePerDecibel = const Duration(milliseconds: 50),
    this.decibelsPerStroke = 1,
    this.strokeWidth = 6.0,
    this.strokeGap = 1.0,
    this.lightGreen = const Color(0xFF96B4A0),
    this.darkGreen = const Color(0xFF3A8628),
    this.horizontalMargin = 15.0,
    this.sectionSpace = const SizedBox(height: 30.0),
    this.widgetSpace = const SizedBox(height: 10.0)
  }) : super(key: key);
  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  late TextEditingController textController;
  late FlutterSoundPlayer player;
  late List<int> audio;
  //late List<double> decibels;

  @override
  void initState() {
    textController = TextEditingController();
    initAsync();
    player = FlutterSoundPlayer()
      ..openPlayer();
    super.initState();
  }
  Future<void> initAsync() async {
    DatabaseService(userID: widget.userID)
      .getJournalTextFromID(widget.timestamp).then((text) {
        textController.text = text!;
      }
    );
    audio = <int>[];
    //StorageService(widget.userID).getJournalAudioFromID(widget.timestamp);
    //audio = await StorageService(widget.userID)
    //  .getJournalAudioFromID(widget.timestamp);
    //decibels = <double>[];
    setState(() { });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: widget.lightGreen,
    body: body()
  );

  Widget body() => Container(
    margin: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            textDisplay(),
            widget.sectionSpace,
            audioDisplay()
          ]
        ),
        const SizedBox(height: 50.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            arrowButton()
          ],
        )
      ]
    )
  );

  Widget textDisplay() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'text:',
        style: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Wingdings'
        )
      ),
      widget.widgetSpace,
      TextFormField(
        controller: textController,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.darkGreen,
              width: 2.5
            ),
            borderRadius: BorderRadius.circular(7.5)
          ),
          filled: true,
          fillColor: Colors.white
        ),
        style: const TextStyle(
          fontSize: 12.0,
          fontFamily: 'Wingdings'
        ),
        maxLines: 9,
        minLines: 9,
        enabled: false
      )
    ]
  );

  Widget audioDisplay() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'audio:',
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Wingdings'
        )
      ),
      widget.widgetSpace,
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7.5)
        ),
        height: 40.0,
        child: Row(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                switch(player.playerState) {
                  case PlayerState.isPlaying: player.pausePlayer(); break;
                  case PlayerState.isPaused: player.resumePlayer(); break;
                  default: player.startPlayer(
                    fromDataBuffer: Uint8List.fromList(audio),
                    codec: Codec.pcm16
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 0.0,
                padding: EdgeInsets.zero,
                minimumSize: const Size(0.0, 0.0)
              ),
              child: Icon(
                Icons.play_arrow_rounded,
                size: 40.0,
                color: widget.darkGreen
              )
            ),
            Expanded(
              child: SizedBox(
                height: 35.0,
                child: AudioVisualizer(
                  waveColor: widget.darkGreen,
                  decibels: const <double>[],
                  decibelsPerStroke: widget.decibelsPerStroke,
                  strokeWidth: widget.strokeWidth,
                  strokeGap: widget.strokeGap
                )
              )
            )
          ]
        )
      )
    ]
  );

  Widget arrowButton() => OutlinedButton(
    onPressed: () => widget.buildJournals(),
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
      minimumSize: const Size(100.0, 45.0),
      side: BorderSide(
        color: widget.darkGreen,
        width: 3.0
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.5),
        side: BorderSide(color: widget.darkGreen)
      )
    ),
    child: const Center(child: Text('back'))
  );
}
