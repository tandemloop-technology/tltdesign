import 'package:flutter/material.dart';
import 'package:tlt_design/src/components/space.dart';
import 'package:tlt_design/src/foundations/colors.dart';
import 'package:tlt_design/src/foundations/theme.dart';
import 'package:tlt_design/src/utils/properties.dart';
import 'package:tlt_design/src/utils/shadows.dart';
import 'dart:math' as math;

class TltLinearProgressIndicator extends StatefulWidget {
  static final TltTheme _theme = TltTheme.instance;

  TltLinearProgressIndicator({
    Key? key,
    // Color? backgroundColor,
    double? value,
    double? height,
    this.width,
    Color? inActiveColor,
    Color? activeColor,
    this.animation = true,
    int? animationDuration,
    this.isRTL = false,
    this.trailing,
    TextStyle? trailTextStyle,
    // Color? trailTextColor,
    // this.trailFontSize,
    double? trailingLeftSpacing,
    TltProgressIndicatorTrailPosition? trailingPosition,
    this.addAutomaticKeepAlive = true,
    this.borderRadius,
    EdgeInsets? padding,
    Curve? animationCurve,
    this.tooltip,
    TextStyle? tooltipTextStyle,
    // Color? tooltipTextColor,
    // this.tooltipFontSize,
    // this.isBusy = false,
    TltVisibility? tooltipMode,
    this.showTooltipAbove = true,
  })  :
        //  backgroundColor =
        //           backgroundColor ?? _theme.progressIndicatorBackgroundColor,
        inActiveColor = inActiveColor ?? _theme.progressIndicatorFillColor,
        activeColor = activeColor ?? _theme.progressIndicatorActiveColor,
        height = height ?? _theme.progressIndicatorLineHeight,
        value = value != null ? value * 0.01 : _theme.progressIndicatorValue,
        animationDuration =
            animationDuration ?? _theme.progressIndicatorAnimationDuration,
        trailingLeftSpacing =
            trailingLeftSpacing ?? _theme.progressIndicatorTrailingLeftSpacing,
        trailingPosition =
            trailingPosition ?? _theme.progressIndicatorTrailPosition,
        animationCurve =
            animationCurve ?? _theme.progressIndicatorAnimationCurve,
        padding = padding ?? _theme.progressIndicatorPadding,
        tooltipMode = tooltipMode ?? _theme.progressIndicatorTooltipMode,
        trailTextStyle = TextStyle(
            fontSize: trailTextStyle?.fontSize ??
                (height != null
                    ? height * 1.75
                    : _theme.progressIndicatorLineHeight * 1.75),
            color:
                trailTextStyle?.color ?? _theme.progressIndicatorTrailTextColor,
            fontWeight: FontWeight.w600),
        tooltipTextStyle = TextStyle(
            fontSize: tooltipTextStyle?.fontSize ??
                (height != null
                    ? height * 1.6
                    : _theme.progressIndicatorLineHeight * 1.6),
            color: tooltipTextStyle?.color ??
                _theme.progressIndicatorTooltipTextColor,
            fontWeight: FontWeight.w600),
        // tooltipTextColor =
        //     tooltipTextColor ?? _theme.progressIndicatorTooltipTextColor,
        // trailTextColor =
        //     trailTextColor ?? _theme.progressIndicatorTrailTextColor,
        super(key: key) {
    assert(!(value != null && (value < 0.0 || value > 100.0)),
        ("value must be a double between 0.0 and 100.0, but it's $value"));
    assert(!(width != null && (width! < 0.0 || width! == 0.0)),
        ("width must be a double value greater than 0"));
    // assert(!(animation == false && isBusy == true),
    //     ("set animation to true if you want to have trailing effect"));
  }

  ///value between 0.0 and 100.0
  ///
  final double value;

  final double? width;

  final double height;

  ///Color of the background of the [TltLinearProgressIndicator]
  ///
  final Color inActiveColor;

  final Color activeColor;

  ///true if you want the Line to have animation
  ///
  final bool animation;

  ///duration of the animation in milliseconds, It only applies if animation attribute is true
  ///
  final int animationDuration;

  ///widget at the right of the [TltLinearProgressIndicator]
  final Widget? trailing;

  final TextStyle? trailTextStyle;
  // final Color? trailTextColor;
  // final double? trailFontSize;

  final double trailingLeftSpacing;

  final TltProgressIndicatorTrailPosition trailingPosition;

  /// The border radius of the [TltLinearProgressIndicator]
  ///
  final double? borderRadius;

  ///padding to the [TltLinearProgressIndicator], without trailing can be used to apply border to the [TltLinearProgressIndicator]
  ///
  final EdgeInsets padding;

