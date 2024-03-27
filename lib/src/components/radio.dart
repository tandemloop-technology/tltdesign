import 'package:flutter/material.dart';

class TltRadio<T> extends StatefulWidget {
  const TltRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.mouseCursor,
    this.taggable = false,
    this.activeColor,
    this.fillColor,
    this.focusColor,
    int? size,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.focusNode,
    this.autofocus = false,
    this.disableButton = false,
  }) : size = size ?? 16;

  final T value;

  final T? groupValue;

  final ValueChanged<T?>? onChanged;

  final MouseCursor? mouseCursor;

  final bool taggable;

  final Color? activeColor;

  final MaterialStateProperty<Color?>? fillColor;

  final MaterialTapTargetSize? materialTapTargetSize;

  final VisualDensity? visualDensity;

  final Color? focusColor;

  final Color? hoverColor;

  final MaterialStateProperty<Color?>? overlayColor;

  final double? splashRadius;

  final int size;

  final FocusNode? focusNode;

  final bool autofocus;
  final bool disableButton;

  bool get _selected => value == groupValue;

  @override
  State<TltRadio<T>> createState() => _RadioState<T>();
}

class _RadioState<T> extends State<TltRadio<T>>
    with TickerProviderStateMixin, ToggleableStateMixin {
  late double _kOuterRadius;
// = 11.0;
  late double _kInnerRadius;
  // = 11.0 - ((59.09090909090909 / 100) * 11.0); //4.5;
  late _RadioPainter _painter;
  late double size;
  @override
  void initState() {
    size = getRenderedRadioSize();
    _kOuterRadius = size;
    _kInnerRadius = size - ((59.09090909090909 / 100) * size); //4.5;
    _painter =
        _RadioPainter(innerRadius: _kInnerRadius, outerRadius: _kOuterRadius);

    super.initState();
  }

  double getRenderedRadioSize() {
    try {
      return widget.size < 10
          ? 25 - (31.25 / 100) * 10
          : widget.size - ((31.25 / 100) * widget.size);
    } on Exception catch (e) {
      debugPrint(e.toString());
      return 10;
    }
  }

  void _handleChanged(bool? selected) {
    if (selected == null) {
      widget.onChanged!(null);
      return;
    }
    if (selected) {
      widget.onChanged!(widget.value);
    }
  }

  @override
  void didUpdateWidget(covariant TltRadio<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget._selected != oldWidget._selected) {
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
      widget.onChanged != null ? _handleChanged : null;

  @override
  bool get tristate => widget.taggable;

  @override
  bool? get value => widget._selected;

  MaterialStateProperty<Color?> get _widgetFillColor {
    return MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return widget.activeColor;
      }
      return null;
    });
  }

  MaterialStateProperty<Color> get _defaultFillColor {
    final ThemeData themeData = Theme.of(context);
    return MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return themeData.disabledColor;
      }
      if (states.contains(MaterialState.selected)) {
        return themeData.primaryColor;
      }
      return themeData.unselectedWidgetColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    final ThemeData themeData = Theme.of(context);
    final MaterialTapTargetSize effectiveMaterialTapTargetSize =
        widget.materialTapTargetSize ??
            themeData.radioTheme.materialTapTargetSize ??
            themeData.materialTapTargetSize;
    final VisualDensity effectiveVisualDensity = widget.visualDensity ??
        themeData.radioTheme.visualDensity ??
        themeData.visualDensity;
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
              widget.mouseCursor, states) ??
          themeData.radioTheme.mouseCursor?.resolve(states) ??
          MaterialStateProperty.resolveAs<MouseCursor>(
              MaterialStateMouseCursor.clickable, states);
    });

    // Colors need to be resolved in selected and non selected states separately
    // so that they can be lerped between.
    final Set<MaterialState> activeStates = states..add(MaterialState.selected);
    final Set<MaterialState> inactiveStates = states
      ..remove(MaterialState.selected);
    final Color effectiveActiveColor = !widget._selected
        ? Colors.grey
        : widget.fillColor?.resolve(activeStates) ??
            _widgetFillColor.resolve(activeStates) ??
            themeData.radioTheme.fillColor?.resolve(activeStates) ??
            _defaultFillColor.resolve(activeStates);
    final Color effectiveInactiveColor = widget._selected
        ? Colors.grey
        : widget.fillColor?.resolve(inactiveStates) ??
            _widgetFillColor.resolve(inactiveStates) ??
            themeData.radioTheme.fillColor?.resolve(inactiveStates) ??
            _defaultFillColor.resolve(inactiveStates);

    final Set<MaterialState> focusedStates = states..add(MaterialState.focused);
    final Color effectiveFocusOverlayColor =
        widget.overlayColor?.resolve(focusedStates) ??
            widget.focusColor ??
            themeData.radioTheme.overlayColor?.resolve(focusedStates) ??
            themeData.focusColor;

    final Set<MaterialState> hoveredStates = states..add(MaterialState.hovered);
    final Color effectiveHoverOverlayColor =
        widget.overlayColor?.resolve(hoveredStates) ??
            widget.hoverColor ??
            themeData.radioTheme.overlayColor?.resolve(hoveredStates) ??
            themeData.hoverColor;

    final Set<MaterialState> activePressedStates = activeStates
      ..add(MaterialState.pressed);
    final Color effectiveActivePressedOverlayColor =
        widget.overlayColor?.resolve(activePressedStates) ??
            themeData.radioTheme.overlayColor?.resolve(activePressedStates) ??
            effectiveActiveColor.withAlpha(kRadialReactionAlpha);

    final Set<MaterialState> inactivePressedStates = inactiveStates
      ..add(MaterialState.pressed);
    final Color effectiveInactivePressedOverlayColor =
        widget.overlayColor?.resolve(inactivePressedStates) ??
            themeData.radioTheme.overlayColor?.resolve(inactivePressedStates) ??
            effectiveActiveColor.withAlpha(kRadialReactionAlpha);

    return Semantics(
      inMutuallyExclusiveGroup: true,
      checked: widget._selected,
      child: buildToggleable(
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        mouseCursor: effectiveMouseCursor,
        size: size,
        painter: _painter
          ..isRadioButtonDisabled = widget.disableButton
          ..selected = widget._selected
          ..position = position
          ..reaction = reaction
          ..reactionFocusFade = reactionFocusFade
          ..reactionHoverFade = reactionHoverFade
          ..inactiveReactionColor = effectiveInactivePressedOverlayColor
          ..reactionColor = effectiveActivePressedOverlayColor
          ..hoverColor = effectiveHoverOverlayColor
          ..focusColor = effectiveFocusOverlayColor
          ..splashRadius = widget.splashRadius ??
              themeData.radioTheme.splashRadius ??
              kRadialReactionRadius
          ..downPosition = downPosition
          ..isFocused = states.contains(MaterialState.focused)
          ..isHovered = states.contains(MaterialState.hovered)
          ..activeColor = effectiveActiveColor
          ..inactiveColor = effectiveInactiveColor,
      ),
    );
  }
}

