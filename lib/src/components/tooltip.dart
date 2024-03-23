import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:tlt_design/src/foundations/colors.dart';
import 'package:tlt_design/src/foundations/theme.dart';
import 'package:tlt_design/src/utils/properties.dart';
import 'package:tlt_design/src/utils/shadows.dart';

class TltTooltip extends StatefulWidget {
  static final TltTheme _theme = TltTheme.instance;
  TltTooltip({
    Key? key,
    this.title,
    this.message,
    TextStyle? messageTextStyle,
    TextStyle? titleTextStyle,
    double? titleMessageSpace,
    this.richMessage,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.verticalOffset,
    this.horizontalOffset,
    // this.displayHorizontally = false,
    this.preferBelow,
    this.excludeFromSemantics,
    BoxDecoration? decoration,
    this.waitDuration,
    this.showDuration,
    this.arrowPosition = TltArrowPosition.hide,
    this.child,
    this.triggerMode,
    this.enableFeedback,
  })  : assert(
            (message == null) != (richMessage == null) ||
                (title == null) != (richMessage == null),
            'Either one of `title`, `message` or `richMessage` must be specified'),
        assert(
          richMessage == null ||
              messageTextStyle == null ||
              titleTextStyle == null,
          'If `richMessage` is specified, `messageTextStyle` or `titleTextStyle` will have no effect. '
          'If you wish to provide a `textStyle` for a rich tooltip, add the '
          '`textStyle` directly to the `richMessage` InlineSpan.',
        ),
        // arrowAlignment = TltArrowAlignment.center,
        // arrowPosition = arrowPosition ?? _theme.tooltipArrowPosition,
        decoration = arrowPosition == TltArrowPosition.hide
            ? BoxDecoration(
                color: decoration?.color ?? TltColors.white,
                borderRadius:
                    decoration?.borderRadius ?? BorderRadius.circular(8),
                boxShadow: decoration?.boxShadow ?? TltShadow.md(),
                border: Border.all(color: TltColors.transparent, width: 0))
            : ShapeDecoration(
                shape: TooltipShape(
                  // arrowAlignment: arrowAlignment(arrowPosition),
                  arrowPosition: arrowPosition,
                ),
                color: decoration?.color ?? TltColors.white,
                shadows: decoration?.boxShadow ?? TltShadow.md(),
              ),
        messageTextStyle = messageTextStyle ?? _theme.tooltipMessageTextStyle,
        titleTextStyle = titleTextStyle ?? _theme.tooltipTitleTextStyle,
        titleMessageSpace =
            titleMessageSpace ?? _theme.tooltipTitleMessageSpace,
        super(key: key);

  /// The text to display in the tooltip.
  ///
  /// Not all of [title], [message] and [richMessage] may be non-null.
  final String? title;
  final String? message;

  /// [title], [message] spacing
  final double titleMessageSpace;

  /// The rich text to display in the tooltip.
  ///
  /// Only one of [message] and [richMessage] may be non-null.
  final InlineSpan? richMessage;

  /// The height of the tooltip's [child].
  ///
  /// If the [child] is null, then this is the tooltip's intrinsic height.
  final double? height;

  /// The width of the tooltip's [child].
  ///
  /// If the [child] is null, then this is the tooltip's intrinsic width.
  final double? width;

  /// The amount of space by which to inset the tooltip's [child].
  ///
  /// Defaults to 16.0 logical pixels in each direction.
  final EdgeInsetsGeometry? padding;

  /// The empty space that surrounds the tooltip.
  ///
  /// Defines the tooltip's outer [Container.margin]. By default, a
  /// long tooltip will span the width of its window. If long enough,
  /// a tooltip might also span the window's height. This property allows
  /// one to define how much space the tooltip must be inset from the edges
  /// of their display window.
  ///
  /// If this property is null, then [TooltipThemeData.margin] is used.
  /// If [TooltipThemeData.margin] is also null, the default margin is
  /// 0.0 logical pixels on all sides.
  final EdgeInsetsGeometry? margin;

  /// The vertical gap between the widget and the displayed tooltip.
  ///
  /// When [preferBelow] is set to true and tooltips have sufficient space to
  /// display themselves, this property defines how much vertical space
  /// tooltips will position themselves under their corresponding widgets.
  /// Otherwise, tooltips will position themselves above their corresponding
  /// widgets with the given offset.
  final double? verticalOffset;

  final double? horizontalOffset;

  // / Whether the tooltip should be displayed at the left or right of
  // / the [child]. If true, [TooltipThemeData.preferBelow] is used as
  // / "preferLeft"
  // final bool displayHorizontally;