  /// set false if you don't want to preserve the state of the widget
  ///
  final bool addAutomaticKeepAlive;

  /// set true if you want to animate the linear from the right to left (RTL)
  ///
  final bool isRTL;

  /// set a linear curve animation type, has no effect in busy mode
  ///
  final Curve animationCurve;

  /// Display a widget indicator at the end of the progress. It only works when animation is true
  ///
  final Widget? tooltip;

  final TextStyle? tooltipTextStyle;
  // final Color? tooltipTextColor;
  // final double? tooltipFontSize;

  /// set to true to have a trail effect, [animation] must be set to true to have the effect
  // bool isBusy = true;

  /// set tooltip mode, only works when [tooltip] is not null
  ///
  final TltVisibility tooltipMode;

  /// set the position of the tooltip,if set to false tooltip is displayed below, only works when [tooltip] is not null
  ///
  final bool showTooltipAbove;

  @override
  TltProgressIndicatorState createState() => TltProgressIndicatorState();
}

class TltProgressIndicatorState extends State<TltLinearProgressIndicator>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController? _animationController;
  Animation? _animation;
  double _value = 0.0;
  final _containerKey = GlobalKey();
  final _keyIndicator = GlobalKey();
  double _containerWidth = 0.0;
  double _containerHeight = 0.0;
  double _indicatorWidth = 0.0;
  // double _indicatorHeight = 0.0;
  bool _showTooltip = false;
  bool isBusy = true;

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    isBusy = widget.value == 0.00001;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _containerWidth = _containerKey.currentContext?.size?.width ?? 0.0;
          _containerHeight = _containerKey.currentContext?.size?.height ?? 0.0;
          if (_keyIndicator.currentContext != null) {
            _indicatorWidth = _keyIndicator.currentContext?.size?.width ?? 0.0;
            // _indicatorHeight =
            //     _keyIndicator.currentContext?.size?.height ?? 0.0;
          }
        });
      }
    });
    if (widget.animation) {
      _animationController = AnimationController(
          vsync: this,
          duration: Duration(milliseconds: widget.animationDuration));
      _animation = Tween(begin: 0.0, end: isBusy ? 1.0 : widget.value).animate(
        CurvedAnimation(
            parent: _animationController!, curve: widget.animationCurve),
      )..addListener(() {
          setState(() {
            _value = _animation!.value;
          });
          if (isBusy) {
            _animationController!.repeat();
          }
        });
      _animationController!.forward();
    } else {
      _updateProgress();
    }
    _showTooltip = (widget.tooltipMode == TltVisibility.always ||
            widget.tooltipMode == TltVisibility.onInteraction)
        ? true
        : false;
    super.initState();
  }

  void _checkIfNeedCancelAnimation(TltLinearProgressIndicator oldWidget) {
    if (oldWidget.animation &&
        !widget.animation &&
        _animationController != null) {
      _animationController!.stop();
    }
  }

  @override
  void didUpdateWidget(TltLinearProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      if (_animationController != null) {
        _animationController!.duration =
            Duration(milliseconds: widget.animationDuration);
        _animation = Tween(begin: oldWidget.value, end: widget.value).animate(
          CurvedAnimation(
              parent: _animationController!, curve: widget.animationCurve),
        );
        _animationController!.forward(from: 0.0);
      } else {
        _updateProgress();
      }
    }
    _checkIfNeedCancelAnimation(oldWidget);
  }

  _updateProgress() {
    setState(() {
      _value = widget.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<Widget> items = List<Widget>.empty(growable: true);
    final hasSetWidth = widget.width != null;
    final valuePositionedHorizontal =
        _containerWidth * _value - _indicatorWidth / 3;
    Text valueText = Text(
      "${(widget.value * 100).round()}%",
      style: widget.tooltipTextStyle,
    );
    Text trailText = Text(
      "${(widget.value * 100).round()}%",
      style: widget.trailTextStyle,
    );
    Widget containerWidget = SizedBox(
      width: hasSetWidth ? widget.width : double.infinity,
      height: widget.height,
      // padding: widget.padding,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            key: _containerKey,
            painter: isBusy
                ? _TltLinearProgressIndicatorBusy(
                    backgroundColor: widget.inActiveColor,
                    valueColor: widget.activeColor,
                    animationValue: _animationController!.value,
                    textDirection:
                        widget.isRTL ? TextDirection.rtl : TextDirection.ltr,
                    barRadius: Radius.circular(
                        widget.borderRadius ?? widget.height / 2),
                  )
                : _LinearPainter(
                    isRTL: widget.isRTL,
                    progress: _value,
                    activeColor: widget.activeColor,
                    inActiveColor: widget.inActiveColor,
                    barRadius: Radius.circular(
                        widget.borderRadius ?? widget.height / 2),
                    clipLinearGradient: false,
                  ),
            child: Container(),
          ),
          if (_indicatorWidth == 0 && _showTooltip && !isBusy)
            Opacity(
              opacity: 0.0,
              key: _keyIndicator,
              child: widget.tooltip ?? valueText,
            ),
          if (_containerWidth > 0 &&
              _indicatorWidth > 0 &&
              _showTooltip &&
              !isBusy)
            Positioned(
              right: widget.isRTL ? valuePositionedHorizontal - 20 : null,
              left: !widget.isRTL ? valuePositionedHorizontal - 20 : null,
              bottom: widget.showTooltipAbove ? _containerHeight : null,
              top: widget.showTooltipAbove ? null : _containerHeight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!widget.showTooltipAbove)
                    const SizedBox(
                      height: 7,
                    ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                    ),
                    decoration: ShapeDecoration(
                        shadows: TltShadow.sm(color: TltColors.gray),
                        shape: CustomTooltipContainer(
                            isAbove: widget.showTooltipAbove),
                        color: TltColors.gray[25]),
                    child: widget.tooltip ?? valueText,
                  ),
                  if (widget.showTooltipAbove)
                    const SizedBox(
                      height: 8,
                    ),
                ],
              ),
            ),
        ],
      ),
    );

    if (hasSetWidth) {
      items.add(containerWidget);
    } else {
      items.add(Expanded(
        child: containerWidget,
      ));
    }

    if (widget.trailingPosition ==
            TltProgressIndicatorTrailPosition.centerRight &&
        !isBusy) {
      items.addAll(
        [
          SizedBox(
            width: widget.trailingLeftSpacing,
          ),
          widget.trailing ?? trailText
        ],
      );
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        focusColor: TltColors.transparent,
        hoverColor: TltColors.transparent,
        splashColor: TltColors.transparent,
        highlightColor: TltColors.transparent,
        onHover: widget.tooltipMode == TltVisibility.onInteraction
            ? (val) {
                setState(() {
                  _showTooltip = val;
                });
              }
            : null,
        onTap: widget.tooltipMode == TltVisibility.never ? null : () {},
        child: Container(
          padding: widget.padding,
          decoration: BoxDecoration(
              // color: widget.backgroundColor,
              borderRadius:
                  BorderRadius.circular(widget.borderRadius ?? widget.height)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: items,
              ),
              if (widget.trailingPosition ==
                      TltProgressIndicatorTrailPosition.bottomRight &&
                  !isBusy) ...[
                const SizedBox(
                  height: 8,
                ),
                widget.trailing ?? trailText
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => widget.addAutomaticKeepAlive;
}

class _LinearPainter extends CustomPainter {
  final Paint _paintBackground = Paint();
  final Paint _paintLine = Paint();
  final double progress;
  final bool isRTL;
  final Color activeColor;
  final Color inActiveColor;
  final Radius barRadius;
  final LinearGradient? linearGradient;
  final LinearGradient? linearGradientBackgroundColor;
  final MaskFilter? maskFilter;
  final bool clipLinearGradient;

  _LinearPainter({
    // this.linearGradient,
    // this.linearGradientBackgroundColor,
    // this.maskFilter,
    required this.progress,
    required this.isRTL,
    required this.activeColor,
    required this.inActiveColor,
    required this.barRadius,
    required this.clipLinearGradient,
  })  : linearGradient = null,
        linearGradientBackgroundColor = null,
        maskFilter = null {
    _paintBackground.color = inActiveColor;

    _paintLine.color = progress.toString() == "0.0"
        ? activeColor.withOpacity(0.0)
        : activeColor;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path backgroundPath = Path();
    backgroundPath.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        barRadius,
      ),
    );
    canvas.drawPath(backgroundPath, _paintBackground);

    if (maskFilter != null) {
      _paintLine.maskFilter = maskFilter;
    }

    if (linearGradientBackgroundColor != null) {
      Offset shaderEndPoint =
          clipLinearGradient ? Offset.zero : Offset(size.width, size.height);
      _paintBackground.shader = linearGradientBackgroundColor
          ?.createShader(Rect.fromPoints(Offset.zero, shaderEndPoint));
    }

    final xProgress = size.width * progress;
    Path linePath = Path();
    if (isRTL) {
      if (linearGradient != null) {
        _paintLine.shader = _createGradientShaderRightToLeft(size, xProgress);
      }
      linePath.addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(
              size.width - size.width * progress, 0, xProgress, size.height),
          barRadius));
    } else {
      if (linearGradient != null) {
        _paintLine.shader = _createGradientShaderLeftToRight(size, xProgress);
      }
      linePath.addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, xProgress, size.height), barRadius));
    }
    canvas.drawPath(linePath, _paintLine);
  }

  Shader _createGradientShaderRightToLeft(Size size, double xProgress) {
    Offset shaderEndPoint =
        clipLinearGradient ? Offset.zero : Offset(xProgress, size.height);
    return linearGradient!.createShader(
      Rect.fromPoints(
        Offset(size.width, size.height),
        shaderEndPoint,
      ),
    );
  }

  Shader _createGradientShaderLeftToRight(Size size, double xProgress) {
    Offset shaderEndPoint = clipLinearGradient
        ? Offset(size.width, size.height)
        : Offset(xProgress, size.height);
    return linearGradient!.createShader(
      Rect.fromPoints(
        Offset.zero,
        shaderEndPoint,
      ),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _TltLinearProgressIndicatorBusy extends CustomPainter {
  const _TltLinearProgressIndicatorBusy({
    required this.backgroundColor,
    required this.valueColor,
    // this.value,
    required this.animationValue,
    required this.textDirection,
    required this.barRadius,
  });

  final Color backgroundColor;
  final Color valueColor;
  // final double? value;
  final double animationValue;
  final TextDirection textDirection;
  final Radius barRadius;

  static const Curve line1Head =
      Interval(0.0, 0.6, curve: Cubic(0.2, 0.0, 0.8, 1.0));
  static const Curve line1Tail =
      Interval(0.3, 0.8, curve: Cubic(0.4, 0.0, 1.0, 1.0));
  static const Curve line2Head =
      Interval(0.3, 0.8, curve: Cubic(0.0, 0.0, 0.65, 1.0));
  static const Curve line2Tail =
      Interval(0.0, 0.6, curve: Cubic(0.10, 0.0, 0.45, 1.0));

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    // canvas.drawRect(Offset.zero & size, paint);
    Path backgroundPath = Path();
    Path valuePath = Path();
    backgroundPath.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height), barRadius));
    canvas.drawPath(backgroundPath, paint);

    paint.color = valueColor;

    void drawBar(double x, double width) {
      if (width <= 0.0) return;

      final double left;
      switch (textDirection) {
        case TextDirection.rtl:
          left = size.width - width - x;
          break;
        case TextDirection.ltr:
          left = x;
          break;
      }
      valuePath.addRRect(RRect.fromRectAndRadius(
          Rect.fromLTWH(left, 0, width, size.height), barRadius));
      // canvas.drawRect(Offset(left, 0.0) & Size(width, size.height), paint);
      canvas.drawPath(valuePath, paint);
    }

    // if (value != null) {
    //   drawBar(0.0, value!.clamp(0.0, 1.0) * size.width);
    // } else {
    final double x1 = size.width * line1Tail.transform(animationValue);
    final double width1 = size.width * line1Head.transform(animationValue) - x1;

    final double x2 = size.width *
        line2Tail.transform(
          animationValue,
        );
    final double width2 = size.width * line2Head.transform(animationValue) - x2;

    drawBar(x1, width1);
    drawBar(x2, width2);
    // }
  }

  @override
  bool shouldRepaint(_TltLinearProgressIndicatorBusy oldPainter) {
    return oldPainter.backgroundColor != backgroundColor ||
        oldPainter.valueColor != valueColor ||
        // oldPainter.value != value ||
        oldPainter.animationValue != animationValue ||
        oldPainter.textDirection != textDirection;
  }
}

