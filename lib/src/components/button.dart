import 'package:flutter/material.dart';
import 'package:tlt_design/src/components/space.dart';
import 'package:tlt_design/src/foundations/colors.dart';
import 'package:tlt_design/src/foundations/theme.dart';
import 'package:tlt_design/src/utils/properties.dart';

/// [TltButton]
///
/// It can be used in many ways. Like icon button, link button, etc.
///
/// To use as icon button, use [TltButton.custom] and assign icon to the [child].
///
/// To utilize the loading indicator and disable feature dynamically
/// use stateful widget or any other state management. Because [TltButton] itself is
/// not maintains any state.
class TltButton extends StatefulWidget {
  static final TltTheme _theme = TltTheme.instance;

  /// The text which will display in the button.
  final String text;

  /// A void callback that will be called when the button is tapped.
  final VoidCallback onTap;

  /// A void callback that will be called when the button is long pressed.
  final VoidCallback? onDoubleTap;

  /// A void callback that will be called when the button is long pressed.
  final VoidCallback? onLongPress;

  /// Width of the button. If null, width will fit to the content.
  /// [buttonWidth] should not be 0.
  final double? buttonWidth;

  /// Height of the button. If null, width will fit to the content.
  /// [buttonHeight] should not be 0.
  final double? buttonHeight;

  /// [TltButton] will disabled if [enabled] is false. Default is true.
  final bool enabled;

  /// Circular loader will be displayed if [busy] is true.
  ///
  /// If [enabled] is false and [busy] is true, then circular loader will be
  /// rendered in disabled state.
  final bool busy;

  final Widget? prefix;

  final Widget? suffix;

  /// [TltButtonType] is used to set the button type.
  ///   * [TltButtonType.primary] - Default button type.
  ///   * [TltButtonType.secondary] - Secondary button type.
  ///   * [TltButtonType.outline] - Will creates a outlined button.
  ///   * [TltButtonType.link] - Will creates a link button. Useful for web.
  ///   * For Icon button use [TltButton.custom].
  final TltButtonType buttonType;

  /// Predefined button size. Default is [TltSize.md].
  ///
  /// Available sizes:
  ///   * [TltSize.xs]
  ///   * [TltSize.sm]
  ///   * [TltSize.md]
  ///   * [TltSize.lg]
  ///   * [TltSize.xl]
  ///   * [TltSize.xxl]
  final TltSize buttonSize;

  /// [margin] will add whiteSpaces around the button.
  final EdgeInsetsGeometry margin;

  /// Corner radius of the button.
  final BorderRadius borderRadius;

  /// Style for [text] inside the button.
  final TextStyle? textStyle;

  /// Padding between text and button inside the button.
  final EdgeInsetsGeometry? padding;

  /// [child] will used for [TltButton.custom] button. Using for Icon button
  /// is the common use case.
  final Widget child;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// Specific each color of the button individually. Some of the parameter's value
  /// will not affect the widget because that option might not be available in this widget
  /// TltColorDecoration is common decorator for Tlt widgets.
  /// Applicable options:
  ///   * [backgroundColor]
  ///   * [textColor]
  ///   * [hoverColor]
  ///   * [splashColor]
  ///   * [highlightColor]
  ///   * [borderColor]
  final TltColorDecoration? colors;

  /// Used to handle the button types. [constructorName] is only for internal usage.
  final String constructorName;

  /// [TltButton]
  ///
  /// It can be used in many ways. Like icon button, link button, etc.
  ///
  /// To use as icon button, use [TltButton.custom] and assign icon to the [child].
  ///
  /// To utilize the loading indicator and disable feature dynamically
  /// use stateful widget or any other state management. Because [TltButton] itself is
  /// not maintains any state.
  TltButton({
    Key? key,
    required this.text,
    required this.onTap,
    TltButtonType? buttonType,
    TltSize? buttonSize,
    EdgeInsetsGeometry? margin,
    BorderRadius? borderRadius,
    double? buttonHeight,
    EdgeInsets? padding,
    this.enabled = true,
    this.busy = false,
    this.textStyle,
    this.prefix,
    this.suffix,
    this.buttonWidth,
    this.onDoubleTap,
    this.onLongPress,
    this.autofocus = false,
    this.focusNode,
    this.colors,
  })  : assert(!(buttonWidth != null && buttonWidth <= 0),
            "'buttonWidth' should be greater than 'zero'"),
        assert(!(buttonHeight != null && buttonHeight <= 0),
            "'buttonHeight' should be greater than 'zero'"),
        buttonType = buttonType ?? _theme.buttonType,
        buttonSize = buttonSize ?? _theme.buttonSize,
        buttonHeight = buttonHeight ?? _theme.buttonHeight,
        padding = padding ?? _theme.buttonPadding,
        margin = margin ?? _theme.buttonMargin,
        borderRadius = borderRadius ?? _theme.buttonBorderRadius,
        child = const SizedBox(),
        constructorName = 'default',
        super(key: key);