  /// Whether the tooltip defaults to being displayed below the widget.
  ///
  /// Defaults to true. If there is insufficient space to display the tooltip in
  /// the preferred direction, the tooltip will be displayed in the opposite
  /// direction.
  final bool? preferBelow;

  /// Whether the tooltip's [message] or [richMessage] should be excluded from
  final bool? excludeFromSemantics;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  /// Specifies the tooltip's shape and background color.
  final Decoration? decoration;

  /// The style to use for the message of the tooltip.
  final TextStyle? messageTextStyle;

  /// The style to use for the message of the tooltip.
  final TextStyle? titleTextStyle;

  /// The length of time that a pointer must hover over a tooltip's widget
  /// before the tooltip will be shown.
  ///
  /// Defaults to 0 milliseconds (tooltips are shown immediately upon hover).
  final Duration? waitDuration;

  /// The length of time that the tooltip will be shown after a long press
  /// is released or mouse pointer exits the widget.
  ///
  /// Defaults to 1.5 seconds for long press released or 0.1 seconds for mouse
  /// pointer exits the widget.
  final Duration? showDuration;

  /// Whether the tooltip's arrow should be displayed.
  final TltArrowPosition arrowPosition;

  /// Where the tooltip's arrow should be displayed.
  // final TltArrowAlignment arrowAlignment;

  /// The [TooltipTriggerMode] that will show the tooltip.
  ///
  /// If this property is null, then [TooltipThemeData.triggerMode] is used.
  /// If [TooltipThemeData.triggerMode] is also null, the default mode is
  /// [TooltipTriggerMode.longPress].
  final TooltipTriggerMode? triggerMode;

  /// Whether the tooltip should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// When null, the default value is true.
  ///
  /// See also:
  ///
  ///  * [Feedback], for providing platform-specific feedback to certain actions.
  final bool? enableFeedback;

  TltArrowAlignment arrowAlignment(TltArrowPosition arrowPosition) {
    TltArrowAlignment arrowAlignment = TltArrowAlignment.center;
    switch (arrowPosition) {
      case TltArrowPosition.bottomLeft:
        arrowAlignment = TltArrowAlignment.left;
        break;
      case TltArrowPosition.topLeft:
        arrowAlignment = TltArrowAlignment.left;
        break;
      case TltArrowPosition.bottomRight:
        arrowAlignment = TltArrowAlignment.right;
        break;
      case TltArrowPosition.topRight:
        arrowAlignment = TltArrowAlignment.right;
        break;
      default:
        arrowAlignment = TltArrowAlignment.center;
    }
    return arrowAlignment;
  }

  static final List<_TooltipState> _openedTooltips = <_TooltipState>[];

  // Causes any current tooltips to be concealed. Only called for mouse hover enter
  // detections. Won't conceal the supplied tooltip.
  static void _concealOtherTooltips(_TooltipState current) {
    if (_openedTooltips.isNotEmpty) {
      // Avoid concurrent modification.
      final List<_TooltipState> openedTooltips = _openedTooltips.toList();
      for (final _TooltipState state in openedTooltips) {
        if (state == current) {
          continue;
        }
        state._concealTooltip();
      }
    }
  }

  // Causes the most recently concealed tooltip to be revealed. Only called for mouse
  // hover exit detections.
  static void _revealLastTooltip() {
    if (_openedTooltips.isNotEmpty) {
      _openedTooltips.last._revealTooltip();
    }
  }

  /// Dismiss all of the tooltips that are currently shown on the screen.
  ///
  /// This method returns true if it successfully dismisses the tooltips. It
  /// returns false if there is no tooltip shown on the screen.
  static bool dismissAllToolTips() {
    if (_openedTooltips.isNotEmpty) {
      // Avoid concurrent modification.
      final List<_TooltipState> openedTooltips = _openedTooltips.toList();
      for (final _TooltipState state in openedTooltips) {
        state._dismissTooltip(immediately: true);
      }
      return true;
    }
    return false;
  }

  @override
  State<TltTooltip> createState() => _TooltipState();

