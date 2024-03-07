import 'package:flutter/material.dart';
import 'package:tlt_design/src/foundations/colors.dart';

import 'theme.dart';

enum TltButtonType { primary, secondary, outline, link }

enum TltSize { xs, sm, md, lg, xl, xxl }

enum TltSliderIndicatorMode { tooltip, textOnly, never }

enum TltProgressIndicatorTooltipMode { onHover, always, never }

enum TltProgressIndicatorTrailPosition { centerRight, bottomRight }

enum TltVisibility { never, always, onInteraction }

enum TltArrowPosition {
  hide,
  left,
  right,
  topRight,
  topLeft,
  topCenter,
  bottomRight,
  bottomLeft,
  bottomCenter
}

enum TltArrowAlignment { center, left, right }

enum TltArcType { half }

enum CircularStrokeCap { round, square }

extension CircularStrokeCapExtension on CircularStrokeCap {
  StrokeCap get strokeCap {
    switch (this) {
      // case CircularStrokeCap.butt:
      //   return StrokeCap.butt;
      case CircularStrokeCap.round:
        return StrokeCap.round;
      case CircularStrokeCap.square:
        return StrokeCap.square;
    }
  }
}

enum TltBreadCrumbSeparator { slash, arrow }

enum TltTabDecoration { underline, button }

/// [TltPaginationSize] is used to specify the pagination size, either 'compact' or 'expanded'.
enum TltPaginationSize {
  /// 'compact' shrinks the size of the previous and next buttons
  /// and positions them at the start and end of the pagination.
  compact,

  /// 'expanded' moves the previous and next buttons to the end of the screen.
  expanded
}

/// [TltPaginationType] is used to specify the pagination type, either 'minimal' or 'card'.
enum TltPaginationType {
  /// 'minimal' represents customizable pagination where changes can be made.
  minimal,

  /// The 'cardButton' type represents a fixed card layout
  /// where editing and adding decorations are restricted.
  cardButton
}

/// [TltPageSkipType] determines whether to display ellipses or arrows.
/// If the value is 'none', it represents ellipses.
/// If the value is 'arrow', it represents arrows.
enum TltPageSkipType {
  /// The 'none' enum is used to display ellipses.
  /// It does not trigger any action.
  none,

  /// This enum represents arrows for navigating forward and backward.
  /// It's used to skip to the next 5 pages.
  arrow
}

@immutable
class TltInputDecoration extends InputDecoration {
  static final TltTheme _theme = TltTheme.instance;
  final Widget? addOnBefore;
  final Widget? addOnAfter;
  final TltAddOnDecoration? addOnBeforeDecoration;
  final TltAddOnDecoration? addOnAfterDecoration;
  final double? relativeAddOnHeight;