num radians(num deg) => deg * (math.pi / 180.0);

class TltCircularProgressIndicator extends StatefulWidget {
  static final TltTheme _theme = TltTheme.instance;

  TltCircularProgressIndicator({
    Key? key,
    double? value,
    double? width,
    double? startAngle,
    double? radius,
    Color? inActiveColor,
    Color? activeColor,
    this.animation = true,
    int? animationDuration,
    this.centerChild,
    TextStyle? centerTextStyle,
    // Color? centerTextColor,
    // this.centerFontSize,
    this.showCenter = true,
    this.centerLabel,
    TextStyle? centerLabelStyle,
    // Color? centerLabelColor,
    // this.centerLabelFontSize,
    this.addAutomaticKeepAlive = true,
    CircularStrokeCap? circularStrokeCap,
    this.arcType,
    this.reverse = false,
    Curve? animationCurve,
    this.maskFilter,
    // this.isBusy = false,
  })  : value = value != null ? value * 0.01 : _theme.progressIndicatorValue,
        width = width ?? _theme.progressIndicatorLineWidth,
        startAngle = startAngle ?? _theme.progressIndicatorStartAngle,
        radius = radius ?? _theme.progressIndicatorRadius,
        animationDuration =
            animationDuration ?? _theme.progressIndicatorAnimationDuration,
        animationCurve =
            animationCurve ?? _theme.progressIndicatorAnimationCurve,
        circularStrokeCap =
            circularStrokeCap ?? _theme.progressIndicatorCircularStrokeCap,
        inActiveColor = inActiveColor ?? _theme.progressIndicatorFillColor,
        activeColor = activeColor ?? _theme.progressIndicatorActiveColor,
        centerLabelStyle = TextStyle(
            fontSize: centerLabelStyle?.fontSize ??
                (radius != null
                    ? radius / 8.0
                    : _theme.progressIndicatorRadius / 8.0),
            color: centerLabelStyle?.color ??
                _theme.progressIndicatorCenterLabelColor,
            fontWeight: FontWeight.w600),
        centerTextStyle = TextStyle(
            fontSize: centerTextStyle?.fontSize ??
                (radius != null
                    ? radius / 2.8
                    : _theme.progressIndicatorRadius / 2.8),
            color: centerTextStyle?.color ??
                _theme.progressIndicatorCenterTextColor,
            fontWeight: FontWeight.w600),
        // centerTextColor =
        //     centerTextColor ?? _theme.progressIndicatorCenterTextColor,
        // centerLabelColor =
        //     centerLabelColor ?? _theme.progressIndicatorCenterLabelColor,
        super(key: key) {
    // assert(startAngle! >= 0.0);
    assert(!(value != null && (value < 0.0 || value > 100.0)),
        ("value must be a double between 0.0 and 100.0, but it's $value"));
    assert(!(width != null && width < 0.0),
        ("width must be a positive value, but it's $width"));
    assert(!(arcType != null && value == null),
        ("value cannot be null when arcType is specified"));
    // assert(!(animation == false && isBusy == true),
    //     ("set animation to true if you want to have trailing effect"));
  }