  // @override
  // void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  //   super.debugFillProperties(properties);
  //   properties.add(StringProperty(
  //     'title',
  //     title,
  //     showName: title == null,
  //     defaultValue: title == null ? null : kNoDefaultValue,
  //   ));
  //   properties.add(StringProperty(
  //     'message',
  //     message,
  //     showName: message == null,
  //     defaultValue: message == null ? null : kNoDefaultValue,
  //   ));
  //   properties.add(StringProperty(
  //     'richMessage',
  //     richMessage?.toPlainText(),
  //     showName: richMessage == null,
  //     defaultValue: richMessage == null ? null : kNoDefaultValue,
  //   ));
  //   properties.add(DoubleProperty('height', height, defaultValue: null));
  //   properties.add(DoubleProperty('width', width, defaultValue: null));
  //   properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding,
  //       defaultValue: null));
  //   properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('margin', margin,
  //       defaultValue: null));
  //   properties.add(
  //       DoubleProperty('vertical offset', verticalOffset, defaultValue: null));
  //   properties.add(FlagProperty('position',
  //       value: preferBelow, ifTrue: 'below', ifFalse: 'above', showName: true));
  //   properties.add(FlagProperty('semantics',
  //       value: excludeFromSemantics, ifTrue: 'excluded', showName: true));
  //   properties.add(DiagnosticsProperty<Duration>('wait duration', waitDuration,
  //       defaultValue: null));
  //   properties.add(DiagnosticsProperty<Duration>('show duration', showDuration,
  //       defaultValue: null));
  //   properties.add(DiagnosticsProperty<TooltipTriggerMode>(
  //       'triggerMode', triggerMode,
  //       defaultValue: null));
  //   properties.add(FlagProperty('enableFeedback',
  //       value: enableFeedback, ifTrue: 'true', showName: true));
  //   properties.add(FlagProperty('enableFeedback',
  //       value: enableFeedback, ifTrue: 'true', showName: true));
  // }
}

