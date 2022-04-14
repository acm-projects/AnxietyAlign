import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:anxiety_align/widgets/audio_visualizer.dart';
import 'package:anxiety_align/services/database.dart';
import 'package:anxiety_align/services/storage.dart';

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
  StreamSubscription? decibelSubscription;
  late List<int> audio;
  late List<double> currentDecibels, decibels;

  @override
  void initState() {
    textController = TextEditingController();
    player = FlutterSoundPlayer();
    initAsync();
    currentDecibels = <double>[];
    super.initState();
  }
  Future<void> initAsync() async {
    DatabaseService(userID: widget.userID)
      .getJournalTextFromID(widget.timestamp).then((text) {
        textController.text = text!;
      }
    );
    StorageService storage = StorageService(widget.userID);
    audio = await storage.getJournalAudioFromID(widget.timestamp) ?? <int>[];
    decibels = await storage.getJournalDecibelsFromID(widget.timestamp)
      ?? <double>[];
    await player.openPlayer();
    await player.setSubscriptionDuration(widget.timePerDecibel);
    setState(() { });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: widget.lightGreen,
    body: body()
  );

  Widget body() => Padding(
    padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
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
          ]
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
        fontFamily: 'WingDings'
        )
      ),
      widget.widgetSpace,
      TextFormField(
        controller: textController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.darkGreen,
              width: 2.5
            ),
            borderRadius: BorderRadius.circular(10.0)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.darkGreen,
              width: 2.5
            ),
            borderRadius: BorderRadius.circular(10.0)
          ),
          filled: true,
          fillColor: Colors.white
        ),
        style: const TextStyle(
          fontSize: 22.0,
          fontFamily: 'WingDings'
        ),
        readOnly: true,
        maxLines: 5,
        minLines: 5
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
          fontFamily: 'WingDings'
        )
      ),
      widget.widgetSpace,
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)
        ),
        height: 40.0,
        child: Row(
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                switch(player.playerState) {
                  case PlayerState.isPlaying: await player.pausePlayer(); break;
                  case PlayerState.isPaused: await player.resumePlayer(); break;
                  default:
                    currentDecibels.clear();
                    decibelSubscription = player.onProgress!.listen((event) {
                      if(currentDecibels.length < decibels.length) {
                        currentDecibels.add(decibels[currentDecibels.length]);
                      }
                      setState(() { });
                    });
                    await player.startPlayer(
                      fromDataBuffer: Uint8List.fromList(audio),
                      codec: Codec.pcm16,
                      whenFinished: () async {
                        await decibelSubscription?.cancel();
                        decibelSubscription = null;
                      }
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
                  decibels: currentDecibels,
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
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: widget.darkGreen)
      )
    ),
    child: const Center(child: Text('back'))
  );
}
