import 'package:flutter/material.dart';
import 'package:tlt_design/src/foundations/colors.dart';
import 'dart:math' as math;

import 'package:tlt_design/src/utils/properties.dart';

/// A custom slider value indicator shape.
class TltSliderValueIndicatorShape extends SliderComponentShape {
  final TltSliderIndicatorMode mode;
  late final _TltSliderValueIndicatorPathPainter _pathPainter;

  /// Constructs a [TltSliderValueIndicatorShape] with the specified mode (TltSliderIndicatorMode).
  TltSliderValueIndicatorShape({required this.mode}) {
    _pathPainter = _TltSliderValueIndicatorPathPainter(mode: mode);
  }

  @override
  Size getPreferredSize(
    bool isEnabled,
    bool isDiscrete, {
    TextPainter? labelPainter,
    double? textScaleFactor,
  }) {
    assert(labelPainter != null);
    assert(textScaleFactor != null && textScaleFactor >= 0);

    /// Get preferred size using the custom path painter
    return _pathPainter.getPreferredSize(labelPainter!, textScaleFactor!);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;
    final double scale = activationAnimation.value;

    /// Paint using the custom path painter
    _pathPainter.paint(
      parentBox: parentBox,
      canvas: canvas,
      center: center,
      scale: scale,
      labelPainter: labelPainter,
      textScaleFactor: textScaleFactor,
      sizeWithOverflow: sizeWithOverflow,
      backgroundPaintColor: sliderTheme.valueIndicatorColor!,
    );
  }
}

/// A custom range slider value indicator shape.
class TltRangeSliderValueIndicatorShape extends RangeSliderValueIndicatorShape {
  final TltSliderIndicatorMode mode;
  late final _TltSliderValueIndicatorPathPainter _pathPainter;

  /// Constructs a [TltRangeSliderValueIndicatorShape] with the specified mode(TltSliderIndicatorMode).
  TltRangeSliderValueIndicatorShape({required this.mode}) {
    _pathPainter = _TltSliderValueIndicatorPathPainter(mode: mode);
  }

  @override
  Size getPreferredSize(
    bool isEnabled,
    bool isDiscrete, {
    required TextPainter labelPainter,
    required double textScaleFactor,
  }) {
    assert(textScaleFactor >= 0);

    /// Get preferred size using the custom path painter
    return _pathPainter.getPreferredSize(labelPainter, textScaleFactor);
  }

  @override
  double getHorizontalShift({
    RenderBox? parentBox,
    Offset? center,
    TextPainter? labelPainter,
    Animation<double>? activationAnimation,
    double? textScaleFactor,
    Size? sizeWithOverflow,
  }) {
    return _pathPainter.getHorizontalShift(
      parentBox: parentBox!,
      center: center!,
      labelPainter: labelPainter!,
      textScaleFactor: textScaleFactor!,
      sizeWithOverflow: sizeWithOverflow!,
      scale: activationAnimation!.value,
    );
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    Animation<double>? activationAnimation,
    Animation<double>? enableAnimation,
    bool? isDiscrete,
    bool? isOnTop,
    TextPainter? labelPainter,
    double? textScaleFactor,
    Size? sizeWithOverflow,
    RenderBox? parentBox,
    SliderThemeData? sliderTheme,
    TextDirection? textDirection,
    double? value,
    Thumb? thumb,
  }) {
    final Canvas canvas = context.canvas;
    final double scale = activationAnimation!.value;

    /// Paint using the custom path painter
    _pathPainter.paint(
      parentBox: parentBox!,
      canvas: canvas,
      center: center,
      scale: scale,
      labelPainter: labelPainter!,
      textScaleFactor: textScaleFactor!,
      sizeWithOverflow: sizeWithOverflow!,
      backgroundPaintColor: sliderTheme!.valueIndicatorColor!,
      strokePaintColor:
          isOnTop! ? sliderTheme.overlappingShapeStrokeColor : null,
    );
  }
}

class _TltSliderValueIndicatorPathPainter {
  final TltSliderIndicatorMode mode;
  const _TltSliderValueIndicatorPathPainter({required this.mode});

  static const double _triangleHeight = 8.0;
  static const double _labelPadding = 16.0;
  static const double _preferredHeight = 32.0;
  static const double _minLabelWidth = 16.0;
  static const double _bottomTipYOffset = 14.0;
  static const double _preferredHalfHeight = _preferredHeight / 2;
  static const double _upperRectRadius = 8;

  Size getPreferredSize(
    TextPainter labelPainter,
    double textScaleFactor,
  ) {
    return Size(
      _upperRectangleWidth(labelPainter, 1, textScaleFactor),
      labelPainter.height + _labelPadding,
    );
  }