class _TooltipState extends State<TltTooltip>
    with SingleTickerProviderStateMixin {
  static const double _defaultVerticalOffset = 24.0;
  static const double _defaultHorizontalOffset = 24.0;
  static const bool _defaultPreferBelow = true;
  static const EdgeInsetsGeometry _defaultMargin = EdgeInsets.zero;
  static const Duration _fadeInDuration = Duration(milliseconds: 150);
  static const Duration _fadeOutDuration = Duration(milliseconds: 75);
  static const Duration _defaultShowDuration = Duration(milliseconds: 1500);
  static const Duration _defaultHoverShowDuration = Duration(milliseconds: 100);
  static const Duration _defaultWaitDuration = Duration.zero;
  static const bool _defaultExcludeFromSemantics = false;
  static const TooltipTriggerMode _defaultTriggerMode =
      TooltipTriggerMode.longPress;
  static const bool _defaultEnableFeedback = true;

  late double height;
  late double width;
  late EdgeInsetsGeometry padding;
  late EdgeInsetsGeometry margin;
  late Decoration decoration;
  late TextStyle messageTextStyle;
  late TextStyle titleTextStyle;
  late double verticalOffset;
  late double horizontalOffset;
  late bool preferBelow;
  late bool excludeFromSemantics;
  late AnimationController _controller;
  OverlayEntry? _entry;
  Timer? _dismissTimer;
  Timer? _showTimer;
  late Duration showDuration;
  late Duration hoverShowDuration;
  late Duration waitDuration;
  late bool _mouseIsConnected;
  bool _pressActivated = false;
  late TooltipTriggerMode triggerMode;
  late bool enableFeedback;
  late bool _isConcealed;
  late bool _forceRemoval;
  late bool _visible;

  /// The plain text message for this tooltip.
  ///
  /// This value will either come from [widget.message] or [widget.richMessage].
  String get _tooltipMessage =>
      widget.title ?? widget.message ?? widget.richMessage!.toPlainText();

  @override
  void initState() {
    super.initState();
    _isConcealed = false;
    _forceRemoval = false;
    _mouseIsConnected = RendererBinding.instance.mouseTracker.mouseIsConnected;
    _controller = AnimationController(
      duration: _fadeInDuration,
      reverseDuration: _fadeOutDuration,
      vsync: this,
    )..addStatusListener(_handleStatusChanged);
    // Listen to see when a mouse is added.
    RendererBinding.instance.mouseTracker
        .addListener(_handleMouseTrackerChange);
    // Listen to global pointer events so that we can hide a tooltip immediately
    // if some other control is clicked on.
    GestureBinding.instance.pointerRouter.addGlobalRoute(_handlePointerEvent);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _visible = TooltipVisibility.of(context);
  }

  // https://material.io/components/tooltips#specs
  double _getDefaultTooltipHeight() {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return 24.0;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.iOS:
        return 32.0;
    }
  }

  double _getDefaultTooltipWidth() {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return 320.0;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.iOS:
        return 400.0;
    }
  }

  EdgeInsets _getDefaultPadding() {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const EdgeInsets.symmetric(horizontal: 8.0);
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.iOS:
        return const EdgeInsets.symmetric(horizontal: 16.0);
    }
  }

  double _getDefaultFontSize() {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return 10.0;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.iOS:
        return 14.0;
    }
  }

  // Forces a rebuild if a mouse has been added or removed.
  void _handleMouseTrackerChange() {
    if (!mounted) {
      return;
    }
    final bool mouseIsConnected =
        RendererBinding.instance.mouseTracker.mouseIsConnected;
    if (mouseIsConnected != _mouseIsConnected) {
      setState(() {
        _mouseIsConnected = mouseIsConnected;
      });
    }
  }

  void _handleStatusChanged(AnimationStatus status) {
    // If this tip is concealed, don't remove it, even if it is dismissed, so that we can
    // reveal it later, unless it has explicitly been hidden with _dismissTooltip.
    if (status == AnimationStatus.dismissed &&
        (_forceRemoval || !_isConcealed)) {
      _removeEntry();
    }
  }

  void _dismissTooltip({bool immediately = false}) {
    _showTimer?.cancel();
    _showTimer = null;
    if (immediately) {
      _removeEntry();
      return;
    }
    // So it will be removed when it's done reversing, regardless of whether it is
    // still concealed or not.
    _forceRemoval = true;
    if (_pressActivated) {
      _dismissTimer ??= Timer(showDuration, _controller.reverse);
    } else {
      _dismissTimer ??= Timer(hoverShowDuration, _controller.reverse);
    }
    _pressActivated = false;
  }

  void _showTooltip({bool immediately = false}) {
    _dismissTimer?.cancel();
    _dismissTimer = null;
    if (immediately) {
      ensureTooltipVisible();
      return;
    }
    _showTimer ??= Timer(waitDuration, ensureTooltipVisible);
  }

  void _concealTooltip() {
    if (_isConcealed || _forceRemoval) {
      // Already concealed, or it's being removed.
      return;
    }
    _isConcealed = true;
    _dismissTimer?.cancel();
    _dismissTimer = null;
    _showTimer?.cancel();
    _showTimer = null;
    if (_entry != null) {
      _entry!.remove();
    }
    _controller.reverse();
  }

  void _revealTooltip() {
    if (!_isConcealed) {
      // Already uncovered.
      return;
    }
    _isConcealed = false;
    _dismissTimer?.cancel();
    _dismissTimer = null;
    _showTimer?.cancel();
    _showTimer = null;
    if (!_entry!.mounted) {
      final OverlayState overlayState = Overlay.of(
        context,
        debugRequiredFor: widget,
      );
      overlayState.insert(_entry!);
    }
    SemanticsService.tooltip(_tooltipMessage);
    _controller.forward();
  }

  /// Shows the tooltip if it is not already visible.
  ///
  /// Returns `false` when the tooltip shouldn't be shown or when the tooltip
  /// was already visible.
  bool ensureTooltipVisible() {
    if (!_visible) return false;
    _showTimer?.cancel();
    _showTimer = null;
    _forceRemoval = false;
    if (_isConcealed) {
      if (_mouseIsConnected) {
        TltTooltip._concealOtherTooltips(this);
      }
      _revealTooltip();
      return true;
    }
    if (_entry != null) {
      // Stop trying to hide, if we were.
      _dismissTimer?.cancel();
      _dismissTimer = null;
      _controller.forward();
      return false; // Already visible.
    }
    _createNewEntry();
    _controller.forward();
    return true;
  }

  static final Set<_TooltipState> _mouseIn = <_TooltipState>{};

  void _handleMouseEnter() {
    _showTooltip();
  }

  void _handleMouseExit({bool immediately = false}) {
    // If the tip is currently covered, we can just remove it without waiting.
    _dismissTooltip(immediately: _isConcealed || immediately);
  }

  void _createNewEntry() {
    final OverlayState overlayState = Overlay.of(
      context,
      debugRequiredFor: widget,
    );

    final RenderBox box = context.findRenderObject()! as RenderBox;
    final Offset target = box.localToGlobal(
      box.size.center(Offset.zero),
      ancestor: overlayState.context.findRenderObject(),
    );

    // We create this widget outside of the overlay entry's builder to prevent
    // updated values from happening to leak into the overlay when the overlay
    // rebuilds.
    final Widget overlay = Directionality(
      textDirection: Directionality.of(context),
      child: _TooltipOverlay(
        arrowAlignment: widget.arrowAlignment(widget.arrowPosition),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.title != null)
              Text(
                widget.title!,
                style: titleTextStyle,
              ),
            if (widget.title != null && widget.message != null)
              SizedBox(
                height: widget.titleMessageSpace,
              ),
            if (widget.message != null)
              Text(
                widget.message!,
                style: messageTextStyle,
              ),
            if (widget.richMessage != null)
              Text.rich(
                widget.richMessage!,
              ),
          ],
        ),
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        onEnter: _mouseIsConnected ? (_) => _handleMouseEnter() : null,
        onExit: _mouseIsConnected ? (_) => _handleMouseExit() : null,
        decoration: decoration,
        titleTextStyle: titleTextStyle,
        messageTextStyle: messageTextStyle,
        animation: CurvedAnimation(
          parent: _controller,
          curve: Curves.fastOutSlowIn,
        ),
        target: target,
        verticalOffset: verticalOffset,
        horizontalOffset: horizontalOffset,
        preferBelow: (widget.arrowPosition == TltArrowPosition.left ||
                widget.arrowPosition == TltArrowPosition.topRight ||
                widget.arrowPosition == TltArrowPosition.topCenter ||
                widget.arrowPosition == TltArrowPosition.topLeft)
            ? false
            : preferBelow,
        displayHorizontally: widget.arrowPosition == TltArrowPosition.left ||
            widget.arrowPosition == TltArrowPosition.right,
      ),
    );
    _entry = OverlayEntry(builder: (BuildContext context) => overlay);
    _isConcealed = false;
    overlayState.insert(_entry!);
    SemanticsService.tooltip(_tooltipMessage);
    if (_mouseIsConnected) {
      // Hovered tooltips shouldn't show more than one at once. For example, a chip with
      // a delete icon shouldn't show both the delete icon tooltip and the chip tooltip
      // at the same time.
      TltTooltip._concealOtherTooltips(this);
    }
    assert(!TltTooltip._openedTooltips.contains(this));
    TltTooltip._openedTooltips.add(this);
  }

  void _removeEntry() {
    TltTooltip._openedTooltips.remove(this);
    _mouseIn.remove(this);
    _dismissTimer?.cancel();
    _dismissTimer = null;
    _showTimer?.cancel();
    _showTimer = null;
    if (!_isConcealed) {
      _entry?.remove();
    }
    _isConcealed = false;
    _entry = null;
    if (_mouseIsConnected) {
      TltTooltip._revealLastTooltip();
    }
  }

  void _handlePointerEvent(PointerEvent event) {
    if (_entry == null) {
      return;
    }
    if (event is PointerUpEvent || event is PointerCancelEvent) {
      _handleMouseExit();
    } else if (event is PointerDownEvent) {
      _handleMouseExit(immediately: true);
    }
  }

  @override
  void deactivate() {
    if (_entry != null) {
      _dismissTooltip(immediately: true);
    }
    _showTimer?.cancel();
    super.deactivate();
  }

  @override
  void dispose() {
    GestureBinding.instance.pointerRouter
        .removeGlobalRoute(_handlePointerEvent);
    RendererBinding.instance.mouseTracker
        .removeListener(_handleMouseTrackerChange);
    _removeEntry();
    _controller.dispose();
    super.dispose();
  }

  void _handlePress() {
    _pressActivated = true;
    final bool tooltipCreated = ensureTooltipVisible();
    if (tooltipCreated && enableFeedback) {
      if (triggerMode == TooltipTriggerMode.longPress) {
        Feedback.forLongPress(context);
      } else {
        Feedback.forTap(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // If message is empty then no need to create a tooltip overlay to show
    // the empty black container so just return the wrapped child as is or
    // empty container if child is not specified.
    if (_tooltipMessage.isEmpty) {
      return widget.child ?? const SizedBox();
    }
    final ThemeData theme = Theme.of(context);
    // final TooltipThemeData tooltipTheme = TooltipTheme.of(context);
    final TextStyle defaultTextStyle;
    final BoxDecoration defaultDecoration;
    if (theme.brightness == Brightness.dark) {
      defaultTextStyle = theme.textTheme.bodyMedium!.copyWith(
        color: Colors.black,
        fontSize: _getDefaultFontSize(),
      );
      defaultDecoration = BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      );
    } else {
      defaultTextStyle = theme.textTheme.bodyMedium!.copyWith(
        color: Colors.white,
        fontSize: _getDefaultFontSize(),
      );
      defaultDecoration = BoxDecoration(
        color: Colors.grey[700]!.withOpacity(0.9),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      );
    }

    height = widget.height ?? _getDefaultTooltipHeight();
    width = widget.width ?? _getDefaultTooltipWidth();
    padding = widget.padding ?? _getDefaultPadding();
    margin = widget.margin ?? _defaultMargin;
    verticalOffset = widget.verticalOffset ?? _defaultVerticalOffset;
    horizontalOffset = widget.horizontalOffset ?? _defaultHorizontalOffset;
    preferBelow = widget.preferBelow ?? _defaultPreferBelow;
    excludeFromSemantics =
        widget.excludeFromSemantics ?? _defaultExcludeFromSemantics;
    decoration = widget.decoration ?? defaultDecoration;
    titleTextStyle = widget.titleTextStyle ?? defaultTextStyle;
    messageTextStyle = widget.messageTextStyle ?? defaultTextStyle;
    waitDuration = widget.waitDuration ?? _defaultWaitDuration;
    showDuration = widget.showDuration ?? _defaultShowDuration;
    hoverShowDuration = widget.showDuration ?? _defaultHoverShowDuration;
    triggerMode = widget.triggerMode ?? _defaultTriggerMode;
    enableFeedback = widget.enableFeedback ?? _defaultEnableFeedback;

    Widget result = Semantics(
      label: excludeFromSemantics ? null : _tooltipMessage,
      child: widget.child,
    );

    // Only check for gestures if tooltip should be visible.
    if (_visible) {
      result = GestureDetector(
        behavior: HitTestBehavior.opaque,
        onLongPress:
            (triggerMode == TooltipTriggerMode.longPress) ? _handlePress : null,
        onTap: (triggerMode == TooltipTriggerMode.tap) ? _handlePress : null,
        excludeFromSemantics: true,
        child: result,
      );
      // Only check for hovering if there is a mouse connected.
      if (_mouseIsConnected) {
        result = MouseRegion(
          onEnter: (_) => _handleMouseEnter(),
          onExit: (_) => _handleMouseExit(),
          child: result,
        );
      }
    }

    return result;
  }
}

/// A delegate for computing the layout of a tooltip to be displayed above or
/// bellow a target specified in the global coordinate system.
class _TooltipPositionDelegate extends SingleChildLayoutDelegate {
  /// Creates a delegate for computing the layout of a tooltip.
  ///
  /// The arguments must not be null.
  _TooltipPositionDelegate({
    required this.arrowAlignment,
    required this.target,
    required this.verticalOffset,
    required this.horizontalOffset,
    required this.preferBelow,
    required this.horizontal,
  });

  /// The offset of the target the tooltip is positioned near in the global
  /// coordinate system.
  final Offset target;

  /// The amount of vertical distance between the target and the displayed
  /// tooltip.
  final double verticalOffset;
  final double horizontalOffset;

  /// Whether the tooltip is displayed below its widget by default.
  ///
  /// If there is insufficient space to display the tooltip in the preferred
  /// direction, the tooltip will be displayed in the opposite direction.
  final bool preferBelow;

  final bool horizontal;

  final TltArrowAlignment arrowAlignment;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) =>
      constraints.loosen();

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    if (horizontal) {
      return horizontalPositionDependentBox(
        size: size,
        childSize: childSize,
        target: target,
        verticalOffset: verticalOffset,
        horizontalOffset: horizontalOffset,
        preferLeft: preferBelow,
        // arrowAlignment: arrowAlignment,
      );
    } else {
      return customPositionDependentBox(
        size: size,
        childSize: childSize,
        target: target,
        verticalOffset: verticalOffset,
        horizontalOffset: horizontalOffset,
        preferBelow: preferBelow,
        arrowAlignment: arrowAlignment,
      );
    }
  }

  @override
  bool shouldRelayout(_TooltipPositionDelegate oldDelegate) {
    return target != oldDelegate.target ||
        verticalOffset != oldDelegate.verticalOffset ||
        preferBelow != oldDelegate.preferBelow;
  }
}