  /// [TltButton.custom]
  ///
  /// It can be used in many ways. Like icon button, link button, etc.
  ///
  /// To use as icon button, use [TltButton.custom] and assign icon to the [child].
  ///
  /// To utilize the loading indicator and disable feature dynamically
  /// use stateful widget or any other state management. Because [TltButton] itself is
  /// not maintains any state.
  TltButton.custom({
    Key? key,
    required this.child,
    required this.onTap,
    TltButtonType? buttonType,
    EdgeInsetsGeometry? margin,
    BorderRadius? borderRadius,
    double? buttonHeight,
    EdgeInsets? padding,
    this.enabled = true,
    this.busy = false,
    this.prefix,
    this.suffix,
    this.buttonWidth,
    this.onDoubleTap,
    this.onLongPress,
    this.autofocus = false,
    this.focusNode,
    this.colors,
  })  : assert(!(buttonWidth != null && buttonWidth <= 0),
            "'buttonWidth' should be greater than 'zero'"),
        assert(!(buttonHeight != null && buttonHeight <= 0),
            "'buttonHeight' should be greater than 'zero'"),
        buttonType = buttonType ?? _theme.buttonType,
        buttonSize = _theme.buttonSize,
        buttonHeight = buttonHeight ?? _theme.buttonHeight,
        padding = padding ?? _theme.buttonPadding,
        margin = margin ?? _theme.buttonMargin,
        borderRadius = borderRadius ?? _theme.buttonBorderRadius,
        text = '',
        textStyle = null,
        constructorName = 'custom',
        super(key: key);

  @override
  State<TltButton> createState() => _TltButtonState();
}

class _TltButtonState extends State<TltButton> {
  final Map<TltSize, Map<String, dynamic>> sizes = {
    TltSize.xxl: {
      "textStyle": TltButton._theme.labelXL,
      "padding": [28.0, 16.0],
      "loaderSize": 20.0,
      "loaderStroke": 2.0,
    },
    TltSize.xl: {
      "textStyle": TltButton._theme.labelL,
      "padding": [28.0, 12.0],
      "loaderSize": 17.0,
      "loaderStroke": 2.0,
    },
    TltSize.lg: {
      "textStyle": TltButton._theme.labelL,
      "padding": [18.0, 10.0],
      "loaderSize": 17.0,
      "loaderStroke": 2.0,
    },
    TltSize.md: {
      "textStyle": TltButton._theme.labelM,
      "padding": [16.0, 9.0],
      "loaderSize": 15.0,
      "loaderStroke": 2.0,
    },
    TltSize.sm: {
      "textStyle": TltButton._theme.labelM,
      "padding": [14.0, 7.0],
      "loaderSize": 15.0,
      "loaderStroke": 2.0,
    },
    TltSize.xs: {
      "textStyle": TltButton._theme.labelM,
      "padding": [8.0, 1.0],
      "loaderSize": 13.0,
      "loaderStroke": 1.5,
    },
  };

  final Map<TltButtonType, Map<String, Color>> types = {
    TltButtonType.primary: <String, Color>{
      "buttonColor": TltButton._theme.primaryColor,
      "hoverColor": TltButton._theme.primaryButtonHoverColor,
      "splashColor": TltButton._theme.primaryButtonSplashColor,
      "highlightColor": TltButton._theme.primaryButtonHighlightColor,
      "borderColor": TltButton._theme.primaryButtonBorderColor,
      "textColor": TltButton._theme.primaryButtonTextColor,
    },
    TltButtonType.secondary: <String, Color>{
      "buttonColor": TltButton._theme.secondaryColor,
      "hoverColor": TltButton._theme.secondaryButtonHoverColor,
      "splashColor": TltButton._theme.secondaryButtonSplashColor,
      "highlightColor": TltButton._theme.secondaryButtonHighlightColor,
      "borderColor": TltButton._theme.secondaryButtonBorderColor,
      "textColor": TltButton._theme.secondaryButtonTextColor,
    },
    TltButtonType.outline: <String, Color>{
      "buttonColor": TltButton._theme.outlineButtonColor,
      "hoverColor": TltButton._theme.outlineButtonHoverColor,
      "splashColor": TltButton._theme.outlineButtonSplashColor,
      "highlightColor": TltButton._theme.outlineButtonHighlightColor,
      "borderColor": TltButton._theme.outlineButtonBorderColor,
      "textColor": TltButton._theme.outlineButtonTextColor,
    },
    TltButtonType.link: <String, Color>{
      "buttonColor": TltColors.transparent,
      "hoverColor": TltColors.transparent,
      "splashColor": TltColors.transparent,
      "highlightColor": TltColors.transparent,
      "borderColor": TltColors.transparent,
      "textColor": TltColors.blue[700],
    },
  };

