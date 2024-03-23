library flutter_switch;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tlt_design/src/foundations/colors.dart';
import 'package:tlt_design/src/foundations/theme.dart';
import 'package:tlt_design/src/utils/shadows.dart';

class TltSwitch extends StatefulWidget {
  static final TltTheme _theme = TltTheme.instance;

  /// Creates a material design switch.
  ///
  /// The following arguments are required:
  ///
  /// * [value] determines whether this switch is on or off.
  /// * [onToggle] is called when the user toggles the switch on or off.
  ///

  TltSwitch({
    Key? key,
    required this.value,
    required this.onToggle,
    Color? activeTrackColor,
    Color? inactiveTrackColor,
    // Color? thumbColor,
    Color? activeThumbColor,
    Color? inactiveThumbColor,
    double? width,
    double? height,
    this.thumbSize,
    BorderRadius? borderRadius,
    // EdgeInsets? padding,
    this.showOnOff = false,
    this.activeText,
    TextStyle? activeTextStyle,
    this.inactiveText,
    TextStyle? inactiveTextStyle,
    this.activeIcon,
    this.inactiveIcon,
    Duration? duration,
    this.enabled = true,
    this.autoFocus = false,
    DragStartBehavior? dragStartBehavior,
    this.focusNode,
  })  : constructorName = 'default',
        activeTrackColor = activeTrackColor ?? _theme.toggleActiveColor,
        inactiveTrackColor = inactiveTrackColor ?? _theme.toggleInActiveColor,
        activeThumbColor = activeThumbColor ?? _theme.toggleActiveThumbColor,
        inactiveThumbColor =
            inactiveThumbColor ?? _theme.toggleInActiveThumbColor,
        width = width ?? _theme.toggleWidth,
        height = height ?? _theme.toggleHeight,
        // thumbSize = thumbSize ?? _theme.toggleThumbSize,
        borderRadius = borderRadius ?? _theme.toggleBorderRadius,
        duration = duration ?? _theme.toggleAnimationDuration,
        inactiveTextStyle = const TextStyle().copyWith(
          color:
              inactiveTextStyle?.color ?? _theme.toggleInActiveTextStyle.color,
          fontWeight: inactiveTextStyle?.fontWeight ??
              _theme.toggleInActiveTextStyle.fontWeight,
        ),
        activeTextStyle = const TextStyle().copyWith(
          color: activeTextStyle?.color ?? _theme.toggleActiveTextStyle.color,
          fontWeight: activeTextStyle?.fontWeight ??
              _theme.toggleActiveTextStyle.fontWeight,
        ),
        padding = null,
        dragStartBehavior = dragStartBehavior ?? _theme.dragStartBehavior,
        super(key: key);

  TltSwitch.custom({
    Key? key,
    required this.value,
    required this.onToggle,
    Color? activeTrackColor,
    Color? inactiveTrackColor,
    Color? activeThumbColor,
    Color? inactiveThumbColor,
    double? width,
    double? height,
    BorderRadius? borderRadius,
    this.padding,
    Duration? duration,
    this.enabled = true,
    DragStartBehavior? dragStartBehavior,
    // this.focusNode,
    // this.thumbSize,
    // this.showOnOff = false,
    // this.activeText,
    // TextStyle? activeTextStyle,
    // this.inactiveText,
    // TextStyle? inactiveTextStyle,
    // this.activeIcon,
    // this.inactiveIcon,
  })  : constructorName = 'custom',
        activeTrackColor = activeTrackColor ?? _theme.toggleActiveColor,
        inactiveTrackColor = inactiveTrackColor ?? _theme.toggleInActiveColor,
        activeThumbColor = activeThumbColor ?? _theme.toggleActiveThumbColor,
        inactiveThumbColor =
            inactiveThumbColor ?? _theme.toggleInActiveThumbColor,
        width = width ?? _theme.toggleWidth * 1.38,
        height = height ?? _theme.toggleHeight * 2.4,
        borderRadius = borderRadius ?? _theme.toggleBorderRadius,
        duration = duration ?? _theme.toggleAnimationDuration,
        inactiveTextStyle = null,
        activeTextStyle = null,
        thumbSize = null,
        showOnOff = false,
        activeText = null,
        inactiveText = null,
        activeIcon = null,
        inactiveIcon = null,
        autoFocus = false,
        dragStartBehavior = dragStartBehavior ?? _theme.dragStartBehavior,
        focusNode = null,
        super(key: key);