class _TooltipOverlay extends StatelessWidget {
  const _TooltipOverlay({
    Key? key,
    required this.height,
    required this.width,
    required this.content,
    this.padding,
    this.margin,
    this.decoration,
    this.titleTextStyle,
    this.messageTextStyle,
    required this.animation,
    required this.target,
    required this.verticalOffset,
    required this.horizontalOffset,
    required this.preferBelow,
    required this.arrowAlignment,
    this.displayHorizontally = false,
    this.onEnter,
    this.onExit,
  }) : super(key: key);

  final Widget content;
  final double height;
  final double width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  final TextStyle? messageTextStyle;
  final TextStyle? titleTextStyle;
  final Animation<double> animation;
  final Offset target;
  final double verticalOffset;
  final double horizontalOffset;
  final bool preferBelow;
  final bool displayHorizontally;
  final TltArrowAlignment arrowAlignment;
  final PointerEnterEventListener? onEnter;
  final PointerExitEventListener? onExit;

  @override
  Widget build(BuildContext context) {
    Widget result = IgnorePointer(
        child: FadeTransition(
      opacity: animation,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: height, maxWidth: width),
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyMedium!,
          child: Container(
            decoration: decoration,
            padding: padding,
            margin: margin,
            child: Center(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: content,
              // child: Text.rich(
              //   richMessage,
              //   style: textStyle,
              // ),
            ),
          ),
        ),
      ),
    ));
    if (onEnter != null || onExit != null) {
      result = MouseRegion(
        onEnter: onEnter,
        onExit: onExit,
        child: result,
      );
    }
    return Positioned.fill(
      child: CustomSingleChildLayout(
        delegate: _TooltipPositionDelegate(
          target: target,
          verticalOffset: verticalOffset,
          horizontalOffset: horizontalOffset,
          preferBelow: preferBelow,
          horizontal: displayHorizontally,
          arrowAlignment: arrowAlignment,
        ),
        child: result,
      ),
    );
  }
}