  TltInputDecoration({
    double? relativeAddOnHeight,
    TltAddOnDecoration? addOnAfterDecoration,
    TltAddOnDecoration? addOnBeforeDecoration,
    this.addOnBefore,
    this.addOnAfter,
    // Widget? icon,
    // Color? iconColor,
    Widget? label,
    String? labelText,
    TextStyle? labelStyle,
    // TextStyle? floatingLabelStyle,
    String? helperText,
    TextStyle? helperStyle,
    int? helperMaxLines,
    String? hintText,
    TextStyle? hintStyle,
    TextDirection? hintTextDirection,
    int? hintMaxLines,
    String? errorText,
    TextStyle? errorStyle,
    int? errorMaxLines,
    // FloatingLabelBehavior? floatingLabelBehavior,
    FloatingLabelAlignment? floatingLabelAlignment,
    // bool? isDense,
    EdgeInsetsGeometry? contentPadding,
    // bool isCollapsed = false,
    Widget? prefixIcon,
    // Color? prefixIconColor,
    BoxConstraints? prefixIconConstraints,
    // Widget? prefix,
    // String? prefixText,
    // TextStyle? prefixStyle,
    Widget? suffixIcon,
    // Color? suffixIconColor,
    BoxConstraints? suffixIconConstraints,
    // Widget? suffix,
    // String? suffixText,
    // TextStyle? suffixStyle,
    String? counterText,
    Widget? counter,
    TextStyle? counterStyle,
    bool? filled = true,
    Color? fillColor = TltColors.white,
    Color? focusColor,
    Color? hoverColor,
    InputBorder? border,
    InputBorder? enabledBorder,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
    InputBorder? focusedErrorBorder,
    InputBorder? disabledBorder,
    bool enabled = true,
    String? semanticCounterText,
    // bool? alignLabelWithHint,
    BoxConstraints? constraints,
    final Widget? error,
  })  : relativeAddOnHeight = relativeAddOnHeight ?? _theme.relativeAddOnHeight,
        addOnBeforeDecoration =
            addOnBeforeDecoration ?? _theme.defaultAddOnBeforeDecoration,
        addOnAfterDecoration =
            addOnAfterDecoration ?? _theme.defaultAddOnAfterDecoration,
        super(
          // icon: icon,
          // iconColor: iconColor,
          label: label,
          labelText: labelText,
          labelStyle: labelStyle ?? _theme.inputLabelStyle,
          // floatingLabelStyle: floatingLabelStyle,
          helperText: helperText,
          helperStyle: helperStyle ?? _theme.inputHelperStyle,
          helperMaxLines: helperMaxLines,
          hintText: hintText,
          hintStyle: hintStyle ?? _theme.inputHintStyle,
          hintTextDirection: hintTextDirection,
          hintMaxLines: hintMaxLines,
          errorText: errorText,
          errorStyle: errorStyle ?? _theme.inputErrorStyle,
          errorMaxLines: errorMaxLines,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          isDense: true,
          contentPadding: contentPadding ?? _theme.inputContentPadding,
          isCollapsed: false,
          prefixIcon: prefixIcon,
          prefixIconConstraints: prefixIconConstraints,
          // prefix: prefix,
          // prefixText: prefixText,
          // prefixStyle: prefixStyle,
          // prefixIconColor: prefixIconColor,
          suffixIcon: suffixIcon,
          // suffix: suffix,
          // suffixText: suffixText,
          // suffixStyle: suffixStyle,
          // suffixIconColor: suffixIconColor,
          suffixIconConstraints: suffixIconConstraints,
          counterText: counterText,
          counter: counter,
          counterStyle: counterStyle,
          filled: filled,
          fillColor: fillColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          border: border ?? _theme.inputBorder,
          enabledBorder: enabledBorder ?? _theme.inputEnabledBorder,
          focusedBorder: focusedBorder ?? _theme.inputFocusedBorder,
          errorBorder: errorBorder ?? _theme.inputErrorBorder,
          focusedErrorBorder:
              focusedErrorBorder ?? _theme.inputFocusedErrorBorder,
          disabledBorder: disabledBorder ?? _theme.inputDisabledBorder,
          enabled: enabled,
          semanticCounterText: semanticCounterText,
          // alignLabelWithHint: alignLabelWithHint,
          constraints: constraints,
        );

