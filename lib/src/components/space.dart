import 'package:flutter/material.dart';

/// Horizontal spaces using [SizedBox] widget
class TltXSpace extends StatelessWidget {
  const TltXSpace(this.width, {Key? key}) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}

/// Vertical spaces using [SizedBox] widget
class TltYSpace extends StatelessWidget {
  const TltYSpace(this.height, {Key? key}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