Offset customPositionDependentBox({
  required Size size,
  required Size childSize,
  required Offset target,
  required bool preferBelow,
  required TltArrowAlignment arrowAlignment,
  double verticalOffset = 0.0,
  double horizontalOffset = 0.0,
  double margin = 10.0,
}) {
  // VERTICAL DIRECTION
  const double offsetFactor = 1;
  // arrowAlignment == TltArrowAlignment.center
  //     ? 1
  //     : arrowAlignment == TltArrowAlignment.left
  //         ? (1 / 2.3)
  //         : 0.9;
  // verticalOffset = childSize.height * 2.7;
  final bool fitsBelow =
      target.dy + verticalOffset + childSize.height <= size.height - margin;
  final bool fitsAbove =
      target.dy - verticalOffset - childSize.height >= margin;
  final bool tooltipBelow =
      preferBelow ? fitsBelow || !fitsAbove : !(fitsAbove || !fitsBelow);
  double y;
  if (tooltipBelow) {
    y = math.min(target.dy + verticalOffset, size.height - margin);
  } else {
    y = math.max(target.dy - verticalOffset - childSize.height, margin);
  }
  // HORIZONTAL DIRECTION
  double x;
  if (arrowAlignment == TltArrowAlignment.right) {
    x = (size.width * 0.968 / offsetFactor - childSize.width / offsetFactor) /
        2.0;
  } else if (arrowAlignment == TltArrowAlignment.left) {
    x = (size.width * 1.03 / offsetFactor - childSize.width / offsetFactor) /
        2.0;
  } else {
    if (size.width - margin * 2.0 < childSize.width) {
      x = (size.width / offsetFactor - childSize.width / offsetFactor) / 2.0;
    } else {
      final double normalizedTargetX =
          target.dx.clamp(margin, size.width / offsetFactor - margin);
      final double edge = margin + childSize.width / offsetFactor / 2.0;
      if (normalizedTargetX < edge) {
        x = margin;
      } else if (normalizedTargetX > size.width / offsetFactor - edge) {
        x = size.width / offsetFactor - margin - childSize.width / offsetFactor;
      } else {
        x = normalizedTargetX - childSize.width / offsetFactor / 2.0;
      }
    }
  }
  x = horizontalOffset == 24
      ? x + horizontalOffset * 0.011
      : x + horizontalOffset;
  return Offset(x, y);
}

