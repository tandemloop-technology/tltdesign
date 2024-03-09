import 'package:flutter/material.dart';
import 'package:tlt_design/src/core/paints.dart';
import 'package:tlt_design/src/foundations/theme.dart';
import 'package:tlt_design/src/utils/properties.dart';

class TltSlider extends StatelessWidget {
  static final TltTheme _theme = TltTheme.instance;
  final double value;
  final double min;
  final double max;
  final int? divisions;
  final double? trackHeight;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? thumbColor;
  final double? thumbSize;
  final double? thumbElevation;
  final double? overlayRadius;
  final Color? overlayColor;
  final String? label;
  final TltSliderIndicatorMode? valueIndicatorMode;
  final Color? valueIndicatorColor;
  final TextStyle? valueIndicatorTextStyle;
  final bool enabled;
  final MouseCursor? mouseCursor;
  final bool autoFocus;
  final FocusNode? focusNode;
  final ValueSetter<double> onChanged;
  final ValueSetter<double>? onChangeStart;
  final ValueSetter<double>? onChangeEnd;
  final SliderThemeData? sliderTheme;
  final String Function(double)? semanticFormatterCallback;

  const TltSlider({
    Key? key,
    required this.value,
    this.min = 0.0,
    this.max = 100.0,
    this.divisions,
    this.label,
    this.enabled = true,
    this.mouseCursor,
    this.autoFocus = false,
    this.focusNode,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.semanticFormatterCallback,
    this.sliderTheme,
    this.trackHeight,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.thumbColor,
    this.overlayColor,
    this.valueIndicatorColor,
    this.valueIndicatorTextStyle,
    this.thumbSize,
    this.thumbElevation,
    this.overlayRadius,
    this.valueIndicatorMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SliderThemeData effectiveSliderTheme = SliderThemeData(
      activeTrackColor: sliderTheme?.activeTrackColor ??
          activeTrackColor ??
          _theme.sliderActiveTrackColor,
      inactiveTrackColor: sliderTheme?.inactiveTrackColor ??
          inactiveTrackColor ??
          _theme.sliderInactiveTrackColor,
      trackHeight:
          sliderTheme?.trackHeight ?? trackHeight ?? _theme.sliderTrackHeight,
      overlayShape: _buildOverlayShape(),
      overlayColor: sliderTheme?.overlayColor ??
          overlayColor ??
          _theme.sliderThumbColor.withOpacity(0.25),
      showValueIndicator: _showValueIndicator(),
      valueIndicatorColor: sliderTheme?.valueIndicatorColor ??
          valueIndicatorColor ??
          _theme.sliderValueIndicatorColor,
      valueIndicatorTextStyle: sliderTheme?.valueIndicatorTextStyle ??
          valueIndicatorTextStyle ??
          _theme.sliderValueIndicatorTextStyle,
      thumbColor:
          sliderTheme?.thumbColor ?? thumbColor ?? _theme.sliderThumbColor,
      activeTickMarkColor: sliderTheme?.activeTickMarkColor,
      inactiveTickMarkColor: sliderTheme?.inactiveTickMarkColor,
      disabledActiveTickMarkColor: sliderTheme?.disabledActiveTickMarkColor,
      disabledInactiveTickMarkColor: sliderTheme?.disabledInactiveTickMarkColor,
      disabledActiveTrackColor: sliderTheme?.disabledActiveTrackColor,
      disabledInactiveTrackColor: sliderTheme?.disabledInactiveTrackColor,
      disabledThumbColor: sliderTheme?.disabledThumbColor,
      minThumbSeparation: sliderTheme?.minThumbSeparation,
      overlappingShapeStrokeColor: sliderTheme?.overlappingShapeStrokeColor,
      thumbSelector: sliderTheme?.thumbSelector,
      trackShape: sliderTheme?.trackShape,
      tickMarkShape: sliderTheme?.tickMarkShape,
      thumbShape: _buildThumbShape(),
      valueIndicatorShape: _buildIndicatorShape(),
    );

    return SliderTheme(
      data: effectiveSliderTheme,
      child: Slider(
        value: value,
        min: min,
        max: max,
        divisions: divisions,
        label: label ?? value.round().toString(),
        onChanged: enabled ? onChanged : null,
        onChangeStart: onChangeStart,
        onChangeEnd: onChangeEnd,
        autofocus: autoFocus,
        focusNode: focusNode,
        mouseCursor: enabled ? mouseCursor : SystemMouseCursors.forbidden,
        semanticFormatterCallback: semanticFormatterCallback,
      ),
    );
  }

  ShowValueIndicator _showValueIndicator() {
    return sliderTheme?.showValueIndicator ??
        ((valueIndicatorMode ?? _theme.sliderValueIndicatorMode) ==
                TltSliderIndicatorMode.never
            ? ShowValueIndicator.never
            : ShowValueIndicator.always);
  }

  SliderComponentShape _buildThumbShape() {
    return sliderTheme?.thumbShape ??
        RoundSliderThumbShape(
          enabledThumbRadius: thumbSize ??
              _theme.sliderThumbSize ??
              (trackHeight ??
                      sliderTheme?.trackHeight ??
                      _theme.sliderTrackHeight) +
                  4,
          elevation: thumbElevation ?? _theme.sliderThumbElevation,
          pressedElevation: (thumbElevation ?? _theme.sliderThumbElevation) > 0
              ? (thumbElevation ?? _theme.sliderThumbElevation) + 2
              : 0,
        );
  }

  SliderComponentShape _buildIndicatorShape() {
    return sliderTheme?.valueIndicatorShape ??
        TltSliderValueIndicatorShape(
          mode: valueIndicatorMode ?? _theme.sliderValueIndicatorMode,
        );
  }

  SliderComponentShape _buildOverlayShape() {
    return sliderTheme?.overlayShape ??
        RoundSliderOverlayShape(
          overlayRadius: overlayRadius ?? _theme.sliderOverlayRadius,
        );
  }
}

class TltRangeSlider extends StatelessWidget {
  static final TltTheme _theme = TltTheme.instance;