  @override
  TltInputDecoration copyWith({
    Widget? addOnBefore,
    Widget? addOnAfter,
    TltAddOnDecoration? addOnBeforeDecoration,
    TltAddOnDecoration? addOnAfterDecoration,
    double? relativeAddOnHeight,
    Widget? icon,
    Color? iconColor,
    Widget? label,
    String? labelText,
    TextStyle? labelStyle,
    TextStyle? floatingLabelStyle,
    String? helperText,
    TextStyle? helperStyle,
    int? helperMaxLines,
    String? hintText,
    TextStyle? hintStyle,
    TextDirection? hintTextDirection,
    Duration? hintFadeDuration,
    int? hintMaxLines,
    Widget? error,
    String? errorText,
    TextStyle? errorStyle,
    int? errorMaxLines,
    FloatingLabelBehavior? floatingLabelBehavior,
    FloatingLabelAlignment? floatingLabelAlignment,
    bool? isCollapsed,
    bool? isDense,
    EdgeInsetsGeometry? contentPadding,
    Widget? prefixIcon,
    Widget? prefix,
    String? prefixText,
    BoxConstraints? prefixIconConstraints,
    TextStyle? prefixStyle,
    Color? prefixIconColor,
    Widget? suffixIcon,
    Widget? suffix,
    String? suffixText,
    TextStyle? suffixStyle,
    Color? suffixIconColor,
    BoxConstraints? suffixIconConstraints,
    Widget? counter,
    String? counterText,
    TextStyle? counterStyle,
    bool? filled,
    Color? fillColor,
    Color? focusColor,
    Color? hoverColor,
    InputBorder? errorBorder,
    InputBorder? focusedBorder,
    InputBorder? focusedErrorBorder,
    InputBorder? disabledBorder,
    InputBorder? enabledBorder,
    InputBorder? border,
    bool? enabled,
    String? semanticCounterText,
    bool? alignLabelWithHint,
    BoxConstraints? constraints,
  }) {
    return TltInputDecoration(
      addOnBefore: addOnBefore ?? this.addOnBefore,
      addOnAfter: addOnAfter ?? this.addOnAfter,
      addOnBeforeDecoration:
          addOnBeforeDecoration ?? this.addOnBeforeDecoration,
      addOnAfterDecoration: addOnAfterDecoration ?? this.addOnAfterDecoration,
      relativeAddOnHeight: relativeAddOnHeight ?? this.relativeAddOnHeight,
      // icon: icon ?? this.icon,
      // iconColor: iconColor ?? this.iconColor,
      label: label ?? this.label,
      labelText: labelText ?? this.labelText,
      labelStyle: labelStyle ?? this.labelStyle,
      // floatingLabelStyle: floatingLabelStyle ?? this.floatingLabelStyle,
      helperText: helperText ?? this.helperText,
      helperStyle: helperStyle ?? this.helperStyle,
      helperMaxLines: helperMaxLines ?? this.helperMaxLines,
      hintText: hintText ?? this.hintText,
      hintStyle: hintStyle ?? this.hintStyle,
      hintTextDirection: hintTextDirection ?? this.hintTextDirection,
      hintMaxLines: hintMaxLines ?? this.hintMaxLines,
      errorText: errorText ?? this.errorText,
      errorStyle: errorStyle ?? this.errorStyle,
      errorMaxLines: errorMaxLines ?? this.errorMaxLines,
      // floatingLabelBehavior:
      //     floatingLabelBehavior ?? this.floatingLabelBehavior,
      // floatingLabelAlignment:
      //     floatingLabelAlignment ?? this.floatingLabelAlignment,
      // isCollapsed: isCollapsed ?? this.isCollapsed,
      // isDense: isDense ?? this.isDense,
      contentPadding: contentPadding ?? this.contentPadding,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      // prefix: prefix ?? this.prefix,
      // prefixText: prefixText ?? this.prefixText,
      // prefixStyle: prefixStyle ?? this.prefixStyle,
      // prefixIconColor: prefixIconColor ?? this.prefixIconColor,
      prefixIconConstraints:
          prefixIconConstraints ?? this.prefixIconConstraints,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      // suffix: suffix ?? this.suffix,
      // suffixText: suffixText ?? this.suffixText,
      // suffixStyle: suffixStyle ?? this.suffixStyle,
      // suffixIconColor: suffixIconColor ?? this.suffixIconColor,
      suffixIconConstraints:
          suffixIconConstraints ?? this.suffixIconConstraints,
      counter: counter ?? this.counter,
      counterText: counterText ?? this.counterText,
      counterStyle: counterStyle ?? this.counterStyle,
      filled: filled ?? this.filled,
      fillColor: fillColor ?? this.fillColor,
      focusColor: focusColor ?? this.focusColor,
      hoverColor: hoverColor ?? this.hoverColor,
      errorBorder: errorBorder ?? this.errorBorder,
      focusedBorder: focusedBorder ?? this.focusedBorder,
      focusedErrorBorder: focusedErrorBorder ?? this.focusedErrorBorder,
      disabledBorder: disabledBorder ?? this.disabledBorder,
      enabledBorder: enabledBorder ?? this.enabledBorder,
      border: border ?? this.border,
      enabled: enabled ?? this.enabled,
      semanticCounterText: semanticCounterText ?? this.semanticCounterText,
      // alignLabelWithHint: alignLabelWithHint ?? this.alignLabelWithHint,
      constraints: constraints ?? this.constraints,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is TltInputDecoration &&
        other.addOnAfter == addOnAfter &&
        other.addOnAfterDecoration == addOnAfterDecoration &&
        other.addOnBefore == addOnBefore &&
        other.addOnBeforeDecoration == addOnBeforeDecoration &&
        other.relativeAddOnHeight == relativeAddOnHeight &&
        // other.icon == icon &&
        // other.iconColor == iconColor &&
        other.label == label &&
        other.labelText == labelText &&
        other.labelStyle == labelStyle &&
        // other.floatingLabelStyle == floatingLabelStyle &&
        other.helperText == helperText &&
        other.helperStyle == helperStyle &&
        other.helperMaxLines == helperMaxLines &&
        other.hintText == hintText &&
        other.hintStyle == hintStyle &&
        other.hintTextDirection == hintTextDirection &&
        other.hintMaxLines == hintMaxLines &&
        other.errorText == errorText &&
        other.errorStyle == errorStyle &&
        other.errorMaxLines == errorMaxLines &&
        // other.floatingLabelBehavior == floatingLabelBehavior &&
        // other.floatingLabelAlignment == floatingLabelAlignment &&
        // other.isDense == isDense &&
        other.contentPadding == contentPadding &&
        // other.isCollapsed == isCollapsed &&
        other.prefixIcon == prefixIcon &&
        other.prefixIconColor == prefixIconColor &&
        // other.prefix == prefix &&
        // other.prefixText == prefixText &&
        // other.prefixStyle == prefixStyle &&
        other.prefixIconConstraints == prefixIconConstraints &&
        other.suffixIcon == suffixIcon &&
        other.suffixIconColor == suffixIconColor &&
        // other.suffix == suffix &&
        // other.suffixText == suffixText &&
        // other.suffixStyle == suffixStyle &&
        other.suffixIconConstraints == suffixIconConstraints &&
        other.counter == counter &&
        other.counterText == counterText &&
        other.counterStyle == counterStyle &&
        other.filled == filled &&
        other.fillColor == fillColor &&
        other.focusColor == focusColor &&
        other.hoverColor == hoverColor &&
        other.errorBorder == errorBorder &&
        other.focusedBorder == focusedBorder &&
        other.focusedErrorBorder == focusedErrorBorder &&
        other.disabledBorder == disabledBorder &&
        other.enabledBorder == enabledBorder &&
        other.border == border &&
        other.enabled == enabled &&
        other.semanticCounterText == semanticCounterText &&
        // other.alignLabelWithHint == alignLabelWithHint &&
        other.constraints == constraints;
  }

  @override
  int get hashCode {
    final List<Object?> values = <Object?>[
      // icon,
      // iconColor,
      label,
      labelText,
      // floatingLabelStyle,
      labelStyle,
      helperText,
      helperStyle,
      helperMaxLines,
      hintText,
      hintStyle,
      hintTextDirection,
      hintMaxLines,
      errorText,
      errorStyle,
      errorMaxLines,
      // floatingLabelBehavior,
      // floatingLabelAlignment,
      // isDense,
      contentPadding,
      // isCollapsed,
      filled,
      fillColor,
      focusColor,
      hoverColor,
      border,
      enabled,
      prefixIcon,
      prefixIconColor,
      // prefix,
      // prefixText,
      // prefixStyle,
      prefixIconConstraints,
      suffixIcon,
      suffixIconColor,
      // suffix,
      // suffixText,
      // suffixStyle,
      suffixIconConstraints,
      counter,
      counterText,
      counterStyle,
      errorBorder,
      focusedBorder,
      focusedErrorBorder,
      disabledBorder,
      enabledBorder,
      border,
      enabled,
      semanticCounterText,
      // alignLabelWithHint,
      constraints,
    ];
    return Object.hashAll(values);
  }

  @override
  String toString() {
    final List<String> description = <String>[
      // if (icon != null) 'icon: $icon',
      // if (iconColor != null) 'iconColor: $iconColor',
      if (label != null) 'label: $label',
      if (labelText != null) 'labelText: "$labelText"',
      // if (floatingLabelStyle != null)
      //   'floatingLabelStyle: "$floatingLabelStyle"',
      if (helperText != null) 'helperText: "$helperText"',
      if (helperMaxLines != null) 'helperMaxLines: "$helperMaxLines"',
      if (hintText != null) 'hintText: "$hintText"',
      if (hintMaxLines != null) 'hintMaxLines: "$hintMaxLines"',
      if (errorText != null) 'errorText: "$errorText"',
      if (errorStyle != null) 'errorStyle: "$errorStyle"',
      if (errorMaxLines != null) 'errorMaxLines: "$errorMaxLines"',
      // if (floatingLabelBehavior != null)
      //   'floatingLabelBehavior: $floatingLabelBehavior',
      // if (floatingLabelAlignment != null)
      //   'floatingLabelAlignment: $floatingLabelAlignment',
      // if (isDense ?? false) 'isDense: $isDense',
      if (contentPadding != null) 'contentPadding: $contentPadding',
      // if (isCollapsed) 'isCollapsed: $isCollapsed',
      if (prefixIcon != null) 'prefixIcon: $prefixIcon',
      if (prefixIconColor != null) 'prefixIconColor: $prefixIconColor',
      // if (prefix != null) 'prefix: $prefix',
      // if (prefixText != null) 'prefixText: $prefixText',
      // if (prefixStyle != null) 'prefixStyle: $prefixStyle',
      if (prefixIconConstraints != null)
        'prefixIconConstraints: $prefixIconConstraints',
      if (suffixIcon != null) 'suffixIcon: $suffixIcon',
      if (suffixIconColor != null) 'suffixIconColor: $suffixIconColor',
      // if (suffix != null) 'suffix: $suffix',
      // if (suffixText != null) 'suffixText: $suffixText',
      // if (suffixStyle != null) 'suffixStyle: $suffixStyle',
      if (suffixIconConstraints != null)
        'suffixIconConstraints: $suffixIconConstraints',
      if (counter != null) 'counter: $counter',
      if (counterText != null) 'counterText: $counterText',
      if (counterStyle != null) 'counterStyle: $counterStyle',
      if (filled == true)
        'filled: true', // filled == null same as filled == false
      if (fillColor != null) 'fillColor: $fillColor',
      if (focusColor != null) 'focusColor: $focusColor',
      if (hoverColor != null) 'hoverColor: $hoverColor',
      if (errorBorder != null) 'errorBorder: $errorBorder',
      if (focusedBorder != null) 'focusedBorder: $focusedBorder',
      if (focusedErrorBorder != null) 'focusedErrorBorder: $focusedErrorBorder',
      if (disabledBorder != null) 'disabledBorder: $disabledBorder',
      if (enabledBorder != null) 'enabledBorder: $enabledBorder',
      if (border != null) 'border: $border',
      if (!enabled) 'enabled: false',
      if (semanticCounterText != null)
        'semanticCounterText: $semanticCounterText',
      // if (alignLabelWithHint != null) 'alignLabelWithHint: $alignLabelWithHint',
      if (constraints != null) 'constraints: $constraints',
    ];
    return 'TltInputDecoration(${description.join(', ')})';
  }
}

class TltAddOnDecoration {
  final Color? fillColor;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;
  const TltAddOnDecoration({
    this.fillColor,
    this.borderRadius,
    this.border,
    this.padding,
  });
}

class TltColorDecoration {
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final Color? hoverColor;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? overlayColor;
  final Color? borderColor;
  final Color? shadowColor;

  TltColorDecoration({
    this.iconColor,
    this.shadowColor,
    this.backgroundColor,
    this.splashColor,
    this.highlightColor,
    this.overlayColor,
    this.hoverColor,
    this.borderColor,
    this.textColor,
  });
}