Offset horizontalPositionDependentBox({
  required Size size,
  required Size childSize,
  required Offset target,
  required bool preferLeft,
  double verticalOffset = 0.0,
  double horizontalOffset = 0.0,
  double margin = 10.0,
  // required TltArrowAlignment arrowAlignment,
  // double offsetFactor = 1 / 1.84,
  // double offsetFactor = 2.6,
}) {
  // Horizontal DIRECTION
  const double offsetFactor = 1;
  // final double offsetFactor = arrowAlignment == TltArrowAlignment.center
  //     ? 1
  //     : arrowAlignment == TltArrowAlignment.left
  //         ? 2.4
  //         : (1 / 0.9);
  final bool fitsLeft =
      target.dx + horizontalOffset + childSize.width <= size.width - margin;
  final bool fitsRight =
      target.dx - horizontalOffset - childSize.width >= margin;
  final bool tooltipLeft =
      preferLeft ? fitsLeft || !fitsRight : !(fitsRight || !fitsLeft);
  double x;
  if (tooltipLeft) {
    x = math.min(target.dx + horizontalOffset, size.width - margin);
  } else {
    x = math.max(target.dx - horizontalOffset - childSize.width, margin);
  }
  // Vertical DIRECTION
  double y;
  // if (arrowAlignment == TltArrowAlignment.right) {
  //   y = (size.height / offsetFactor - childSize.height / offsetFactor) / 2.0;
  // } else {
  if (size.height - margin * 2.0 < childSize.height) {
    y = (size.height / offsetFactor - childSize.height / offsetFactor) / 2.0;
  } else {
    final double normalizedTargetY =
        target.dy.clamp(margin, size.height / offsetFactor - margin);
    // final double edge = margin + childSize.height / offsetFactor / 2.0;
    // if (normalizedTargetY < edge && arrowAlignment != TltArrowAlignment.left) {
    //   y = margin;
    // } else if (normalizedTargetY > size.height / offsetFactor - edge &&
    //     arrowAlignment != TltArrowAlignment.left) {
    //   y = size.height / offsetFactor - margin - childSize.height / offsetFactor;
    // } else {
    y = normalizedTargetY - childSize.height / offsetFactor / 2.0;
    // }
    // }
  }
  y = verticalOffset == 24 ? y + verticalOffset * -0.0166 : y + verticalOffset;
  return Offset(x, y);
}