  ///value between 0.0 and 100.0, has no effect if [isBusy] is set to true
  final double value;
  final double radius;

  ///Width of the progress bar of the circle
  final double width;

  ///Color of the background of the circle , default = transparent
  final Color inActiveColor;
  final Color activeColor;

  ///true if you want the circle to have animation
  final bool animation;

  ///duration of the animation in milliseconds, It only applies if animation attribute is true
  final int animationDuration;

  ///widget inside the circle
  final Widget? centerChild;

  final TextStyle? centerTextStyle;
  // final Color? centerTextColor;
  // final double? centerFontSize;

  ///hide default widget inside the circle
  final bool showCenter;

  ///label for centerChild
  final String? centerLabel;

  final TextStyle? centerLabelStyle;
  // final Color? centerLabelColor;
  // final double? centerLabelFontSize;

  ///The kind of finish to place on the end of lines drawn, values supported: butt, round, square
  final CircularStrokeCap circularStrokeCap;

  ///the angle which the circle will start the progress (in degrees, eg: 0.0, 45.0, 90.0) and has no effect in arc shape half circle and busy mode
  final double startAngle;

  /// set false if you don't want to preserve the state of the widget
  final bool addAutomaticKeepAlive;

  /// set the arc type
  final TltArcType? arcType;

