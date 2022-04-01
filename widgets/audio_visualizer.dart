import 'package:flutter/material.dart';

class AudioVisualizer extends StatefulWidget {
  final Color waveColor;
  final List<double> decibels;
  final int decibelsPerStroke;
  final double strokeWidth;
  final double strokeGap;
  final bool antiAlias;
  const AudioVisualizer({
    Key? key,
    required this.waveColor,
    required this.decibels,
    required this.decibelsPerStroke,
    this.strokeWidth = 5.0,
    this.strokeGap = 0.75,
    this.antiAlias = true
  }) : super(key: key);
  @override
  State<AudioVisualizer> createState() => _AudioVisualizerState();
}

class _AudioVisualizerState extends State<AudioVisualizer> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: CustomPaint(
        painter: _AudioVisualizerPainter(
          waveColor: widget.waveColor,
          decibels: widget.decibels,
          decibelsPerStroke: widget.decibelsPerStroke,
          strokeWidth: widget.strokeWidth,
          strokeGap: widget.strokeGap,
          antiAlias: widget.antiAlias
        )
      )
    );
  }
}

class _AudioVisualizerPainter extends CustomPainter {
  final Color waveColor;
  final List<double> decibels;
  final int decibelsPerStroke;
  final double strokeWidth;
  final double strokeGap;
  final bool antiAlias;
  final Paint wavePaint;
  _AudioVisualizerPainter({
    required this.waveColor,
    required this.decibels,
    required this.decibelsPerStroke,
    this.strokeWidth = 5.0,
    this.strokeGap = 0.75,
    this.antiAlias = true
  }) : wavePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round
    ..color = waveColor
    ..strokeWidth = strokeWidth
    ..isAntiAlias = antiAlias;

  @override
  void paint(Canvas canvas, Size size) {
    for(int i = 0; i + decibelsPerStroke < decibels.length;
    i += decibelsPerStroke) {
      final double x = (strokeWidth + strokeGap) * i / decibelsPerStroke
        + strokeWidth / 2.0;
      if(x + strokeWidth / 2.0 > size.width) {
        decibels.removeAt(0);
        continue;
      }
      double length = 0;
      for(int j = i; j < i + decibelsPerStroke && j < decibels.length; j++) {
        length += decibels.elementAt(j);
      }
      length *= (size.height - strokeWidth) / 120.0 / decibelsPerStroke;
      final double y = (size.height - length) / 2.0;
      canvas.drawLine(
        Offset(x, y),
        Offset(x, y + length),
        wavePaint
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
