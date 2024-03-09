import 'package:flutter/material.dart';
import 'package:tlt_design/src/components/space.dart';
import 'package:tlt_design/src/foundations/colors.dart';
import 'package:tlt_design/src/foundations/text_styles.dart';
import 'package:tlt_design/src/foundations/theme.dart';

/// [TltCheckbox]
///
/// The boolean type [value] will determines whether [TltCheckbox] is to be checked or unchecked.
///
/// [tristate] determines whether the [TltCheckbox] is to be in intermediate mode or not.
/// It is useful while grouping checkboxes.
class TltCheckbox extends StatefulWidget {
  /// [TltCheckbox]
  ///
  /// The boolean type [value] will determines whether [TltCheckbox] is to be checked or unchecked.
  ///
  /// [tristate] determines whether the [TltCheckbox] is to be in intermediate mode or not.
  /// It is useful while grouping checkboxes.
  const TltCheckbox({
    Key? key,
    required this.value,
    this.tristate = false,
    required this.onChanged,
    this.mouseCursor,
    this.fillColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.focusNode,
    this.autoFocus = false,
    this.size,
    this.borderRadius,
    this.activeBorderColor,
    this.inactiveBorderColor,
    this.iconColor,
    this.enabled = true,
    this.focusColor,
  })  : assert(tristate || value != null),
        super(key: key);

  /// [value] determines the [TltCheckbox] is to be checked or unchecked.
  final bool? value;

  /// To adjust the size of the [TltCheckbox] use [size].
  ///
  /// Since native shape of checkbox is square. This [size] will be used for both height and width.
  final double? size;

  /// [onChanged] is called when the [TltCheckbox] is toggled. It will give
  /// either `true or false` in normal mode. And `true or false or null` in tristate mode.
  final ValueChanged<bool?> onChanged;

  /// If true the checkbox's [value] can be true, false, or null.
  ///
  /// Checkbox displays a dash when its value is null.
  ///
  /// When a tri-state checkbox ([tristate] is true) is tapped, its [onChanged]
  /// callback will be applied to true if the current value is false, to null if
  /// value is true, and to false if value is null (i.e. it cycles through false
  /// => true => null => false when tapped).
  ///
  /// If tristate is false (the default), [value] must not be null.
  final bool tristate;

  /// [enabled] determines whether the [TltCheckbox] is to be disabled or not.
  final bool enabled;

  /// {@template flutter.material.checkbox.mouseCursor}
  ///
  /// When [enabled] is false, by default [mouseCursor] is [SystemMouseCursors.forbidden].
  ///
  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// widget.
  ///
  /// If [mouseCursor] is a [MaterialStateProperty<MouseCursor>],
  /// [MaterialStateProperty.resolve] is used for the following [MaterialState]s:
  ///
  ///  * [MaterialState.selected].
  ///  * [MaterialState.hovered].
  ///  * [MaterialState.focused].
  ///  * [MaterialState.disabled].
  /// {@endtemplate}
  ///
  /// When [value] is null and [tristate] is true, [MaterialState.selected] is
  /// included as a state.
  ///
  /// If null, then the value of [CheckboxThemeData.mouseCursor] is used. If
  /// that is also null, then [MaterialStateMouseCursor.clickable] is used.
  ///
  /// See also:
  ///
  ///  * [MaterialStateMouseCursor], a [MouseCursor] that implements
  ///    `MaterialStateProperty` which is used in APIs that need to accept
  ///    either a [MouseCursor] or a [MaterialStateProperty<MouseCursor>].
  final MouseCursor? mouseCursor;

  /// [splashRadius] is to adjust the size of splash overlay around the [TltCheckbox].
  /// To remove the splash overlay completely, set it to 0.
  final double? splashRadius;

  /// [overlayColor] is the color of the splash overlay.
  /// It will not take effect if [splashRadius] is 0.
  ///
  /// Use same color as [activeBorderColor] with less opacity for better look.
  final Color? overlayColor;