  bool get isInteractive => widget.enabled && !widget.busy;

  bool get isLinkButton => widget.buttonType == TltButtonType.link;

  double _focusedOverlayRadius = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: Opacity(
        opacity: widget.enabled ? 1.0 : 0.5,
        child: SizedBox(
          height: widget.buttonHeight,
          width: widget.buttonWidth,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: widget.borderRadius,
              border: Border.all(
                color: widget.colors?.borderColor ??
                    types[widget.buttonType]!["borderColor"]!,
                width: 0.9,
              ),
              boxShadow: widget.autofocus == false && widget.focusNode == null
                  ? []
                  : [
                      BoxShadow(
                        color: widget.colors?.backgroundColor ??
                            types[widget.buttonType]!["buttonColor"]!
                                .withOpacity(0.2),
                        spreadRadius: _focusedOverlayRadius,
                      ),
                    ],
            ),
            child: Material(
              borderRadius: widget.borderRadius,
              color: widget.colors?.backgroundColor ??
                  types[widget.buttonType]!['buttonColor'],
              child: InkWell(
                focusColor: widget.colors?.backgroundColor ??
                    types[widget.buttonType]!['buttonColor'],
                autofocus: widget.autofocus,
                focusNode: widget.focusNode,
                canRequestFocus: isInteractive,
                onFocusChange: (focus) {
                  if (focus) {
                    setState(() => _focusedOverlayRadius = 4);
                  } else {
                    setState(() => _focusedOverlayRadius = 0);
                  }
                },
                mouseCursor:
                    isInteractive ? null : SystemMouseCursors.forbidden,
                borderRadius: widget.borderRadius,
                splashColor: widget.colors?.splashColor ??
                    types[widget.buttonType]!['splashColor'],
                hoverColor: widget.colors?.hoverColor ??
                    types[widget.buttonType]!['hoverColor'],
                highlightColor: isLinkButton
                    ? TltColors.transparent
                    : widget.colors?.highlightColor,
                onTap: isInteractive ? widget.onTap : null,
                onDoubleTap: isInteractive ? widget.onDoubleTap : null,
                onLongPress: isInteractive ? widget.onLongPress : null,
                child: Padding(
                  padding: isLinkButton
                      ? const EdgeInsets.all(0)
                      : widget.padding ??
                          EdgeInsets.symmetric(
                            vertical: sizes[widget.buttonSize]!['padding'][1],
                            horizontal: sizes[widget.buttonSize]!['padding'][0],
                          ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (widget.prefix != null)
                        if (!widget.busy) widget.prefix!,
                      if (widget.prefix != null)
                        if (!widget.busy) const TltXSpace(8),
                      if (widget.busy)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: SizedBox(
                            height: sizes[widget.buttonSize]!['loaderSize'],
                            width: sizes[widget.buttonSize]!['loaderSize'],
                            child: CircularProgressIndicator(
                              strokeWidth:
                                  sizes[widget.buttonSize]!["loaderStroke"],
                              valueColor: AlwaysStoppedAnimation(
                                widget.colors?.textColor ??
                                    types[widget.buttonType]!["textColor"],
                              ),
                            ),
                          ),
                        )
                      else if (widget.constructorName == 'default')
                        Text(
                          widget.text,
                          style: widget.textStyle ??
                              sizes[widget.buttonSize]!['textStyle'].copyWith(
                                color: widget.colors?.textColor ??
                                    types[widget.buttonType]!["textColor"],
                              ),
                        )
                      else if (widget.constructorName == 'custom')
                        widget.child,
                      if (widget.suffix != null)
                        if (!widget.busy) const TltXSpace(8),
                      if (widget.suffix != null)
                        if (!widget.busy) widget.suffix!,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