  /// set true when you want to display the progress in reverse mode
  final bool reverse;

  /// Creates a mask filter that takes the progress shape being drawn and blurs it.
  final MaskFilter? maskFilter;

  /// set a circular curve animation type
  final Curve animationCurve;

  /// set to true to have a trail effect, [animation] must be set to true to have the effect
  // bool isBusy = true;

  @override
  TltCircularProgressIndicatorState createState() =>
      TltCircularProgressIndicatorState();
}

class TltCircularProgressIndicatorState
    extends State<TltCircularProgressIndicator>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController? _animationController;
  Animation? _animation;
  double _value = 0.0;
  double _diameter = 0.0;
  bool isBusy = true;
  static const int _pathCount = 1;
  static const int _rotationCount = 1;
  static final Animatable<double> _strokeHeadTween = CurveTween(
    curve: const Interval(0.0, 0.5, curve: Curves.fastOutSlowIn),
  ).chain(CurveTween(
    curve: const SawTooth(_pathCount),
  ));
  static final Animatable<double> _strokeTailTween = CurveTween(
    curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
  ).chain(CurveTween(
    curve: const SawTooth(_pathCount),
  ));
  static final Animatable<double> _offsetTween =
      CurveTween(curve: const SawTooth(_pathCount));
  static final Animatable<double> _rotationTween =
      CurveTween(curve: const SawTooth(_rotationCount));

  @override
  void dispose() {
    if (_animationController != null) {
      _animationController!.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    isBusy = widget.value == 0.00001;
    if (widget.animation) {
      _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.animationDuration),
      );
      _animation = Tween(begin: 0.0, end: isBusy ? 1.0 : widget.value).animate(
        CurvedAnimation(
            parent: _animationController!, curve: widget.animationCurve),
      )..addListener(() {
          setState(() {
            _value = _animation!.value;
          });
          if (isBusy) {
            _animationController!.repeat();
          }
        });
      _animationController!.forward();
    } else {
      _updateProgress();
    }
    _diameter = widget.radius * 2;
    super.initState();
  }

  void _checkIfNeedCancelAnimation(TltCircularProgressIndicator oldWidget) {
    if (oldWidget.animation &&
        !widget.animation &&
        _animationController != null) {
      _animationController!.stop();
    }
  }

  @override
  void didUpdateWidget(TltCircularProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value ||
        oldWidget.startAngle != widget.startAngle) {
      if (_animationController != null) {
        _animationController!.duration =
            Duration(milliseconds: widget.animationDuration);
        _animation = Tween(
          begin: oldWidget.value,
          end: widget.value,
        ).animate(
          CurvedAnimation(
              parent: _animationController!, curve: widget.animationCurve),
        );
        _animationController!.forward(from: 0.0);
      } else {
        _updateProgress();
      }
    }
    _checkIfNeedCancelAnimation(oldWidget);
  }

  _updateProgress() {
    setState(() => _value = widget.value);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var items = List<Widget>.empty(growable: true);
    // if (widget.header != null) {
    //   items.add(widget.header!);
    // }
    items.add(
      SizedBox(
        height: widget.arcType == TltArcType.half ? _diameter / 2 : _diameter,
        width: _diameter,
        child: CustomPaint(
          painter: isBusy
              ? _TltCircularProgressIndicatorBusy(
                  valueColor: widget.activeColor,
                  backgroundColor: widget.inActiveColor,
                  // value: null,
                  headValue: TltCircularProgressIndicatorState._strokeHeadTween
                      .evaluate(_animationController!),
                  tailValue: TltCircularProgressIndicatorState._strokeTailTween
                      .evaluate(_animationController!),
                  offsetValue: TltCircularProgressIndicatorState._offsetTween
                      .evaluate(_animationController!),
                  rotationValue: TltCircularProgressIndicatorState
                      ._rotationTween
                      .evaluate(_animationController!),
                  strokeWidth: widget.width,
                  radius: widget.radius,
                  reverse: widget.reverse,
                  arcType: widget.arcType,
                  circularStrokeCap: widget.circularStrokeCap,
                  startAngle: widget.startAngle,
                )
              : _CirclePainter(
                  progress: _value * 360,
                  activeColor: widget.activeColor,
                  inActiveColor: widget.inActiveColor,
                  startAngle: widget.startAngle,
                  circularStrokeCap: widget.circularStrokeCap,
                  radius: widget.radius - widget.width / 2,
                  width: widget.width,
                  backgroundWidth: widget.width,
                  arcBackgroundColor: widget.inActiveColor,
                  arcType: widget.arcType,
                  reverse: widget.reverse,
                  maskFilter: widget.maskFilter,
                  rotateLinearGradient: false,
                ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.arcType == TltArcType.half)
                  TltYSpace(widget.radius / 4),
                if (widget.centerLabel != null && !isBusy)
                  Text(
                    widget.centerLabel!,
                    style: widget.centerLabelStyle,
                  ),
                if (widget.showCenter && !isBusy)
                  widget.centerChild ??
                      Text("${(widget.value * 100).round()}%",
                          style: widget.centerTextStyle),
              ],
            ),
          ),
        ),
      ),
    );

    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: items,
      ),
    );
  }

  double getCurrentValue(double value) {
    if (widget.arcType != null) {
      final angle = _getStartAngleFixedMargin(widget.arcType!).fixedStartAngle;
      final fixedValue = 1.0 / widget.value * _value;
      late double margin;
      if (widget.arcType == TltArcType.half) {
        margin = 180 * widget.value;
      } else {
        margin = 280 * widget.value;
      }
      return radians(angle + margin * fixedValue).toDouble();
    } else {
      const angle = 360;
      return radians((widget.reverse ? -angle : angle) * _value).toDouble();
    }
  }

  @override
  bool get wantKeepAlive => widget.addAutomaticKeepAlive;
}