  /// [focusColor] is visible when [TltCheckbox] is in focused state.
  ///
  /// This will be render like a [overlayColor].
  final Color? focusColor;

  /// [borderRadius] determines the border radius of the [TltCheckbox].
  ///
  /// [TltCheckbox] only supports circular border radius.
  /// So only the double is expected. That will be used to render like
  /// `const BorderRadius.all(Radius.circular([borderRadius]))`. Default is 4.
  final double? borderRadius;

  /// This will take effect when the [TltCheckbox] is checked.
  ///
  /// And this color will be visible while hovering the [TltCheckbox].
  final Color? activeBorderColor;

  /// This will take effect only when the [TltCheckbox] is not checked.
  final Color? inactiveBorderColor;

  /// [fillColor] is the background color of the checked checkbox.
  final Color? fillColor;

  /// [iconColor] is the color of the checkbox icon.
  final Color? iconColor;

  /// {@template flutter.material.checkbox.visualDensity}
  /// Defines how compact the checkbox's layout will be.
  /// {@endtemplate}
  ///
  /// {@macro flutter.material.themeData.visualDensity}
  ///
  /// If null, then the value of [CheckboxThemeData.visualDensity] is used. If
  /// that is also null, then the value of [ThemeData.visualDensity] is used.
  ///
  /// See also:
  ///
  ///  * [ThemeData.visualDensity], which specifies the [visualDensity] for all
  ///    widgets within a [Theme].
  final VisualDensity? visualDensity;

  /// {@template flutter.material.checkbox.materialTapTargetSize}
  /// Configures the minimum size of the tap target.
  /// {@endtemplate}
  ///
  /// If null, then the value of [CheckboxThemeData.materialTapTargetSize] is
  /// used. If that is also null, then the value of
  /// [ThemeData.materialTapTargetSize] is used.
  ///
  /// See also:
  ///
  ///  * [MaterialTapTargetSize], for a description of how this affects tap targets.
  final MaterialTapTargetSize? materialTapTargetSize;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autoFocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  @override
  State<TltCheckbox> createState() => _CheckboxState();
}