  final String constructorName;

  /// Determines if the switch is on or off.
  ///
  final bool value;

  /// Called when the user toggles the switch.
  ///
  final ValueChanged<bool> onToggle;

  /// Displays an on or off text.
  ///
  /// Defaults to 'false' if no value was given.
  final bool showOnOff;

  /// The text to display when the switch is on.
  /// This parameter is only necessary when [showOnOff] property is true.
  ///
  /// Defaults to 'On' if no value was given.
  ///
  final String? activeText;

  /// The text to display when the switch is off.
  /// This parameter is only necessary when [showOnOff] property is true.
  ///
  /// Defaults to 'Off' if no value was given.
  final String? inactiveText;

  /// The text style to use for the on text.
  ///
  final TextStyle? activeTextStyle;

  /// The text style to use for the off text.
  ///
  final TextStyle? inactiveTextStyle;

  /// The color to use on the switch when the switch is on.
  ///
  final Color activeTrackColor;

  /// The color to use on the switch when the switch is off.
  ///
  final Color inactiveTrackColor;

  /// The color to use on the thumb of the switch when the given value is true.
  ///
  final Color activeThumbColor;

  /// The color to use on the Thumb of the switch when the given value is false.
  ///
  final Color inactiveThumbColor;

  /// The given width of the switch.
  ///
  final double width;

  /// The given height of the switch.
  ///
  final double height;

  /// The size of the Thumb of the switch.
  ///
  final double? thumbSize;

  /// The border radius of the switch.
  ///
  final BorderRadius borderRadius;

  /// The padding of the switch.
  ///
  final EdgeInsets? padding;

  /// The icon inside the Thumb when the given value is true.
  /// activeIcon can be an Icon Widget, an Image.
  ///
  final Widget? activeIcon;

  /// The icon inside the Thumb when the given value is false.
  /// inactiveIcon can be an Icon Widget, an Image.
  ///
  final Widget? inactiveIcon;

  /// The duration in milliseconds to change the state of the switch
  ///
  /// Defaults to the value of 300 milliseconds.
  final Duration duration;

  /// Determines whether the switch is enabled.
  ///
  /// Defaults to the value of true.
  final bool enabled;

  final bool autoFocus;

  final DragStartBehavior dragStartBehavior;

  final FocusNode? focusNode;

  @override
  FlutterSwitchState createState() => FlutterSwitchState();
}