class _RadioPainter extends ToggleablePainter {
  bool isRadioButtonDisabled;
  bool selected;
  final double outerRadius;
  final double innerRadius;
  _RadioPainter({
    required this.outerRadius,
    required this.innerRadius,
    this.isRadioButtonDisabled = false,
    this.selected = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    paintRadialReaction(canvas: canvas, origin: size.center(Offset.zero));

    final Offset center = (Offset.zero & size).center;
    final Paint paint = Paint();
    if (isRadioButtonDisabled) {
      if (selected) {
        paint
          ..color = Color.lerp(activeColor, inactiveColor, position.value)!
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0;
      } else {
        paint
          ..color = Color.lerp(inactiveColor, activeColor, position.value)!
          ..style = PaintingStyle.fill
          ..strokeWidth = 2.0;
      }
    } else {
      paint
        ..color = Color.lerp(inactiveColor, activeColor, position.value)!
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0;
    }

    canvas.drawCircle(center, outerRadius, paint);

    // Inner circle
    if (!position.isDismissed) {
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(center, innerRadius * position.value, paint);
    }
  }
}

class TltRadioListTile<T> extends StatelessWidget {
  const TltRadioListTile({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.toggleable = false,
    this.activeColor,
    this.title,
    this.subtitle,
    this.isThreeLine = false,
    this.dense,
    this.secondary,
    this.selected = false,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.autofocus = false,
    this.contentPadding,
    this.shape,
    this.tileColor,
    this.selectedTileColor,
    this.visualDensity,
    this.focusNode,
    this.enableFeedback,
    this.disableButton = false,
  })  : assert(!isThreeLine || subtitle != null),
        super(key: key);

  /// The value represented by this radio button.
  final T value;

  /// The currently selected value for this group of radio buttons.
  ///
  /// This radio button is considered selected if its [value] matches the
  /// [groupValue].
  final T? groupValue;

  /// Called when the user selects this radio button.
  ///
  /// The radio button passes [value] as a parameter to this callback. The radio
  /// button does not actually change state until the parent widget rebuilds the
  /// radio tile with the new [groupValue].
  ///
  /// If null, the radio button will be displayed as disabled.
  ///
  /// The provided callback will not be invoked if this radio button is already
  /// selected.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// RadioListTile<SingingCharacter>(
  ///   title: const Text('Lafayette'),
  ///   value: SingingCharacter.lafayette,
  ///   groupValue: _character,
  ///   onChanged: (SingingCharacter newValue) {
  ///     setState(() {
  ///       _character = newValue;
  ///     });
  ///   },
  /// )
  /// ```
  final ValueChanged<T?>? onChanged;