class _CheckboxState extends State<TltCheckbox>
    with TickerProviderStateMixin, ToggleableStateMixin {
  static final TltTheme _theme = TltTheme.instance;
  final _CheckboxPainter _painter = _CheckboxPainter();
  bool? _previousValue;

  @override
  void initState() {
    super.initState();
    _previousValue = widget.value;
  }

  @override
  void didUpdateWidget(TltCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _previousValue = oldWidget.value;
      animateToValue();
    }
  }

  @override
  void dispose() {
    _painter.dispose();
    super.dispose();
  }

  @override
  ValueChanged<bool?>? get onChanged =>
      widget.enabled ? widget.onChanged : null;

  @override
  bool get tristate => widget.tristate;

  @override
  bool? get value => widget.value;

  double get boxSize => widget.size ?? _theme.checkboxSize;

  Color get getCheckColor => widget.enabled
      ? widget.iconColor ?? widget.activeBorderColor ?? _theme.checkboxIconColor
      : TltColors.gray[200];

  Color get effectiveFillColor => widget.enabled
      ? widget.fillColor ?? _theme.checkboxFillColor
      : TltColors.gray[100];

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));

    final MaterialTapTargetSize effectiveMaterialTapTargetSize =
        widget.materialTapTargetSize ?? MaterialTapTargetSize.padded;

    final VisualDensity effectiveVisualDensity =
        widget.visualDensity ?? VisualDensity.adaptivePlatformDensity;

    Size size;

    switch (effectiveMaterialTapTargetSize) {
      case MaterialTapTargetSize.padded:
        size = const Size(kMinInteractiveDimension, kMinInteractiveDimension);
        break;
      case MaterialTapTargetSize.shrinkWrap:
        size = const Size(
            kMinInteractiveDimension - 8.0, kMinInteractiveDimension - 8.0);
        break;
    }

    size += effectiveVisualDensity.baseSizeAdjustment;

    final MaterialStateProperty<MouseCursor> effectiveMouseCursor =
        MaterialStateProperty.resolveWith<MouseCursor>(
            (Set<MaterialState> states) {
      return MaterialStateProperty.resolveAs<MouseCursor?>(
              widget.enabled
                  ? widget.mouseCursor
                  : SystemMouseCursors.forbidden,
              states) ??
          MaterialStateMouseCursor.clickable.resolve(states);
    });

    return SizedBox(
      width: boxSize,
      height: boxSize,
      child: Semantics(
        checked: widget.value == true,
        child: buildToggleable(
          mouseCursor: effectiveMouseCursor,
          focusNode: widget.focusNode,
          autofocus: widget.autoFocus,
          size: size,
          painter: _painter
            .._edgeSize = boxSize
            ..position = position
            ..reaction = reaction
            ..reactionFocusFade = reactionFocusFade
            ..reactionHoverFade = reactionHoverFade
            ..inactiveReactionColor = effectiveFillColor.withAlpha(0x1F)
            ..reactionColor = effectiveFillColor.withAlpha(0x1F)
            ..hoverColor = widget.overlayColor ?? _theme.checkboxSplashColor
            ..focusColor = widget.focusColor ?? _theme.checkboxSplashColor
            ..splashRadius = widget.splashRadius ?? boxSize
            ..downPosition = downPosition
            ..isFocused = states.contains(MaterialState.focused)
            ..isHovered = states.contains(MaterialState.hovered)
            ..activeColor = effectiveFillColor
            ..inactiveColor = effectiveFillColor
            ..checkColor = getCheckColor
            ..value = value
            ..previousValue = _previousValue
            ..shape = RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                widget.borderRadius ?? _theme.checkboxBorderRadius,
              ),
            )
            ..side = BorderSide(color: _getEffectiveBorderColor(), width: 1.5),
        ),
      ),
    );
  }

  Color _getEffectiveBorderColor() {
    if (states.contains(MaterialState.disabled)) {
      return TltColors.gray[200];
    }
    if (states.contains(MaterialState.selected) ||
        states.contains(MaterialState.hovered)) {
      return widget.activeBorderColor ??
          widget.iconColor ??
          _theme.checkboxActiveBorderColor;
    }
    if (!states.contains(MaterialState.selected)) {
      return widget.inactiveBorderColor ?? _theme.checkboxInactiveBorderColor;
    }
    return _theme.checkboxActiveBorderColor;
  }
}

const double _kStrokeWidth = 2.0;

class _CheckboxPainter extends ToggleablePainter {
  double get edgeSize => _edgeSize!;
  double? _edgeSize;
  set edgeSize(double value) {
    if (_edgeSize == value) {
      return;
    }
    _edgeSize = value;
    notifyListeners();
  }

  Color get checkColor => _checkColor!;
  Color? _checkColor;
  set checkColor(Color value) {
    if (_checkColor == value) {
      return;
    }
    _checkColor = value;
    notifyListeners();
  }

  bool? get value => _value;
  bool? _value;
  set value(bool? value) {
    if (_value == value) {
      return;
    }
    _value = value;
    notifyListeners();
  }

  bool? get previousValue => _previousValue;
  bool? _previousValue;
  set previousValue(bool? value) {
    if (_previousValue == value) {
      return;
    }
    _previousValue = value;
    notifyListeners();
  }

  OutlinedBorder get shape => _shape!;
  OutlinedBorder? _shape;
  set shape(OutlinedBorder value) {
    if (_shape == value) {
      return;
    }
    _shape = value;
    notifyListeners();
  }

  BorderSide? get side => _side;
  BorderSide? _side;
  set side(BorderSide? value) {
    if (_side == value) {
      return;
    }
    _side = value;
    notifyListeners();
  }