class FlutterSwitchState extends State<TltSwitch>
    with SingleTickerProviderStateMixin {
  static final TltTheme _theme = TltTheme.instance;
  late final Animation _toggleAnimation;
  late final AnimationController _animationController;
  Color activeContentColor = _theme.activeContentColor;
  Color inActiveContentColor = _theme.inActiveContentColor;
  Color disabledContentColor = _theme.disabledContentColor;
  Color disabledTrackColor = _theme.disabledToggleColor;
  Color disabledThumbColor = _theme.disabledThumbColor;

  void turnOnOff() {
    if (widget.enabled) {
      if (widget.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }

      widget.onToggle(!widget.value);
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      value: widget.value ? 1.0 : 0.0,
      duration: widget.duration,
    );
    _toggleAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(TltSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value == widget.value) return;

    if (widget.value) {
      _animationController.forward();
      _animationController.duration = widget.duration;
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    Color trackColor =
        widget.value ? widget.activeTrackColor : widget.inactiveTrackColor;
    Color thumbColor =
        widget.value ? widget.activeThumbColor : widget.inactiveThumbColor;

    // if (widget.value) {
    //   _toggleColor = widget.activeThumbColor ?? widget.thumbColor;
    //   _switchColor = widget.activeTrackColor;
    // } else {
    //   _toggleColor = widget.inactiveThumbColor ?? widget.thumbColor;
    //   _switchColor = widget.inactiveTrackColor;
    // }

    double thumbSize = (widget.constructorName == "custom")
        ? widget.height * 0.85 -
                    (widget.padding != null ? widget.padding!.horizontal : 0) <
                1
            ? widget.height * 0.85
            : widget.height * 0.85 -
                (widget.padding != null ? widget.padding!.horizontal : 0)
        : widget.thumbSize ?? widget.height * 1.5;

    double textSpace =
        widget.width - thumbSize < 0 ? 0 : widget.width - thumbSize;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SizedBox(
          width: widget.constructorName == "custom"
              ? widget.width
              : widget.width + widget.height * 2,
          child: InkWell(
            focusNode: widget.focusNode,
            autofocus: widget.autoFocus,
            mouseCursor: widget.enabled
                ? widget.constructorName == "custom"
                    ? SystemMouseCursors.basic
                    : null
                : SystemMouseCursors.forbidden,
            focusColor: TltColors.transparent,
            hoverColor: TltColors.transparent,
            splashColor: TltColors.transparent,
            highlightColor: TltColors.transparent,
            onTap: () {
              turnOnOff();
            },
            child: GestureDetector(
              dragStartBehavior: widget.dragStartBehavior,
              onVerticalDragStart: (_) {
                turnOnOff();
              },
              child: Padding(
                padding: widget.constructorName == "custom"
                    ? const EdgeInsets.all(0)
                    : EdgeInsets.symmetric(
                        vertical: widget.height * 0.8,
                        horizontal: widget.height,
                      ),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: widget.width,
                      height: widget.height,
                      // padding: EdgeInsets.all(widget.padding),
                      decoration: BoxDecoration(
                        borderRadius: widget.borderRadius,
                        color:
                            !widget.enabled ? disabledTrackColor : trackColor,
                        border: Border.all(style: BorderStyle.none),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AnimatedOpacity(
                        opacity: widget.value ? 1.0 : 0.0,
                        duration: widget.duration,
                        child: SizedBox(
                          width: textSpace,
                          // padding: EdgeInsets.symmetric(horizontal: 4.0),
                          child: (widget.showOnOff)
                              ? Text(
                                  widget.activeText ?? "On",
                                  style: widget.activeTextStyle!.copyWith(
                                    color: !widget.enabled
                                        ? disabledContentColor
                                        : widget.activeTextStyle?.color ??
                                            activeContentColor,
                                    fontSize:
                                        widget.activeTextStyle?.fontSize ??
                                            widget.height * 0.55,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              : null,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: AnimatedOpacity(
                        opacity: !widget.value ? 1.0 : 0.0,
                        duration: widget.duration,
                        child: SizedBox(
                            width: textSpace,
                            // padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: (widget.showOnOff)
                                ? Text(
                                    widget.inactiveText ?? "Off",
                                    style: widget.inactiveTextStyle!.copyWith(
                                      color: !widget.enabled
                                          ? disabledContentColor
                                          : widget.inactiveTextStyle?.color ??
                                              inActiveContentColor,
                                      fontSize:
                                          widget.inactiveTextStyle?.fontSize ??
                                              widget.height * 0.55,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                : null),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        turnOnOff();
                      },
                      child: Align(
                        // padding: EdgeInsets.symmetric(vertical: widget.padding),
                        alignment: _toggleAnimation.value,
                        child: Container(
                          width: thumbSize,
                          height: thumbSize,
                          margin: widget.padding ??
                              EdgeInsets.all(
                                widget.height > thumbSize * 1.1
                                    ? widget.constructorName == "custom"
                                        ? widget.height * 0.05
                                        : widget.height * 0.1
                                    : 0,
                              ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: widget.constructorName == "custom"
                                ? null
                                : TltShadow.md(),
                            color: !widget.enabled
                                ? disabledThumbColor
                                : thumbColor,
                            border: Border.all(style: BorderStyle.none),
                          ),
                          child: Opacity(
                            opacity: !widget.enabled ? 0.4 : 1,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: AnimatedCrossFade(
                                duration: widget.duration,
                                reverseDuration: widget.duration,
                                crossFadeState: widget.value
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                firstChild: widget.activeIcon != null
                                    ? Padding(
                                        padding:
                                            EdgeInsets.all(widget.height * 0.4),
                                        child: widget.activeIcon!,
                                      )
                                    : const SizedBox(),
                                secondChild: widget.inactiveIcon != null
                                    ? Padding(
                                        padding:
                                            EdgeInsets.all(widget.height * 0.4),
                                        child: widget.inactiveIcon!,
                                      )
                                    : const SizedBox(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