_ArcAngles _getStartAngleFixedMargin(TltArcType arcType) {
  double fixedStartAngle, startAngleFixedMargin;
  // if (arcType == TltArcType.FULL_REVERSED) {
  //   fixedStartAngle = 399;
  //   startAngleFixedMargin = 312 / fixedStartAngle;
  // } else if (arcType == TltArcType.FULL) {
  //   fixedStartAngle = 220;
  //   startAngleFixedMargin = 172 / fixedStartAngle;
  // } else {
  // fixedStartAngle = 270;
  // startAngleFixedMargin = 135 / fixedStartAngle;
  fixedStartAngle = 270;
  startAngleFixedMargin = 135 / fixedStartAngle;
  // }
  return _ArcAngles(
    fixedStartAngle: fixedStartAngle,
    startAngleFixedMargin: startAngleFixedMargin,
  );
}

class _ArcAngles {
  const _ArcAngles(
      {required this.fixedStartAngle, required this.startAngleFixedMargin});
  final double fixedStartAngle;
  final double startAngleFixedMargin;
}

class _CirclePainter extends CustomPainter {
  final Paint _paintBackground = Paint();
  final Paint _paintLine = Paint();
  final Paint _paintBackgroundStartAngle = Paint();
  final double width;
  final double backgroundWidth;
  final double progress;
  final double radius;
  final Color activeColor;
  final Color inActiveColor;
  final CircularStrokeCap circularStrokeCap;
  final double startAngle;
  final LinearGradient? linearGradient;
  final Color? arcBackgroundColor;
  final TltArcType? arcType;
  final bool reverse;
  final MaskFilter? maskFilter;
  final bool rotateLinearGradient;