  /// Set to true if this radio list tile is allowed to be returned to an
  /// indeterminate state by selecting it again when selected.
  ///
  /// To indicate returning to an indeterminate state, [onChanged] will be
  /// called with null.
  ///
  /// If true, [onChanged] can be called with [value] when selected while
  /// [groupValue] != [value], or with null when selected again while
  /// [groupValue] == [value].
  ///
  /// If false, [onChanged] will be called with [value] when it is selected
  /// while [groupValue] != [value], and only by selecting another radio button
  /// in the group (i.e. changing the value of [groupValue]) can this radio
  /// list tile be unselected.
  ///
  /// The default is false.
  ///
  /// {@tool dartpad}
  /// This example shows how to enable deselecting a radio button by setting the
  /// [toggleable] attribute.
  ///
  /// ** See code in examples/api/lib/material/radio_list_tile/radio_list_tile.toggleable.0.dart **
  /// {@end-tool}
  final bool toggleable;

  /// The color to use when this radio button is selected.
  ///
  /// Defaults to accent color of the current [Theme].
  final Color? activeColor;

  /// The primary content of the list tile.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  final Widget? subtitle;

  /// A widget to display on the opposite side of the tile from the radio button.
  ///
  /// Typically an [Icon] widget.
  final Widget? secondary;

  /// Whether this list tile is intended to display three lines of text.
  ///
  /// If false, the list tile is treated as having one line if the subtitle is
  /// null and treated as having two lines if the subtitle is non-null.
  final bool isThreeLine;

  /// Whether this list tile is part of a vertically dense list.
  ///
  /// If this property is null then its value is based on [ListTileThemeData.dense].
  final bool? dense;

  /// Whether to render icons and text in the [activeColor].
  ///
  /// No effort is made to automatically coordinate the [selected] state and the
  /// [checked] state. To have the list tile appear selected when the radio
  /// button is the selected radio button, set [selected] to true when [value]
  /// matches [groupValue].
  ///
  /// Normally, this property is left to its default value, false.
  final bool selected;

  /// Where to place the control relative to the text.
  final ListTileControlAffinity controlAffinity;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Defines the insets surrounding the contents of the tile.
  ///
  /// Insets the [Radio], [title], [subtitle], and [secondary] widgets
  /// in [RadioListTile].
  ///
  /// When null, `EdgeInsets.symmetric(horizontal: 16.0)` is used.
  final EdgeInsetsGeometry? contentPadding;

  /// Whether this radio button is checked.
  ///
  /// To control this value, set [value] and [groupValue] appropriately.
  bool get checked => value == groupValue;

  /// If specified, [shape] defines the shape of the [RadioListTile]'s [InkWell] border.
  final ShapeBorder? shape;

  /// If specified, defines the background color for `RadioListTile` when
  /// [RadioListTile.selected] is false.
  final Color? tileColor;

  /// If non-null, defines the background color when [RadioListTile.selected] is true.
  final Color? selectedTileColor;

  /// Defines how compact the list tile's layout will be.
  ///
  /// {@macro flutter.material.themedata.visualDensity}
  final VisualDensity? visualDensity;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.material.ListTile.enableFeedback}
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool? enableFeedback;

  final bool disableButton;

  @override
  Widget build(BuildContext context) {
    final Widget control = TltRadio<T>(
      disableButton: disableButton,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      taggable: toggleable,
      activeColor: activeColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      autofocus: autofocus,
    );
    Widget? leading, trailing;
    switch (controlAffinity) {
      case ListTileControlAffinity.leading:
      case ListTileControlAffinity.platform:
        leading = control;
        trailing = secondary;
        break;
      case ListTileControlAffinity.trailing:
        leading = secondary;
        trailing = control;
        break;
    }
    return MergeSemantics(
      child: ListTileTheme.merge(
        selectedColor: activeColor ?? Theme.of(context).toggleableActiveColor,
        child: ListTile(
          textColor: disableButton ? Colors.grey : null,
          leading: leading,
          title: title,
          subtitle: subtitle,
          trailing: trailing,
          isThreeLine: isThreeLine,
          dense: dense,
          enabled: onChanged != null,
          shape: shape,
          tileColor: tileColor,
          selectedTileColor: selectedTileColor,
          onTap: onChanged != null
              ? () {
                  if (toggleable && checked) {
                    onChanged!(null);
                    return;
                  }
                  if (!checked) {
                    onChanged!(value);
                  }
                }
              : null,
          selected: selected,
          autofocus: autofocus,
          contentPadding: contentPadding,
          visualDensity: visualDensity,
          focusNode: focusNode,
          enableFeedback: enableFeedback,
        ),
      ),
    );
  }
}