  double getHorizontalShift({
    required RenderBox parentBox,
    required Offset center,
    required TextPainter labelPainter,
    required double textScaleFactor,
    required Size sizeWithOverflow,
    required double scale,
  }) {
    assert(!sizeWithOverflow.isEmpty);

    const double edgePadding = 8.0;
    final double rectangleWidth =
        _upperRectangleWidth(labelPainter, scale, textScaleFactor);

    /// Value indicator draws on the Overlay and by using the global Offset
    /// we are making sure we use the bounds of the Overlay instead of the Slider.
    final Offset globalCenter = parentBox.localToGlobal(center);

    /// The rectangle must be shifted towards the center so that it minimizes the
    /// chance of it rendering outside the bounds of the render box. If the shift
    /// is negative, then the lobe is shifted from right to left, and if it is
    /// positive, then the lobe is shifted from left to right.
    final double overflowLeft =
        math.max(0, rectangleWidth / 2 - globalCenter.dx + edgePadding);
    final double overflowRight = math.max(
        0,
        rectangleWidth / 2 -
            (sizeWithOverflow.width - globalCenter.dx - edgePadding));

    if (rectangleWidth < sizeWithOverflow.width) {
      return overflowLeft - overflowRight;
    } else if (overflowLeft - overflowRight > 0) {
      return overflowLeft - (edgePadding * textScaleFactor);
    } else {
      return -overflowRight + (edgePadding * textScaleFactor);
    }
  }

  double _upperRectangleWidth(
      TextPainter labelPainter, double scale, double textScaleFactor) {
    final double unscaledWidth =
        math.max(_minLabelWidth * textScaleFactor, labelPainter.width) +
            _labelPadding * 2;
    return unscaledWidth * scale;
  }

  void paint({
    required RenderBox parentBox,
    required Canvas canvas,
    required Offset center,
    required double scale,
    required TextPainter labelPainter,
    required double textScaleFactor,
    required Size sizeWithOverflow,
    required Color backgroundPaintColor,
    Color? strokePaintColor,
  }) {
    if (scale == 0.0) {
      return;
    }
    assert(!sizeWithOverflow.isEmpty);

    final double rectangleWidth =
        _upperRectangleWidth(labelPainter, scale, textScaleFactor);

    final double horizontalShift = getHorizontalShift(
      parentBox: parentBox,
      center: center,
      labelPainter: labelPainter,
      textScaleFactor: textScaleFactor,
      sizeWithOverflow: sizeWithOverflow,
      scale: scale,
    );

    final double rectHeight = labelPainter.height + _labelPadding;

    final Rect upperRect = Rect.fromLTWH(
      -rectangleWidth / 2 + horizontalShift,
      -_triangleHeight - rectHeight,
      rectangleWidth,
      rectHeight,
    );

    final Path trianglePath = Path()
      ..lineTo(-_triangleHeight, -_triangleHeight)
      ..lineTo(_triangleHeight, -_triangleHeight)
      ..close();

    final RRect upperRRect = RRect.fromRectAndRadius(
      upperRect,
      const Radius.circular(_upperRectRadius),
    );

    trianglePath.addRRect(upperRRect);

    canvas.save();

    canvas.translate(center.dx, center.dy - _bottomTipYOffset);

    canvas.scale(scale, scale);

    if (mode == TltSliderIndicatorMode.tooltip) {
      paintTooltip(
        canvas: canvas,
        center: center,
        scale: scale,
        backgroundPaintColor: backgroundPaintColor,
        trianglePath: trianglePath,
      );
    }

    paintLabel(
      canvas: canvas,
      labelPainter: labelPainter,
      horizontalShift: horizontalShift,
      upperRect: upperRect,
      textOnly: mode == TltSliderIndicatorMode.textOnly,
    );
  }

  void paintTooltip({
    required Canvas canvas,
    required Offset center,
    required double scale,
    Color? strokePaintColor,
    required Color backgroundPaintColor,
    required Path trianglePath,
  }) {
    final Paint fillPaint = Paint()..color = backgroundPaintColor;

    if (strokePaintColor != null) {
      final Paint strokePaint = Paint()
        ..color = strokePaintColor
        ..strokeWidth = 1.0
        ..style = PaintingStyle.stroke;
      // canvas.drawShadow(trianglePath, TltColors.gray[25], 8, false);
      canvas.drawPath(trianglePath, strokePaint);
    }

    canvas.drawShadow(trianglePath, TltColors.gray[25], 8, false);

    canvas.drawPath(trianglePath, fillPaint);
  }

  void paintLabel({
    required Canvas canvas,
    required TextPainter labelPainter,
    required Rect upperRect,
    required double horizontalShift,
    required bool textOnly,
  }) {
    double yScale = 1.0;
    textOnly ? yScale = 1.5 : yScale = 1.0;
    final double bottomTipToUpperRectTranslateY =
        -_preferredHalfHeight / 2 - upperRect.height / yScale;

    canvas.translate(0, bottomTipToUpperRectTranslateY);

    final Offset boxCenter = Offset(horizontalShift, upperRect.height / 2);

    final Offset halfLabelPainterOffset =
        Offset(labelPainter.width / 2, labelPainter.height / 2);

    final Offset labelOffset = boxCenter - halfLabelPainterOffset;

    labelPainter.paint(canvas, labelOffset);

    canvas.restore();
  }
}