  // The square outer bounds of the checkbox at t, with the specified origin.
  // At t == 0.0, the outer rect's size is edgeSize (TltCheckbox.width)
  // At t == 0.5, .. is edgeSize - _kStrokeWidth
  // At t == 1.0, .. is edgeSize
  Rect _outerRectAt(Offset origin, double t) {
    final double inset = 1.0 - (t - 0.5).abs() * 2.0;
    final double size = edgeSize - inset * _kStrokeWidth;
    final Rect rect =
        Rect.fromLTWH(origin.dx + inset, origin.dy + inset, size, size);
    return rect;
  }

  // The checkbox's border color if value == false, or its fill color when
  // value == true or null.
  Color _colorAt(double t) {
    // As t goes from 0.0 to 0.25, animate from the inactiveColor to activeColor.
    return t >= 0.25
        ? activeColor
        : Color.lerp(inactiveColor, activeColor, t * 4.0)!;
  }

  // White stroke used to paint the check and dash.
  Paint _createStrokePaint() {
    return Paint()
      ..color = checkColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = _kStrokeWidth;
  }

  void _drawBox(
      Canvas canvas, Rect outer, Paint paint, BorderSide? side, bool fill) {
    if (fill) {
      canvas.drawPath(shape.getOuterPath(outer), paint);
    }
    if (side != null) {
      shape.copyWith(side: side).paint(canvas, outer);
    }
  }

  void _drawCheck(Canvas canvas, Offset origin, double t, Paint paint) {
    assert(t >= 0.0 && t <= 1.0);
    // As t goes from 0.0 to 1.0, animate the two check mark strokes from the
    // short side to the long side.
    final Path path = Path();
    Offset start = Offset(edgeSize * 0.15, edgeSize * 0.45);
    Offset mid = Offset(edgeSize * 0.4, edgeSize * 0.7);
    Offset end = Offset(edgeSize * 0.85, edgeSize * 0.25);
    if (t < 0.5) {
      final double strokeT = t * 2.0;
      final Offset drawMid = Offset.lerp(start, mid, strokeT)!;
      path.moveTo(origin.dx + start.dx, origin.dy + start.dy);
      path.lineTo(origin.dx + drawMid.dx, origin.dy + drawMid.dy);
    } else {
      final double strokeT = (t - 0.5) * 2.0;
      final Offset drawEnd = Offset.lerp(mid, end, strokeT)!;
      path.moveTo(origin.dx + start.dx, origin.dy + start.dy);
      path.lineTo(origin.dx + mid.dx, origin.dy + mid.dy);
      path.lineTo(origin.dx + drawEnd.dx, origin.dy + drawEnd.dy);
    }
    canvas.drawPath(path, paint);
  }