class TooltipShape extends ShapeBorder {
  // final TltArrowAlignment arrowAlignment;
  final TltArrowPosition arrowPosition;
  final double? borderRadius;
  const TooltipShape({
    // required this.arrowAlignment,
    required this.arrowPosition,
    this.borderRadius,
  });
  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight);
    TltArrowAlignment arrowAlignment = TltArrowAlignment.center;
    switch (arrowPosition) {
      case TltArrowPosition.bottomLeft:
        arrowAlignment = TltArrowAlignment.left;
        break;
      case TltArrowPosition.topLeft:
        arrowAlignment = TltArrowAlignment.left;
        break;
      case TltArrowPosition.bottomRight:
        arrowAlignment = TltArrowAlignment.right;
        break;
      case TltArrowPosition.topRight:
        arrowAlignment = TltArrowAlignment.right;
        break;
      default:
        arrowAlignment = TltArrowAlignment.center;
    }
    if (arrowPosition == TltArrowPosition.topRight ||
        arrowPosition == TltArrowPosition.topLeft ||
        arrowPosition == TltArrowPosition.topCenter) {
      return Path()
        ..addRRect(RRect.fromRectAndRadius(
            rect, Radius.circular(borderRadius ?? rect.height / 8)))
        ..moveTo(
            arrowAlignment == TltArrowAlignment.center
                ? rect.bottomCenter.dx - 6
                : arrowAlignment == TltArrowAlignment.left
                    ? 13
                    : rect.bottomRight.dx - 25,
            rect.bottomCenter.dy)
        ..relativeLineTo(6, 6.5)
        ..relativeLineTo(6, -6.5)
        ..close();
    } else if (arrowPosition == TltArrowPosition.bottomRight ||
        arrowPosition == TltArrowPosition.bottomLeft ||
        arrowPosition == TltArrowPosition.bottomCenter) {
      return Path()
        ..addRRect(RRect.fromRectAndRadius(
            rect, Radius.circular(borderRadius ?? rect.height / 8)))
        ..moveTo(
            arrowAlignment == TltArrowAlignment.center
                ? rect.topCenter.dx - 7
                : arrowAlignment == TltArrowAlignment.left
                    ? 13
                    : rect.bottomRight.dx - 27,
            rect.topCenter.dy + 2)
        ..relativeLineTo(8, -8)
        ..relativeLineTo(8, 8)
        ..close();
    } else if (arrowPosition == TltArrowPosition.right) {
      return Path()
        ..addRRect(RRect.fromRectAndRadius(
            rect, Radius.circular(borderRadius ?? rect.height / 8)))
        ..moveTo(
          rect.centerLeft.dx,
          rect.centerLeft.dy - 5.6,
        )
        ..relativeLineTo(-6.5, 6)
        ..relativeLineTo(6.5, 6)
        ..close();
    } else {
      return Path()
        ..addRRect(RRect.fromRectAndRadius(
            rect, Radius.circular(borderRadius ?? rect.height / 8)))
        ..moveTo(
            rect.centerRight.dx,
            // arrowAlignment == TltArrowAlignment.center
            //     ?
            rect.centerRight.dy - 4
            // : arrowAlignment == TltArrowAlignment.left
            //     ? rect.centerRight.dy * 0.3
            //     : rect.centerRight.dy * 1.2
            )
        ..relativeLineTo(6.5, 5)
        ..relativeLineTo(-6.5, 5)
        ..close();
    }
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // ignore: todo
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) => this;
}
