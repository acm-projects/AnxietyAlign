import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:anxiety_align/services/database.dart';
import 'package:anxiety_align/services/storage.dart';
import 'package:anxiety_align/widgets/audio_visualizer.dart';

class JournalEntry extends StatefulWidget {
  final String userID;
  final DateTime timestamp;
  final Function? onSave;
  final Duration timePerDecibel;
  final int decibelsPerStroke;
  final double strokeWidth;
  final double strokeGap;
  final Color lightGreen;
  final Color darkGreen;
  final SizedBox sectionSpace;
  final SizedBox widgetSpace;
  const JournalEntry({
    Key? key,
    required this.userID,
    required this.timestamp,
    this.onSave,
    this.timePerDecibel = const Duration(milliseconds: 50),
    this.decibelsPerStroke = 1,
    this.strokeWidth = 6.0,
    this.strokeGap = 1.0,
    this.lightGreen = const Color(0xFF96B4A0),
    this.darkGreen = const Color(0xFF3A8628),
    this.sectionSpace = const SizedBox(height: 30.0),
    this.widgetSpace = const SizedBox(height: 10.0)
  }) : super(key: key);
  @override
  State<JournalEntry> createState() => _JournalEntryState();
}

class _JournalEntryState extends State<JournalEntry> {
  late TextEditingController textController;
  late FlutterSoundRecorder recorder;
  StreamSubscription? decibelSubscription;
  StreamSubscription? audioSubscription;
  late StreamController<Food> streamController;
  late List<double> decibels;
  late List<int> audio;

  @override
  void initState() {
    textController = TextEditingController();
    recorder = FlutterSoundRecorder()
      ..openRecorder()
      ..setSubscriptionDuration(widget.timePerDecibel);
    streamController = StreamController<Food>.broadcast();
    decibels = <double>[];
    audio = <int>[];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      textEntry(),
      widget.sectionSpace,
      audioEntry(),
      widget.sectionSpace,
      saveButton()
    ]);
  }

  Widget textEntry() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'enter text here:',
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
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.darkGreen, width: 2.5),
            borderRadius: BorderRadius.circular(7.5)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.darkGreen, width: 2.5),
            borderRadius: BorderRadius.circular(7.5)
          ),
          filled: true,
          fillColor: Colors.white
        ),
        style: const TextStyle(fontSize: 22.0, fontFamily: 'Wingdings'),
        maxLines: 5,
        minLines: 5,
        cursorColor: Colors.black
      )
    ]
  );

  Widget audioEntry() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'enter audio here:',
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
        child: Row(children: <Widget>[
          ElevatedButton(
            onPressed: () async {
              if (recorder.isRecording) {
                await decibelSubscription?.cancel();
                decibelSubscription = null;
                await audioSubscription?.cancel();
                audioSubscription = null;
                await recorder.stopRecorder();
                return;
              }
              if ((await Permission.microphone.request()).isDenied) return;
              decibels.clear();
              audio.clear();
              decibelSubscription = recorder.onProgress!.listen((event) =>
                  setState(() => decibels.add(event.decibels!)));
              audioSubscription = streamController.stream.listen((event) {
                if (event is! FoodData) return;
                audio.addAll(event.data!);
              });
              await recorder.startRecorder(
                codec: Codec.pcm16,
                toStream: streamController.sink
              );
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
                decibels: decibels,
                decibelsPerStroke: widget.decibelsPerStroke,
                strokeWidth: widget.strokeWidth,
                strokeGap: widget.strokeGap
              )
            )
          )
        ])
      )
    ]
  );

  Widget saveButton() => ElevatedButton(
    onPressed: () {
      DatabaseService(userID: widget.userID).setJournalText(
        widget.timestamp.toString(),
        textController.text
      );
      StorageService(widget.userID).setJournalDecibels(
        widget.timestamp.toString(),
        decibels
      );
      StorageService(widget.userID).setJournalAudio(
        widget.timestamp.toString(),
        audio
      );
      if (widget.onSave != null) widget.onSave!();
      textController.text = '';
      decibels = <double>[];
      audio = <int>[];
      FocusScope.of(context).requestFocus(FocusNode());
    },
    style: ElevatedButton.styleFrom(
      primary: Colors.white,
      elevation: 0.0,
      fixedSize: const Size(100.0, 45.0),
      side: BorderSide(color: widget.darkGreen, width: 3.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5))
    ),
    child: const Text(
      'save',
      style: TextStyle(
        color: Colors.black,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Wingdings'
      )
    )
  );
}