  void _drawDash(Canvas canvas, Offset origin, double t, Paint paint) {
    assert(t >= 0.0 && t <= 1.0);
    // As t goes from 0.0 to 1.0, animate the horizontal line from the
    // mid point outwards.
    Offset start = Offset(edgeSize * 0.2, edgeSize * 0.5);
    Offset mid = Offset(edgeSize * 0.5, edgeSize * 0.5);
    Offset end = Offset(edgeSize * 0.8, edgeSize * 0.5);
    final Offset drawStart = Offset.lerp(start, mid, 1.0 - t)!;
    final Offset drawEnd = Offset.lerp(mid, end, t)!;
    canvas.drawLine(origin + drawStart, origin + drawEnd, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    paintRadialReaction(canvas: canvas, origin: size.center(Offset.zero));

    final Paint strokePaint = _createStrokePaint();
    final Offset origin = size / 2.0 - Size.square(edgeSize) / 2.0 as Offset;
    final AnimationStatus status = position.status;
    final double tNormalized =
        status == AnimationStatus.forward || status == AnimationStatus.completed
            ? position.value
            : 1.0 - position.value;

    // Four cases: false to null, false to true, null to false, true to false
    if (previousValue == false || value == false) {
      final double t = value == false ? 1.0 - tNormalized : tNormalized;
      final Rect outer = _outerRectAt(origin, t);
      final Paint paint = Paint()..color = _colorAt(t);

      if (t <= 0.5) {
        final BorderSide border =
            side ?? BorderSide(width: 2, color: paint.color);
        _drawBox(canvas, outer, paint, border, false); // only paint the border
      } else {
        _drawBox(canvas, outer, paint, side, true);
        final double tShrink = (t - 0.5) * 2.0;
        if (previousValue == null || value == null) {
          _drawDash(canvas, origin, tShrink, strokePaint);
        } else {
          _drawCheck(canvas, origin, tShrink, strokePaint);
        }
      }
    } else {
      // Two cases: null to true, true to null
      final Rect outer = _outerRectAt(origin, 1.0);
      final Paint paint = Paint()..color = _colorAt(1.0);

      _drawBox(canvas, outer, paint, side, true);
      if (tNormalized <= 0.5) {
        final double tShrink = 1.0 - tNormalized * 2.0;
        if (previousValue == true) {
          _drawCheck(canvas, origin, tShrink, strokePaint);
        } else {
          _drawDash(canvas, origin, tShrink, strokePaint);
        }
      } else {
        final double tExpand = (tNormalized - 0.5) * 2.0;
        if (value == true) {
          _drawCheck(canvas, origin, tExpand, strokePaint);
        } else {
          _drawDash(canvas, origin, tExpand, strokePaint);
        }
      }
    }
  }
}

class TltCheckboxTile extends StatelessWidget {
  static final TltTheme _theme = TltTheme.instance;
  final TltCheckbox child;
  final String title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final CrossAxisAlignment checkboxVerticalAlignment;
  final Color? selectedTileColor;
  final EdgeInsetsGeometry contentPadding;
  final double contentSpacing;
  final BorderRadius tileBorderRadius;
  final bool expanded;

  const TltCheckboxTile({
    Key? key,
    required this.child,
    required this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.checkboxVerticalAlignment = CrossAxisAlignment.center,
    this.selectedTileColor,
    this.contentPadding = const EdgeInsets.all(8.0),
    this.tileBorderRadius = const BorderRadius.all(Radius.circular(6)),
    this.expanded = false,
    this.contentSpacing = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TltCheckbox checkbox = child;

    handleOnTapTile() {
      return checkbox.enabled
          ? () {
              switch (checkbox.value) {
                case false:
                  checkbox.onChanged(true);
                  break;
                case true:
                  checkbox.onChanged(checkbox.tristate ? null : false);
                  break;
                case null:
                  checkbox.onChanged(false);
                  break;
              }
            }
          : null;
    }

    return Material(
      color:
          checkbox.value != false ? selectedTileColor : TltColors.transparent,
      borderRadius: tileBorderRadius,
      child: InkWell(
        mouseCursor: !checkbox.enabled ? SystemMouseCursors.forbidden : null,
        borderRadius: tileBorderRadius,
        hoverColor: checkbox.overlayColor ?? _theme.checkboxSplashColor,
        highlightColor: checkbox.overlayColor ?? _theme.checkboxSplashColor,
        onTap: handleOnTapTile(),
        child: Padding(
          padding: contentPadding,
          child: Row(
            crossAxisAlignment: checkboxVerticalAlignment,
            mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
            children: [
              Padding(padding: const EdgeInsets.only(top: 4), child: checkbox),
              TltXSpace(contentSpacing),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: titleStyle?.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ) ??
                          TltStyles.labelL.copyWith(
                            color: TltColors.gray[700],
                            overflow: TextOverflow.ellipsis,
                          ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: subtitleStyle ??
                            TltStyles.body1.copyWith(
                              color: TltColors.gray[500],
                            ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