  final RangeValues values;
  final double min;
  final double max;
  final int? divisions;
  final double? trackHeight;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? thumbColor;
  final double? thumbSize;
  final double? thumbElevation;
  final double? overlayRadius;
  final Color? overlayColor;
  final RangeLabels? labels;
  final TltSliderIndicatorMode? valueIndicatorMode;
  final Color? valueIndicatorColor;
  final TextStyle? valueIndicatorTextStyle;
  final bool enabled;
  final ValueSetter<RangeValues> onChanged;
  final ValueSetter<RangeValues>? onChangeStart;
  final ValueSetter<RangeValues>? onChangeEnd;
  final SliderThemeData? sliderTheme;
  final String Function(double)? semanticFormatterCallback;

  const TltRangeSlider({
    Key? key,
    required this.values,
    this.min = 0,
    this.max = 100,
    this.divisions,
    this.labels,
    this.enabled = true,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.semanticFormatterCallback,
    this.sliderTheme,
    this.trackHeight,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.overlayColor,
    this.valueIndicatorTextStyle,
    this.thumbColor,
    this.valueIndicatorColor,
    this.thumbSize,
    this.thumbElevation,
    this.overlayRadius,
    this.valueIndicatorMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SliderThemeData effectiveSliderTheme = SliderThemeData(
      activeTrackColor: sliderTheme?.activeTrackColor ??
          activeTrackColor ??
          _theme.sliderActiveTrackColor,
      inactiveTrackColor: sliderTheme?.inactiveTrackColor ??
          inactiveTrackColor ??
          _theme.sliderInactiveTrackColor,
      trackHeight:
          sliderTheme?.trackHeight ?? trackHeight ?? _theme.sliderTrackHeight,
      overlayShape: _buildOverlayShape(),
      overlayColor: sliderTheme?.overlayColor ??
          overlayColor ??
          _theme.sliderThumbColor.withOpacity(0.25),
      showValueIndicator: _showValueIndicator(),
      valueIndicatorColor: sliderTheme?.valueIndicatorColor ??
          valueIndicatorColor ??
          _theme.sliderValueIndicatorColor,
      valueIndicatorTextStyle: sliderTheme?.valueIndicatorTextStyle ??
          valueIndicatorTextStyle ??
          _theme.sliderValueIndicatorTextStyle,
      thumbColor:
          sliderTheme?.thumbColor ?? thumbColor ?? _theme.sliderThumbColor,
      activeTickMarkColor: sliderTheme?.activeTickMarkColor,
      inactiveTickMarkColor: sliderTheme?.inactiveTickMarkColor,
      disabledActiveTickMarkColor: sliderTheme?.disabledActiveTickMarkColor,
      disabledInactiveTickMarkColor: sliderTheme?.disabledInactiveTickMarkColor,
      disabledActiveTrackColor: sliderTheme?.disabledActiveTrackColor,
      disabledInactiveTrackColor: sliderTheme?.disabledInactiveTrackColor,
      disabledThumbColor: sliderTheme?.disabledThumbColor,
      minThumbSeparation: sliderTheme?.minThumbSeparation,
      overlappingShapeStrokeColor: sliderTheme?.overlappingShapeStrokeColor,
      thumbSelector: sliderTheme?.thumbSelector,
      rangeTrackShape: sliderTheme?.rangeTrackShape,
      rangeTickMarkShape: sliderTheme?.rangeTickMarkShape,
      rangeThumbShape: _buildThumbShape(),
      rangeValueIndicatorShape: _buildIndicatorShape(),
    );

    return SliderTheme(
      data: effectiveSliderTheme,
      child: MouseRegion(
        cursor:
            enabled ? SystemMouseCursors.click : SystemMouseCursors.forbidden,
        child: RangeSlider(
          values: values,
          min: min,
          max: max,
          divisions: divisions,
          labels: labels ??
              RangeLabels(min.round().toString(), max.round().toString()),
          onChanged: enabled ? onChanged : null,
          onChangeStart: onChangeStart,
          onChangeEnd: onChangeEnd,
          semanticFormatterCallback: semanticFormatterCallback,
        ),
      ),
    );
  }

  ShowValueIndicator _showValueIndicator() {
    return sliderTheme?.showValueIndicator ??
        ((valueIndicatorMode ?? _theme.sliderValueIndicatorMode) ==
                TltSliderIndicatorMode.never
            ? ShowValueIndicator.never
            : ShowValueIndicator.always);
  }

  RangeSliderThumbShape _buildThumbShape() {
    return sliderTheme?.rangeThumbShape ??
        RoundRangeSliderThumbShape(
          enabledThumbRadius: thumbSize ??
              _theme.sliderThumbSize ??
              (trackHeight ??
                      sliderTheme?.trackHeight ??
                      _theme.sliderTrackHeight) +
                  4,
          elevation: thumbElevation ?? _theme.sliderThumbElevation,
          pressedElevation: (thumbElevation ?? _theme.sliderThumbElevation) > 0
              ? (thumbElevation ?? _theme.sliderThumbElevation) + 2
              : 0,
        );
  }

  RangeSliderValueIndicatorShape _buildIndicatorShape() {
    return sliderTheme?.rangeValueIndicatorShape ??
        TltRangeSliderValueIndicatorShape(
          mode: valueIndicatorMode ?? _theme.sliderValueIndicatorMode,
        );
  }

  SliderComponentShape _buildOverlayShape() {
    return sliderTheme?.overlayShape ??
        RoundSliderOverlayShape(
          overlayRadius: overlayRadius ?? _theme.sliderOverlayRadius,
        );
  }
}


/// Returns black or white based on the luminance(Brightness) of the color.
// Color _decideValueIndicatorTextColor(Color c) =>
//     c.computeLuminance() > 0.4 ? TltColors.black : TltColors.white;

//Returns black or white based on the intensity of the color.
// final intensity = (c.red * 299 + c.green * 587 + c.blue * 114) / 1000;
// return intensity > 186 ? TltColors.black : TltColors.white;