  _CirclePainter({
    required this.width,
    required this.backgroundWidth,
    required this.progress,
    required this.radius,
    required this.activeColor,
    required this.inActiveColor,
    this.startAngle = 0.0,
    this.circularStrokeCap = CircularStrokeCap.square,
    required this.reverse,
    this.arcBackgroundColor,
    this.arcType,
    this.maskFilter,
    required this.rotateLinearGradient,
  }) : linearGradient = null {
    _paintBackground.color = inActiveColor;
    _paintBackground.style = PaintingStyle.stroke;
    _paintBackground.strokeWidth = backgroundWidth;
    _paintBackground.strokeCap = circularStrokeCap.strokeCap;

    if (arcBackgroundColor != null) {
      _paintBackgroundStartAngle.color = arcBackgroundColor!;
      _paintBackgroundStartAngle.style = PaintingStyle.stroke;
      _paintBackgroundStartAngle.strokeWidth = width;
      _paintBackgroundStartAngle.strokeCap = circularStrokeCap.strokeCap;
    }

    _paintLine.color = activeColor;
    _paintLine.style = PaintingStyle.stroke;
    _paintLine.strokeWidth = width;
    _paintLine.strokeCap = circularStrokeCap.strokeCap;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
        size.width / 2, size.height / (arcType == TltArcType.half ? 1.2 : 2));
    double fixedStartAngle = startAngle;
    double startAngleFixedMargin = 1.0;
    if (arcType != null) {
      final arcAngles = _getStartAngleFixedMargin(arcType!);
      fixedStartAngle = arcAngles.fixedStartAngle;
      startAngleFixedMargin = arcAngles.startAngleFixedMargin;
    }
    if (arcType == null) {
      canvas.drawCircle(center, radius, _paintBackground);
    }

    if (maskFilter != null) {
      _paintLine.maskFilter = maskFilter;
    }
    if (linearGradient != null) {
      if (rotateLinearGradient && progress > 0) {
        double correction = 0;
        if (_paintLine.strokeCap != StrokeCap.butt) {
          correction = math.atan(_paintLine.strokeWidth / 2 / radius);
        }
        _paintLine.shader = SweepGradient(
          transform: reverse
              ? GradientRotation(
                  radians(-90 - progress + startAngle) - correction)
              : GradientRotation(radians(-90.0 + startAngle) - correction),
          startAngle: radians(0).toDouble(),
          endAngle: radians(progress).toDouble(),
          tileMode: TileMode.clamp,
          colors: reverse
              ? linearGradient!.colors.reversed.toList()
              : linearGradient!.colors,
        ).createShader(
          Rect.fromCircle(center: center, radius: radius),
        );
      } else if (!rotateLinearGradient) {
        _paintLine.shader = linearGradient!.createShader(
          Rect.fromCircle(center: center, radius: radius),
        );
      }
    }

    if (arcBackgroundColor != null) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        radians(-90.0 + fixedStartAngle).toDouble(),
        radians(360 * startAngleFixedMargin).toDouble(),
        false,
        _paintBackgroundStartAngle,
      );
    }

    if (reverse) {
      final start =
          radians(360 * startAngleFixedMargin - 90.0 + fixedStartAngle)
              .toDouble();
      final end = radians(-progress * startAngleFixedMargin).toDouble();
      canvas.drawArc(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
        start,
        end,
        false,
        _paintLine,
      );
    } else {
      final start = radians(-90.0 + fixedStartAngle).toDouble();
      final end = radians(progress * startAngleFixedMargin).toDouble();
      canvas.drawArc(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
        start,
        end,
        false,
        _paintLine,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class CustomTooltipContainer extends ShapeBorder {
  final bool isAbove;
  const CustomTooltipContainer({
    this.isAbove = false,
  });
  @override
  EdgeInsetsGeometry get dimensions =>
      const EdgeInsets.symmetric(horizontal: 7, vertical: 9);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight);
    return isAbove
        ? (Path()
          ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(8)))
          ..moveTo(rect.bottomCenter.dx - 7, rect.bottomCenter.dy)
          ..relativeLineTo(6, 6)
          ..relativeLineTo(6, -6)
          ..close())
        : (Path()
          ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(8)))
          ..moveTo(rect.topCenter.dx - 6, rect.topCenter.dy)
          ..relativeLineTo(6, -6)
          ..relativeLineTo(6, 6)
          ..close());
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}

class _TltCircularProgressIndicatorBusy extends CustomPainter {
  _TltCircularProgressIndicatorBusy({
    this.backgroundColor,
    required this.valueColor,
    // required this.value,
    required this.headValue,
    required this.tailValue,
    required this.offsetValue,
    required this.rotationValue,
    required this.strokeWidth,
    this.startAngle = 0.0,
    this.circularStrokeCap = CircularStrokeCap.square,
    required this.radius,
    required this.reverse,
    this.arcType,
  })  : arcStart =
            // value != null
            //           ? _startAngle
            //           :
            _startAngle +
                tailValue * 3 / 2 * math.pi +
                rotationValue * math.pi * 2.0 +
                offsetValue * 0.5 * math.pi,
        arcSweep =
            // value != null
            //     ? value.clamp(0.0, 1.0) * _sweep
            //     :
            math.max(headValue * 3 / 2 * math.pi - tailValue * 3 / 2 * math.pi,
                _epsilon);

  final Color? backgroundColor;
  final Color valueColor;
  // final double? value;
  final double headValue;
  final double tailValue;
  final double offsetValue;
  final double rotationValue;
  final double strokeWidth;
  final double arcStart;
  final double arcSweep;
  final double startAngle;
  final CircularStrokeCap circularStrokeCap;
  final double radius;
  final bool reverse;
  final TltArcType? arcType;

  static const double _epsilon = .001;
  static const double _startAngle = -math.pi / 2.0;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final Paint paint = Paint()
      ..color = valueColor
      ..strokeWidth = strokeWidth
      ..strokeCap = circularStrokeCap.strokeCap
      ..style = PaintingStyle.stroke;
    if (backgroundColor != null) {
      final Paint backgroundPaint = Paint()
        ..color = backgroundColor!
        ..strokeWidth = strokeWidth
        ..strokeCap = circularStrokeCap.strokeCap
        ..style = PaintingStyle.stroke;

      if (arcType != null) {
        canvas.drawCircle(center, radius * 0.9, backgroundPaint);
      }
      if (arcType == null) {
        canvas.drawCircle(center, radius * 0.9, backgroundPaint);
      }
      // canvas.drawArc(Offset.zero & size, 0, _sweep, false, backgroundPaint);
    }

    // if (value == null) // Indeterminate
    // paint.strokeCap = StrokeCap.square;

    // canvas.drawArc(Offset.zero & size, arcStart, arcSweep, false, paint);
    // if (reverse) {
    //   final start =
    //       radians(360 * startAngleFixedMargin - 90.0 + fixedStartAngle)
    //           .toDouble();
    //   final end = radians(-progress * startAngleFixedMargin).toDouble();
    // } else {
    //   final start = radians(-90.0 + fixedStartAngle).toDouble();
    //   final end = radians(progress * startAngleFixedMargin).toDouble();
    // }
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius * 0.9),
      reverse ? 430 - arcStart : arcStart,
      reverse ? -arcSweep : arcSweep,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_TltCircularProgressIndicatorBusy oldPainter) {
    return oldPainter.backgroundColor != backgroundColor ||
        oldPainter.valueColor != valueColor ||
        // oldPainter.value != value ||
        oldPainter.headValue != headValue ||
        oldPainter.tailValue != tailValue ||
        oldPainter.offsetValue != offsetValue ||
        oldPainter.rotationValue != rotationValue ||
        oldPainter.strokeWidth != strokeWidth;
  }
}
