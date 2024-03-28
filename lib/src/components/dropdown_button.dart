import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart'
    show Brightness, LogicalKeyboardKey, MouseCursor;
import 'package:tlt_design/src/foundations/colors.dart';
import 'package:tlt_design/src/foundations/theme.dart';
import 'package:tlt_design/src/utils/icons.dart';
import 'package:tlt_design/src/utils/properties.dart';

final TltTheme _theme = TltTheme.instance;

const EdgeInsetsGeometry _defaultAlignedButtonPadding =
    EdgeInsetsDirectional.only(start: 16.0, end: 4.0);
const EdgeInsets _defaultUnalignedButtonPadding = EdgeInsets.zero;
BoxDecoration _defaultDropDownDecoration = _theme.dropdownButtonDecoration;

class _DropdownMenuPainter extends CustomPainter {
  _DropdownMenuPainter({
    this.color,
    this.selectedIndex,
    required this.resize,
    required this.getSelectedItemOffset,
    required this.itemHeight,
    this.dropdownDecoration,
  })  : _painter = dropdownDecoration
                ?.copyWith(
                    color: dropdownDecoration.color ?? color,
                    boxShadow: dropdownDecoration.boxShadow)
                .createBoxPainter() ??
            _defaultDropDownDecoration.createBoxPainter(),
        super(repaint: resize);

  final Color? color;
  final int? selectedIndex;
  final Animation<double> resize;
  final ValueGetter<double> getSelectedItemOffset;
  final double itemHeight;
  final BoxDecoration? dropdownDecoration;

  final BoxPainter _painter;

  @override
  void paint(Canvas canvas, Size size) {
    final double selectedItemOffset = getSelectedItemOffset();
    final Tween<double> top = Tween<double>(
      begin: selectedItemOffset.clamp(
          0.0, math.max(size.height - itemHeight, 0.0)),
      end: 0.0,
    );

    final Tween<double> bottom = Tween<double>(
      begin: (top.begin! + itemHeight)
          .clamp(math.min(itemHeight, size.height), size.height),
      end: size.height,
    );

    final Rect rect = Rect.fromLTRB(
        0.0, top.evaluate(resize), size.width, bottom.evaluate(resize));

    _painter.paint(canvas, rect.topLeft, ImageConfiguration(size: rect.size));
  }

  @override
  bool shouldRepaint(_DropdownMenuPainter oldPainter) {
    return oldPainter.color != color ||
        oldPainter.selectedIndex != selectedIndex ||
        oldPainter.dropdownDecoration != dropdownDecoration ||
        oldPainter.itemHeight != itemHeight ||
        oldPainter.resize != resize;
  }
}

class _DropdownMenuItemButton<T> extends StatefulWidget {
  const _DropdownMenuItemButton({
    Key? key,
    this.padding,
    required this.route,
    required this.buttonRect,
    required this.constraints,
    required this.itemIndex,
    required this.enableFeedback,
  }) : super(key: key);

  final _DropdownRoute<T> route;
  final EdgeInsets? padding;
  final Rect buttonRect;
  final BoxConstraints constraints;
  final int itemIndex;
  final bool enableFeedback;

  @override
  _DropdownMenuItemButtonState<T> createState() =>
      _DropdownMenuItemButtonState<T>();
}

class _DropdownMenuItemButtonState<T>
    extends State<_DropdownMenuItemButton<T>> {
  void _handleFocusChange(bool focused) {
    final bool inTraditionalMode;
    switch (FocusManager.instance.highlightMode) {
      case FocusHighlightMode.touch:
        inTraditionalMode = false;
        break;
      case FocusHighlightMode.traditional:
        inTraditionalMode = true;
        break;
    }

    if (focused && inTraditionalMode) {
      final _MenuLimits menuLimits = widget.route.getMenuLimits(
        widget.buttonRect,
        widget.constraints.maxHeight,
        widget.itemIndex,
      );
      widget.route.scrollController!.animateTo(
        menuLimits.scrollOffset,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 100),
      );
    }
  }

  void _handleOnTap() {
    final DropdownMenuItem<T> dropdownMenuItem =
        widget.route.items[widget.itemIndex].item!;

    dropdownMenuItem.onTap?.call();

    Navigator.pop(
      context,
      _DropdownRouteResult<T>(dropdownMenuItem.value),
    );
  }

  static const Map<ShortcutActivator, Intent> _webShortcuts =
      <ShortcutActivator, Intent>{
    // On the web, up/down don't change focus, *except* in a <select>
    // element, which is what a dropdown emulates.
    SingleActivator(LogicalKeyboardKey.arrowDown):
        DirectionalFocusIntent(TraversalDirection.down),
    SingleActivator(LogicalKeyboardKey.arrowUp):
        DirectionalFocusIntent(TraversalDirection.up),
  };

  @override
  Widget build(BuildContext context) {
    final DropdownMenuItem<T> dropdownMenuItem =
        widget.route.items[widget.itemIndex].item!;
    final CurvedAnimation opacity;
    final double unit = 0.5 / (widget.route.items.length + 1.5);
    if (widget.itemIndex == widget.route.selectedIndex) {
      opacity = CurvedAnimation(
          parent: widget.route.animation!, curve: const Threshold(0.0));
    } else {
      final double start =
          (0.5 + (widget.itemIndex + 1) * unit).clamp(0.0, 1.0);
      final double end = (start + 1.5 * unit).clamp(0.0, 1.0);
      opacity = CurvedAnimation(
          parent: widget.route.animation!, curve: Interval(start, end));
    }
    Widget child = Container(
      padding: widget.padding,
      height: widget.route.itemHeight,
      child: widget.route.items[widget.itemIndex],
    );
    // An [InkWell] is added to the item only if it is enabled
    // isNoSelectedItem to avoid first item highlight when no item selected
    if (dropdownMenuItem.enabled) {
      Color hoverColor = widget.route.selectedItemColor!.withOpacity(0.3);
      final isSelectedItem = !widget.route.isNoSelectedItem &&
          widget.itemIndex == widget.route.selectedIndex;
      child = InkWell(
        hoverColor: hoverColor,
        highlightColor: hoverColor,
        splashColor: hoverColor,
        focusColor: hoverColor,
        autofocus: isSelectedItem,
        enableFeedback: widget.enableFeedback,
        onTap: _handleOnTap,
        onFocusChange: _handleFocusChange,
        child: Container(
          color: isSelectedItem ? widget.route.selectedItemColor : null,
          child: child,
        ),
      );
    }
    child = FadeTransition(opacity: opacity, child: child);
    if (kIsWeb && dropdownMenuItem.enabled) {
      child = Shortcuts(
        shortcuts: _webShortcuts,
        child: child,
      );
    }
    return child;
  }
}

class _DropdownMenu<T> extends StatefulWidget {
  const _DropdownMenu({
    Key? key,
    this.padding,
    required this.route,
    required this.buttonRect,
    required this.constraints,
    required this.enableFeedback,
    required this.itemHeight,
    this.dropdownDecoration,
    this.dropdownPadding,
    this.scrollbarVisibility,
    required this.offset,
  }) : super(key: key);

  final _DropdownRoute<T> route;
  final EdgeInsets? padding;
  final Rect buttonRect;
  final BoxConstraints constraints;
  final bool enableFeedback;
  final double itemHeight;
  final BoxDecoration? dropdownDecoration;
  final EdgeInsetsGeometry? dropdownPadding;
  final TltVisibility? scrollbarVisibility;
  final Offset offset;

  @override
  _DropdownMenuState<T> createState() => _DropdownMenuState<T>();
}

class _DropdownMenuState<T> extends State<_DropdownMenu<T>> {
  late CurvedAnimation _fadeOpacity;
  late CurvedAnimation _resize;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // This animation needs to be held as a state due to its curve direction.
    // CurvedAnimation objects would be lost if we recreated them in build
    // when the route's animation reverses
    _fadeOpacity = CurvedAnimation(
      parent: widget.route.animation!,
      curve: const Interval(0.0, 0.25),
      reverseCurve: const Interval(0.75, 1.0),
    );
    _resize = CurvedAnimation(
      parent: widget.route.animation!,
      curve: const Interval(0.25, 0.5),
      reverseCurve: const Threshold(0.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final _DropdownRoute<T> route = widget.route;
    final List<Widget> children = <Widget>[
      for (int itemIndex = 0; itemIndex < route.items.length; ++itemIndex)
        _DropdownMenuItemButton<T>(
          route: widget.route,
          padding: widget.padding,
          buttonRect: widget.buttonRect,
          constraints: widget.constraints,
          itemIndex: itemIndex,
          enableFeedback: widget.enableFeedback,
        ),
    ];

    return FadeTransition(
      opacity: _fadeOpacity,
      child: CustomPaint(
        painter: _DropdownMenuPainter(
          color: Theme.of(context).canvasColor,
          selectedIndex: route.selectedIndex,
          resize: _resize,
          getSelectedItemOffset: () => route.getItemOffset(0),
          itemHeight: widget.itemHeight,
          dropdownDecoration: widget.dropdownDecoration,
        ),
        child: Semantics(
          scopesRoute: true,
          namesRoute: true,
          explicitChildNodes: true,
          label: MaterialLocalizations.of(context).popupMenuLabel,
          child: Material(
            type: MaterialType.transparency,
            textStyle: route.style,
            //Prevent scrollbar, ripple effect & items from going beyond border boundaries when scrolling.
            clipBehavior: Clip.antiAlias,
            borderRadius: widget.dropdownDecoration?.borderRadius
                    ?.resolve(Directionality.of(context)) ??
                const BorderRadius.all(Radius.circular(2.0)),
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
                overscroll: false,
                physics: const ClampingScrollPhysics(),
                platform: Theme.of(context).platform,
              ),
              child: PrimaryScrollController(
                controller: widget.route.scrollController!,
                child: Scrollbar(
                  radius: const Radius.circular(8),
                  thickness: 8,
                  thumbVisibility:
                      widget.scrollbarVisibility == TltVisibility.always
                          ? true
                          : false,
                  child: ListView(
                    controller: widget.route.scrollController!,
                    padding: widget.dropdownPadding,
                    shrinkWrap: true,
                    children: children,
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

class _DropdownMenuRouteLayout<T> extends SingleChildLayoutDelegate {
  _DropdownMenuRouteLayout({
    required this.buttonRect,
    required this.route,
    required this.textDirection,
    required this.itemHeight,
    this.itemWidth,
    required this.offset,
  });

  final Rect buttonRect;
  final _DropdownRoute<T> route;
  final TextDirection? textDirection;
  final double itemHeight;
  final double? itemWidth;
  final Offset offset;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    // For more info about constraints https://material.io/design/components/menus.html#usage
    double maxHeight = math.max(0.0, constraints.maxHeight - 2 * itemHeight);
    if (route.menuMaxHeight != null && route.menuMaxHeight! <= maxHeight) {
      maxHeight = route.menuMaxHeight!;
    }
    final double width =
        itemWidth ?? math.min(constraints.maxWidth, buttonRect.width);
    return BoxConstraints(
      minWidth: width,
      maxWidth: width,
      maxHeight: maxHeight,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    final _MenuLimits menuLimits =
        route.getMenuLimits(buttonRect, size.height, route.selectedIndex);

    assert(() {
      final Rect container = Offset.zero & size;
      if (container.intersect(buttonRect) == buttonRect) {
        assert(menuLimits.top >= 0.0);
        assert(menuLimits.top + menuLimits.height <= size.height);
      }
      return true;
    }());
    assert(textDirection != null);
    final double left;
    switch (textDirection!) {
      case TextDirection.rtl:
        left = (buttonRect.right + offset.dx).clamp(0.0, size.width) -
            childSize.width;
        break;
      case TextDirection.ltr:
        left = (buttonRect.left + offset.dx)
            .clamp(0.0, size.width - childSize.width);
        break;
    }

    return Offset(left, menuLimits.top);
  }

  @override
  bool shouldRelayout(_DropdownMenuRouteLayout<T> oldDelegate) {
    return buttonRect != oldDelegate.buttonRect ||
        textDirection != oldDelegate.textDirection;
  }
}

@immutable
class _DropdownRouteResult<T> {
  const _DropdownRouteResult(this.result);

  final T? result;

  @override
  bool operator ==(Object other) {
    return other is _DropdownRouteResult<T> && other.result == result;
  }

  @override
  int get hashCode => result.hashCode;
}

class _MenuLimits {
  const _MenuLimits(this.top, this.bottom, this.height, this.scrollOffset);

  final double top;
  final double bottom;
  final double height;
  final double scrollOffset;
}

class _DropdownRoute<T> extends PopupRoute<_DropdownRouteResult<T>> {
  _DropdownRoute({
    required this.items,
    required this.padding,
    required this.buttonRect,
    required this.selectedIndex,
    required this.isNoSelectedItem,
    this.selectedItemColor,
    required this.capturedThemes,
    required this.style,
    this.barrierLabel,
    required this.enableFeedback,
    required this.itemHeight,
    this.itemWidth,
    this.menuMaxHeight,
    this.dropdownDecoration,
    this.dropdownPadding,
    this.scrollbarVisibility,
    required this.offset,
  }) : itemHeights = List<double>.filled(items.length, itemHeight);

  final List<_MenuItem<T>> items;
  final EdgeInsetsGeometry padding;
  final Rect buttonRect;
  final int selectedIndex;
  final bool isNoSelectedItem;
  final Color? selectedItemColor;
  final CapturedThemes capturedThemes;
  final TextStyle style;
  final bool enableFeedback;
  final double itemHeight;
  final double? itemWidth;
  final double? menuMaxHeight;
  final BoxDecoration? dropdownDecoration;
  final EdgeInsetsGeometry? dropdownPadding;
  final TltVisibility? scrollbarVisibility;
  final Offset offset;

  final List<double> itemHeights;
  ScrollController? scrollController;

  @override
  Duration get transitionDuration => _theme.dropdownMenuDuration;

  @override
  bool get barrierDismissible => true;

  @override
  Color? get barrierColor => null;

  @override
  final String? barrierLabel;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return _DropdownRoutePage<T>(
          route: this,
          constraints: constraints,
          items: items,
          padding: padding,
          buttonRect: buttonRect,
          selectedIndex: selectedIndex,
          capturedThemes: capturedThemes,
          style: style,
          enableFeedback: enableFeedback,
          dropdownDecoration: dropdownDecoration,
          dropdownPadding: dropdownPadding,
          menuMaxHeight: menuMaxHeight,
          itemHeight: itemHeight,
          itemWidth: itemWidth,
          scrollbarVisibility: scrollbarVisibility,
          offset: offset,
        );
      },
    );
  }

  void _dismiss() {
    if (isActive) {
      navigator?.removeRoute(this);
    }
  }

  double getItemOffset(int index) {
    double offset = kMaterialListPadding.top;
    if (items.isNotEmpty && index > 0) {
      assert(items.length == itemHeights.length);
      offset += itemHeights
          .sublist(0, index)
          .reduce((double total, double height) => total + height);
    }
    return offset;
  }

  _MenuLimits getMenuLimits(
      Rect buttonRect, double availableHeight, int index) {
    double computedMaxHeight = availableHeight - 2.0 * itemHeight;
    if (menuMaxHeight != null) {
      computedMaxHeight = math.min(computedMaxHeight, menuMaxHeight!);
    }

    // Depending on where the button is placed on the screen, the button's top or bottom may be
    // smaller than defaultMenuItemHeight from the edge. In this scenario, we'd like the menu limits
    // to align with the top or bottom edge of the button.

    final double buttonTop = buttonRect.top;
    final double buttonBottom = math.min(buttonRect.bottom, availableHeight);
    final double selectedItemOffset = getItemOffset(index);
    final double topLimit = math.min(itemHeight, buttonTop);
    final double bottomLimit = math.max(availableHeight, buttonBottom);
    double menuTop = buttonBottom - offset.dy;
    double preferredMenuHeight = dropdownPadding != null
        ? dropdownPadding!.vertical
        : kMaterialListPadding.vertical;
    if (items.isNotEmpty) {
      preferredMenuHeight +=
          itemHeights.reduce((double total, double height) => total + height);
    }

    // The menu should be shrunk if it has too many items, so that it is not
    // bigger than computedMaxHeight.
    final double menuHeight = math.min(computedMaxHeight, preferredMenuHeight);
    double menuBottom = menuTop + menuHeight;

    // It is necessary to bring the computed top and bottom of the menu in line
    // with the specified range if they are outside of it. Whenever the item height
    // exceeds the button height, and the button is near the bottom or top of the
    // screen, the menu will be aligned with the bottom or top of the button respectively.
    if (menuTop < topLimit) {
      menuTop = math.min(buttonTop, topLimit);
      menuBottom = menuTop + menuHeight;
    }

    if (menuBottom > bottomLimit) {
      menuBottom = math.max(buttonBottom, bottomLimit);
      menuTop = menuBottom - menuHeight;
    }

    if (menuBottom - itemHeights[selectedIndex] / 2.0 <
        buttonBottom - buttonRect.height / 2.0) {
      menuBottom = math.max(buttonBottom, bottomLimit);
      menuTop = menuBottom - menuHeight;
    }

    double scrollOffset = 0;
    // If all of the menu items will not fit within availableHeight then
    // compute the scroll offset that will line the selected menu item up
    // with the select item. This is only done when the menu is first
    // shown - subsequently we leave the scroll offset where the user left
    // it. This scroll offset is only accurate for fixed height menu items
    // (the default).
    if (preferredMenuHeight > computedMaxHeight) {
      // The offset should be zero if the selected item is in view at the beginning
      // of the menu. Otherwise, the scroll offset should center the item if possible.
      scrollOffset = math.max(
          0.0,
          selectedItemOffset -
              (menuHeight / 2) +
              (itemHeights[selectedIndex] / 2));
      // If the selected item's scroll offset is greater than the maximum scroll offset,
      // set it instead to the maximum allowed scroll offset.
      scrollOffset = math.min(scrollOffset, preferredMenuHeight - menuHeight);
    }

    assert((menuBottom - menuTop - menuHeight).abs() < precisionErrorTolerance);
    return _MenuLimits(menuTop, menuBottom, menuHeight, scrollOffset);
  }
}

class _DropdownRoutePage<T> extends StatelessWidget {
  const _DropdownRoutePage({
    Key? key,
    required this.route,
    required this.constraints,
    this.items,
    required this.padding,
    required this.buttonRect,
    required this.selectedIndex,
    required this.capturedThemes,
    this.style,
    required this.enableFeedback,
    this.dropdownDecoration,
    this.dropdownPadding,
    this.menuMaxHeight,
    required this.itemHeight,
    this.itemWidth,
    this.scrollbarVisibility,
    required this.offset,
  }) : super(key: key);

  final _DropdownRoute<T> route;
  final BoxConstraints constraints;
  final List<_MenuItem<T>>? items;
  final EdgeInsetsGeometry padding;
  final Rect buttonRect;
  final int selectedIndex;
  final CapturedThemes capturedThemes;
  final TextStyle? style;
  final bool enableFeedback;
  final BoxDecoration? dropdownDecoration;
  final EdgeInsetsGeometry? dropdownPadding;
  final double? menuMaxHeight;
  final double itemHeight;
  final double? itemWidth;
  final TltVisibility? scrollbarVisibility;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasDirectionality(context));

    if (route.scrollController == null) {
      final _MenuLimits menuLimits =
          route.getMenuLimits(buttonRect, constraints.maxHeight, selectedIndex);
      route.scrollController =
          ScrollController(initialScrollOffset: menuLimits.scrollOffset);
    }

    final TextDirection? textDirection = Directionality.maybeOf(context);
    final Widget menu = _DropdownMenu<T>(
      route: route,
      padding: padding.resolve(textDirection),
      buttonRect: buttonRect,
      constraints: constraints,
      enableFeedback: enableFeedback,
      itemHeight: itemHeight,
      dropdownDecoration: dropdownDecoration,
      dropdownPadding: dropdownPadding,
      scrollbarVisibility: scrollbarVisibility,
      offset: offset,
    );

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      removeLeft: true,
      removeRight: true,
      child: Builder(
        builder: (BuildContext context) {
          return CustomSingleChildLayout(
            delegate: _DropdownMenuRouteLayout<T>(
              buttonRect: buttonRect,
              route: route,
              textDirection: textDirection,
              itemHeight: itemHeight,
              itemWidth: itemWidth,
              offset: offset,
            ),
            child: capturedThemes.wrap(menu),
          );
        },
      ),
    );
  }
}

class _MenuItem<T> extends SingleChildRenderObjectWidget {
  const _MenuItem({
    Key? key,
    required this.onLayout,
    required this.item,
  }) : super(key: key, child: item);

  final ValueChanged<Size> onLayout;
  final DropdownMenuItem<T>? item;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderMenuItem(onLayout);
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant _RenderMenuItem renderObject) {
    renderObject.onLayout = onLayout;
  }
}

class _RenderMenuItem extends RenderProxyBox {
  _RenderMenuItem(this.onLayout, [RenderBox? child]) : super(child);

  ValueChanged<Size> onLayout;

  @override
  void performLayout() {
    super.performLayout();
    onLayout(size);
  }
}

class _DropdownMenuItemContainer extends StatelessWidget {
  /// Creates an item for a dropdown menu.
  ///
  /// The [child] argument is required.
  const _DropdownMenuItemContainer({
    Key? key,
    this.alignment = AlignmentDirectional.centerStart,
    required this.child,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  ///
  /// Typically a [Text] widget.
  final Widget child;

  /// Defines how the item is positioned within the container.
  ///
  /// This property must not be null. It defaults to [AlignmentDirectional.centerStart].
  ///
  /// See also:
  ///
  ///  * [Alignment], a class with convenient constants typically used to
  ///    specify an [AlignmentGeometry].
  ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
  ///    relative to text direction.
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: _theme.dropdownMenuItemHeight),
      alignment: alignment,
      child: child,
    );
  }
}

class TltDropdownButton<T> extends StatefulWidget {
  ///The height of the button.
  // final double? buttonHeight;

  ///The width of the button
  final double? buttonWidth;

  ///The inner padding of the Button
  final EdgeInsetsGeometry? buttonPadding;

  ///The decoration of the Button
  final BoxDecoration? buttonDecoration;

  ///The padding of menu items
  final EdgeInsetsGeometry? itemPadding;

  ///The width of the dropdown menu
  final double? dropdownWidth;

  ///The inner padding of the dropdown menu
  final EdgeInsetsGeometry? dropdownPadding;

  ///The decoration of the dropdown menu
  final BoxDecoration? dropdownDecoration;

  ///The highlight color of the current selected item
  final Color? selectedItemColor;

  ///The Hover color of the all dropdown item
  final Color? itemHoverColor;

  ///Always show the scrollbar even when a scroll is not underway
  final TltVisibility? scrollbarVisibility;

  ///Changes the position of the dropdown menu
  final Offset? offset;

  ///Uses custom widget like icon,image,etc.. instead of the default button
  final Widget? customButton;

  ///Shows different icon when dropdown menu open
  final Widget? iconOnClick;

  ///Called when the dropdown menu is opened or closed.
  final void Function(bool isOpen)? onMenuStateChange;

  final List<DropdownMenuItem<T>>? items;

  final T? value;

  final Widget? hint;

  final Widget? disabledHint;

  final ValueChanged<T?>? onChanged;

  final DropdownButtonBuilder? selectedItemBuilder;

  final TextStyle? style;

  final Widget? underline;

  final Widget? icon;

  final Color? iconDisabledColor;

  final Color? iconEnabledColor;

  final double iconSize;

  final bool isDense;

  final bool isExpanded;

  final double itemHeight;

  /// The color for the button's [Material] when it has the input focus.
  final Color? focusColor;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  final double? dropdownMaxHeight;

  final bool? enableFeedback;

  final AlignmentGeometry alignment;

  final bool enabled;

  final VoidCallback? onTap;

  TltDropdownButton({
    Key? key,
    this.onTap,
    required this.items,
    this.selectedItemBuilder,
    this.value,
    this.hint,
    this.disabledHint,
    required this.onChanged,
    this.style,
    this.underline,
    this.icon,
    this.iconOnClick,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.iconSize = 20,
    this.isDense = false,
    this.isExpanded = false,
    double? itemHeight,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
    this.dropdownMaxHeight,
    this.enableFeedback,
    this.alignment = AlignmentDirectional.centerStart,
    // this.buttonHeight,
    this.buttonWidth,
    EdgeInsetsGeometry? buttonPadding,
    this.buttonDecoration,
    this.itemPadding,
    this.dropdownWidth,
    this.dropdownPadding,
    BoxDecoration? dropdownDecoration,
    this.selectedItemColor,
    this.itemHoverColor,
    this.scrollbarVisibility,
    this.offset,
    this.customButton,
    this.onMenuStateChange,
    this.enabled = true,
  })  : assert(
          items == null ||
              items.isEmpty ||
              value == null ||
              items.where((DropdownMenuItem<T> item) {
                    return item.value == value;
                  }).length ==
                  1,
          "There should be exactly one item with [DropdownButton]'s value: "
          '$value. \n'
          'Either zero or 2 or more [DropdownMenuItem]s were detected '
          'with the same value',
        ),
        buttonPadding = buttonPadding ?? _theme.dropdownPadding,
        itemHeight = itemHeight ?? _theme.dropdownMenuItemHeight,
        dropdownDecoration = dropdownDecoration ?? _defaultDropDownDecoration,
        _inputDecoration = null,
        _isEmpty = false,
        super(key: key);

  TltDropdownButton._formField({
    Key? key,
    this.onTap,
    required this.items,
    this.selectedItemBuilder,
    this.value,
    this.hint,
    this.disabledHint,
    required this.onChanged,
    this.onMenuStateChange,
    this.style,
    this.underline,
    this.icon,
    this.iconOnClick,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.iconSize = 20,
    this.isDense = false,
    this.isExpanded = false,
    double? itemHeight,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
    this.dropdownMaxHeight,
    this.enableFeedback,
    this.alignment = AlignmentDirectional.centerStart,
    // this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.itemPadding,
    this.dropdownWidth,
    this.dropdownPadding,
    BoxDecoration? dropdownDecoration,
    this.selectedItemColor,
    this.itemHoverColor,
    this.scrollbarVisibility,
    this.offset,
    this.customButton,
    required TltInputDecoration inputDecoration,
    required bool isEmpty,
    this.enabled = true,
  })  : assert(
          items == null ||
              items.isEmpty ||
              value == null ||
              items.where((DropdownMenuItem<T> item) {
                    return item.value == value;
                  }).length ==
                  1,
          "There should be exactly one item with [DropdownButtonFormField]'s value: "
          '$value. \n'
          'Either zero or 2 or more [DropdownMenuItem]s were detected '
          'with the same value',
        ),
        dropdownDecoration = dropdownDecoration ?? _defaultDropDownDecoration,
        itemHeight = itemHeight ?? _theme.dropdownMenuItemHeight,
        _inputDecoration = inputDecoration,
        _isEmpty = isEmpty,
        super(key: key);

  final TltInputDecoration? _inputDecoration;
  final bool _isEmpty;

  @override
  State<TltDropdownButton<T>> createState() => _TltDropdownButtonState<T>();
}

class _TltDropdownButtonState<T> extends State<TltDropdownButton<T>>
    with WidgetsBindingObserver {
  int? _selectedIndex;
  _DropdownRoute<T>? _dropdownRoute;
  Orientation? _lastOrientation;
  FocusNode? _internalNode;

  FocusNode? get focusNode => widget.focusNode ?? _internalNode;
  bool _hasPrimaryFocus = false;
  late Map<Type, Action<Intent>> _actionMap;
  bool _isMenuOpen = false;

  // Only used if needed to create _internalNode.
  FocusNode _createFocusNode() =>
      FocusNode(debugLabel: '${widget.runtimeType}');

  @override
  void initState() {
    super.initState();
    _updateSelectedIndex();
    if (widget.focusNode == null) {
      _internalNode ??= _createFocusNode();
    }
    _actionMap = <Type, Action<Intent>>{
      ActivateIntent: CallbackAction<ActivateIntent>(
        onInvoke: (ActivateIntent intent) => _handleTap(),
      ),
      ButtonActivateIntent: CallbackAction<ButtonActivateIntent>(
        onInvoke: (ButtonActivateIntent intent) => _handleTap(),
      ),
    };
    focusNode!.addListener(_handleFocusChanged);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _removeDropdownRoute();
    focusNode!.removeListener(_handleFocusChanged);
    _internalNode?.dispose();
    super.dispose();
  }

  void _removeDropdownRoute() {
    _dropdownRoute?._dismiss();
    _dropdownRoute = null;
    _lastOrientation = null;
  }

  void _handleFocusChanged() {
    if (_hasPrimaryFocus != focusNode!.hasPrimaryFocus) {
      setState(() {
        _hasPrimaryFocus = focusNode!.hasPrimaryFocus;
      });
    }
  }

  @override
  void didUpdateWidget(TltDropdownButton<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.focusNode != oldWidget.focusNode) {
      oldWidget.focusNode?.removeListener(_handleFocusChanged);
      if (widget.focusNode == null) {
        _internalNode ??= _createFocusNode();
      }
      _hasPrimaryFocus = focusNode!.hasPrimaryFocus;
      focusNode!.addListener(_handleFocusChanged);
    }
    _updateSelectedIndex();
  }

  void _updateSelectedIndex() {
    if (widget.items == null ||
        widget.items!.isEmpty ||
        (widget.value == null &&
            widget.items!
                .where((DropdownMenuItem<T> item) =>
                    item.enabled && item.value == widget.value)
                .isEmpty)) {
      _selectedIndex = null;
      return;
    }

    assert(widget.items!
            .where((DropdownMenuItem<T> item) => item.value == widget.value)
            .length ==
        1);
    for (int itemIndex = 0; itemIndex < widget.items!.length; itemIndex++) {
      if (widget.items![itemIndex].value == widget.value) {
        _selectedIndex = itemIndex;
        return;
      }
    }
  }

  TextStyle get _textStyle => widget.style ?? _theme.dropdownStyle;

  void _handleTap() {
    final TextDirection? textDirection = Directionality.maybeOf(context);
    const EdgeInsetsGeometry menuMargin = EdgeInsets.zero;

    final List<_MenuItem<T>> menuItems = <_MenuItem<T>>[
      for (int index = 0; index < widget.items!.length; index += 1)
        _MenuItem<T>(
          item: widget.items![index],
          onLayout: (Size size) {
            // If [_dropdownRoute] is null and onLayout is called, this means
            // that performLayout was called on a _DropdownRoute that has not
            // left the widget tree but is already on its way out.
            //
            // Since onLayout is used primarily to collect the desired heights
            // of each menu item before laying them out, not having the _DropdownRoute
            // collect each item's height to lay out is fine since the route is
            // already on its way out.
            if (_dropdownRoute == null) return;

            _dropdownRoute!.itemHeights[index] = size.height;
          },
        ),
    ];

    // final NavigatorState navigator =
    //     Navigator.of(context, rootNavigator: widget.dropdownFullScreen);
    final NavigatorState navigator = Navigator.of(context);
    assert(_dropdownRoute == null);
    final RenderBox itemBox = context.findRenderObject()! as RenderBox;
    final Rect itemRect = itemBox.localToGlobal(Offset.zero,
            ancestor: navigator.context.findRenderObject()) &
        itemBox.size;
    _dropdownRoute = _DropdownRoute<T>(
      items: menuItems,
      buttonRect: menuMargin.resolve(textDirection).inflateRect(itemRect),
      padding:
          widget.itemPadding ?? _theme.dropdownPadding.resolve(textDirection),
      selectedIndex: _selectedIndex ?? 0,
      isNoSelectedItem: _selectedIndex == null,
      selectedItemColor: widget.selectedItemColor ?? TltColors.blue[100],
      capturedThemes:
          InheritedTheme.capture(from: context, to: navigator.context),
      style: _textStyle,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      enableFeedback: widget.enableFeedback ?? true,
      itemHeight: widget.itemHeight,
      itemWidth: widget.dropdownWidth,
      menuMaxHeight: widget.dropdownMaxHeight,
      dropdownDecoration: widget.dropdownDecoration,
      dropdownPadding: widget.dropdownPadding,
      scrollbarVisibility: widget.scrollbarVisibility,
      offset: widget.offset ?? const Offset(0, -5),
    );

    _isMenuOpen = true;
    focusNode?.requestFocus();
    navigator
        .push(_dropdownRoute!)
        .then<void>((_DropdownRouteResult<T>? newValue) {
      _removeDropdownRoute();
      _isMenuOpen = false;
      widget.onMenuStateChange?.call(false);
      if (!mounted || newValue == null) return;
      widget.onChanged?.call(newValue.result);
    });

    widget.onMenuStateChange?.call(true);

    widget.onTap?.call();
  }

  // double get _denseButtonHeight {
  //   final double fontSize = _textStyle.fontSize ?? TltStyles.body1.fontSize!;
  //   return math.max(
  //       fontSize, math.max(widget.iconSize, _defaultDenseButtonHeight));
  // }

  Color get _iconColor {
    if (_enabled) {
      if (widget.iconEnabledColor != null) return widget.iconEnabledColor!;

      switch (Theme.of(context).brightness) {
        case Brightness.light:
          return Colors.grey.shade700;
        case Brightness.dark:
          return Colors.white70;
      }
    } else {
      if (widget.iconDisabledColor != null) return widget.iconDisabledColor!;

      switch (Theme.of(context).brightness) {
        case Brightness.light:
          return Colors.grey.shade400;
        case Brightness.dark:
          return Colors.white10;
      }
    }
  }

  bool get _enabled =>
      widget.items != null &&
      widget.items!.isNotEmpty &&
      widget.onChanged != null &&
      widget.enabled;

  Orientation _getOrientation(BuildContext context) {
    Orientation? result = MediaQuery.maybeOf(context)?.orientation;
    if (result == null) {
      // If there's no MediaQuery, then use the window aspect to determine
      // orientation.
      final Size size = PlatformDispatcher.instance.views.first.physicalSize;
      result = size.width > size.height
          ? Orientation.landscape
          : Orientation.portrait;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final Orientation newOrientation = _getOrientation(context);
    _lastOrientation ??= newOrientation;
    if (newOrientation != _lastOrientation) {
      _removeDropdownRoute();
      _lastOrientation = newOrientation;
    }

    // The width of the button and the menu are defined by the widest
    // item and the width of the hint.
    // We should explicitly type the items list to be a list of <Widget>,
    // otherwise, no explicit type adding items maybe trigger a crash/failure
    // when hint and selectedItemBuilder are provided.
    final List<Widget> items = widget.selectedItemBuilder == null
        ? (widget.items != null ? List<Widget>.of(widget.items!) : <Widget>[])
        : List<Widget>.of(widget.selectedItemBuilder!(context));

    int? hintIndex;
    if (widget.hint != null || (!_enabled && widget.disabledHint != null)) {
      Widget displayedHint =
          _enabled ? widget.hint! : widget.disabledHint ?? widget.hint!;
      if (widget.selectedItemBuilder == null) {
        displayedHint = _DropdownMenuItemContainer(
          alignment: widget.alignment,
          child: displayedHint,
        );
      }

      hintIndex = items.length;
      items.add(DefaultTextStyle(
        style: _textStyle.copyWith(color: Theme.of(context).hintColor),
        child: IgnorePointer(
          ignoring: false,
          child: displayedHint,
        ),
      ));
    }

    final EdgeInsetsGeometry padding = ButtonTheme.of(context).alignedDropdown
        ? _defaultAlignedButtonPadding
        : _defaultUnalignedButtonPadding;

    // If value is null (then _selectedIndex is null) then we
    // display the hint or nothing at all.
    final Widget innerItemsWidget;
    if (items.isEmpty) {
      innerItemsWidget = Container();
    } else {
      innerItemsWidget = IndexedStack(
        index: _selectedIndex ?? hintIndex,
        alignment: widget.alignment,
        children: widget.isDense
            ? items
            : items.map((Widget item) {
                return SizedBox(height: widget.itemHeight, child: item);
              }).toList(),
      );
    }

    const Icon defaultIconOnClick = Icon(TltIcons.chevron_up);
    const Icon defaultIcon = Icon(TltIcons.chevron_down);

    Widget result = DefaultTextStyle(
      style: _enabled
          ? _textStyle
          : _textStyle.copyWith(color: TltColors.gray[300]),
      child: widget.customButton ??
          Container(
            decoration: widget.buttonDecoration, // mine
            padding: widget.buttonPadding ??
                padding.resolve(Directionality.of(context)),
            // height:
            //     // widget.buttonHeight ??
            //     widget.isDense
            //         ? _denseButtonHeight
            //         : _theme.dropdownButtonHeight,
            width: widget.buttonWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (widget.isExpanded)
                  Expanded(child: innerItemsWidget)
                else
                  innerItemsWidget,
                IconTheme(
                  data: IconThemeData(
                    color: _iconColor,
                    size: widget.iconSize,
                  ),
                  child: _isMenuOpen
                      ? widget.iconOnClick ?? defaultIconOnClick
                      : widget.icon ?? defaultIcon,
                ),
              ],
            ),
          ),
    );

    /// this feature is unused temporally do not remove the commanded line
    // if (!DropdownButtonHideUnderline.at(context) &&
    //     widget.buttonDecoration?.borderRadius == null) {
    //   final double bottom = widget.isDense ? 0.0 : 8.0;
    //   result = Stack(
    //     children: <Widget>[
    //       result,
    //       Positioned(
    //         left: 0.0,
    //         right: 0.0,
    //         bottom: bottom,
    //         child: widget.underline ??
    //             Container(
    //               height: 1.0,
    //               decoration: const BoxDecoration(
    //                 border: Border(
    //                   bottom: BorderSide(
    //                     color: Color(0xFFBDBDBD),
    //                     width: 0.0,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //       ),
    //     ],
    //   );
    // }

    final MouseCursor effectiveMouseCursor =
        MaterialStateProperty.resolveAs<MouseCursor>(
      MaterialStateMouseCursor.clickable,
      <MaterialState>{
        if (!_enabled) MaterialState.disabled,
      },
    );

    if (widget._inputDecoration != null) {
      TltInputDecoration localInputDecoration = _getEffectiveInputDecoration();
      result = SizedBox(
        width: widget.isExpanded ? double.infinity : widget.buttonWidth,
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            if (localInputDecoration.addOnBefore != null)
              _addOnBuilder(
                child: localInputDecoration.addOnBefore!,
                decoration: localInputDecoration.addOnBeforeDecoration,
                defaultBorderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
            Expanded(
              child: InputDecorator(
                decoration: localInputDecoration,
                isEmpty: widget._isEmpty,
                isFocused: _isMenuOpen,
                child: result,
              ),
            ),
            if (localInputDecoration.addOnAfter != null)
              _addOnBuilder(
                child: localInputDecoration.addOnAfter!,
                decoration: localInputDecoration.addOnAfterDecoration,
                defaultBorderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
          ],
        ),
      );
    }

    getInkwellColors() {
      return (widget._inputDecoration != null || widget.customButton != null)
          ? Colors.transparent
          : null;
    }

    return Semantics(
      button: true,
      child: Actions(
        actions: _actionMap,
        child: InkWell(
          splashColor: getInkwellColors(),
          hoverColor: getInkwellColors(),
          highlightColor: getInkwellColors(),
          mouseCursor: effectiveMouseCursor,
          onTap: _enabled ? _handleTap : null,
          canRequestFocus: _enabled,
          focusNode: focusNode,
          autofocus: widget.autofocus,
          focusColor: getInkwellColors() ??
              widget.focusColor ??
              Theme.of(context).focusColor,
          enableFeedback: false,
          borderRadius: widget.buttonDecoration?.borderRadius
              ?.resolve(Directionality.of(context)),
          child: result,
        ),
      ),
    );
  }

  _getEffectiveInputDecoration() {
    TltInputDecoration effectiveDecoration =
        widget._inputDecoration ?? TltInputDecoration();

    if (widget._inputDecoration?.addOnBefore != null &&
        widget._inputDecoration?.addOnAfter != null) {
      return effectiveDecoration.copyWith(
        border: OutlineInputBorder(
          borderSide: effectiveDecoration.border!.borderSide,
          borderRadius: BorderRadius.zero,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.enabledBorder!.borderSide,
          borderRadius: BorderRadius.zero,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.focusedBorder!.borderSide,
          borderRadius: BorderRadius.zero,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.errorBorder!.borderSide,
          borderRadius: BorderRadius.zero,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.focusedErrorBorder!.borderSide,
          borderRadius: BorderRadius.zero,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.disabledBorder!.borderSide,
          borderRadius: BorderRadius.zero,
        ),
      );
    } else if (widget._inputDecoration?.addOnBefore != null &&
        widget._inputDecoration?.addOnAfter == null) {
      return effectiveDecoration.copyWith(
        border: OutlineInputBorder(
          borderSide: effectiveDecoration.border!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.circular(8),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.enabledBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.circular(8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.focusedBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.circular(8),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.errorBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.circular(8),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.focusedErrorBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.circular(8),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.disabledBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.circular(8),
          ),
        ),
      );
    } else if (widget._inputDecoration?.addOnBefore == null &&
        widget._inputDecoration?.addOnAfter != null) {
      return effectiveDecoration.copyWith(
        border: OutlineInputBorder(
          borderSide: effectiveDecoration.border!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(8),
            right: Radius.zero,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.enabledBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(8),
            right: Radius.zero,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.focusedBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(8),
            right: Radius.zero,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.errorBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(8),
            right: Radius.zero,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.focusedErrorBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(8),
            right: Radius.zero,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.disabledBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(8),
            right: Radius.zero,
          ),
        ),
      );
    }
    return effectiveDecoration;
  }

  Container _addOnBuilder({
    required Widget child,
    required TltAddOnDecoration? decoration,
    required BorderRadius defaultBorderRadius,
  }) {
    return Container(
      alignment: Alignment.center,
      padding: decoration?.padding ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: decoration?.fillColor ?? TltColors.white,
        border: decoration?.border,
        borderRadius: decoration?.borderRadius ?? defaultBorderRadius,
      ),
      height: widget._inputDecoration?.relativeAddOnHeight,
      child: child,
      // constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
    );
  }
}

class TltDropdownButtonFormField<T> extends FormField<T> {
  TltDropdownButtonFormField({
    Key? key,
    required List<DropdownMenuItem<T>>? items,
    DropdownButtonBuilder? selectedItemBuilder,
    T? value,
    Widget? hint,
    Widget? disabledHint,
    this.onChanged,
    TextStyle? style,
    Widget? icon,
    Widget? iconOnClick,
    Color? iconDisabledColor,
    Color? iconEnabledColor,
    double iconSize = 20,
    bool isDense = true,
    bool isExpanded = false,
    double? itemHeight,
    Color? focusColor = TltColors.transparent,
    FocusNode? focusNode,
    bool autofocus = false,
    TltInputDecoration? decoration,
    FormFieldSetter<T>? onSaved,
    FormFieldValidator<T>? validator,
    AutovalidateMode? autoValidateMode,
    double? dropdownMaxHeight,
    bool? enableFeedback,
    // AlignmentGeometry alignment = AlignmentDirectional.centerStart,
    double? buttonHeight,
    double? buttonWidth,
    EdgeInsetsGeometry? buttonPadding,
    BoxDecoration? buttonDecoration,
    EdgeInsetsGeometry? itemPadding,
    double? dropdownWidth,
    EdgeInsetsGeometry? dropdownPadding,
    BoxDecoration? dropdownDecoration,
    Color? selectedItemColor,
    TltVisibility? scrollbarVisibility,
    Offset? offset,
    // Widget? customButton,
    void Function(bool isOpen)? onMenuStateChange,
  })  : assert(
          items == null ||
              items.isEmpty ||
              value == null ||
              items.where((DropdownMenuItem<T> item) {
                    return item.value == value;
                  }).length ==
                  1,
          "There should be exactly one item with [DropdownButton]'s value: "
          '$value. \n'
          'Either zero or 2 or more [DropdownMenuItem]s were detected '
          'with the same value',
        ),
        decoration = decoration ??
            TltInputDecoration(
              focusColor: focusColor,
              hoverColor: TltColors.transparent,
            ),
        super(
          key: key,
          onSaved: onSaved,
          initialValue: value,
          validator: validator,
          autovalidateMode: autoValidateMode ?? AutovalidateMode.disabled,
          builder: (FormFieldState<T> field) {
            final _DropdownButtonFormFieldState<T> state =
                field as _DropdownButtonFormFieldState<T>;
            final TltInputDecoration decorationArg = decoration ??
                TltInputDecoration(
                  focusColor: focusColor,
                  hoverColor: TltColors.transparent,
                );
            final TltInputDecoration effectiveDecoration = decorationArg;
            //   .applyDefaults(
            // Theme.of(field.context).inputDecorationTheme,
            // );

            final bool showSelectedItem = items != null &&
                items
                    .where(
                        (DropdownMenuItem<T> item) => item.value == state.value)
                    .isNotEmpty;
            bool isHintOrDisabledHintAvailable() {
              final bool isDropdownDisabled =
                  onChanged == null || (items == null || items.isEmpty);
              if (isDropdownDisabled) {
                return hint != null || disabledHint != null;
              } else {
                return hint != null;
              }
            }

            final bool isEmpty =
                !showSelectedItem && !isHintOrDisabledHintAvailable();

            return Focus(
              canRequestFocus: false,
              skipTraversal: true,
              child: Builder(
                builder: (BuildContext context) {
                  return DropdownButtonHideUnderline(
                    child: TltDropdownButton._formField(
                      items: items,
                      selectedItemBuilder: selectedItemBuilder,
                      value: state.value,
                      hint: hint,
                      disabledHint: disabledHint,
                      onChanged: onChanged == null ? null : state.didChange,
                      style: style,
                      icon: icon,
                      iconOnClick: iconOnClick,
                      iconDisabledColor: iconDisabledColor,
                      iconEnabledColor: iconEnabledColor,
                      iconSize: iconSize,
                      isDense: isDense,
                      isExpanded: isExpanded,
                      itemHeight: itemHeight,
                      focusColor: focusColor,
                      focusNode: focusNode,
                      autofocus: autofocus,
                      dropdownMaxHeight: dropdownMaxHeight,
                      enableFeedback: enableFeedback,
                      // alignment: alignment,
                      // buttonHeight: buttonHeight,
                      buttonWidth: buttonWidth,
                      buttonPadding: buttonPadding,
                      buttonDecoration: buttonDecoration,
                      itemPadding: itemPadding,
                      dropdownWidth: dropdownWidth,
                      dropdownPadding: dropdownPadding,
                      dropdownDecoration: dropdownDecoration,
                      selectedItemColor: selectedItemColor,
                      scrollbarVisibility: scrollbarVisibility,
                      offset: offset,
                      // customButton: customButton,
                      onMenuStateChange: onMenuStateChange,
                      inputDecoration: effectiveDecoration.copyWith(
                        errorText: field.errorText,
                        hoverColor: TltColors.transparent,
                      ),
                      isEmpty: isEmpty,
                    ),
                  );
                },
              ),
            );
          },
        );

  /// {@macro flutter.material.dropdownButton.onChanged}
  final ValueChanged<T?>? onChanged;

  final TltInputDecoration decoration;

  @override
  FormFieldState<T> createState() => _DropdownButtonFormFieldState<T>();
}

class _DropdownButtonFormFieldState<T> extends FormFieldState<T> {
  @override
  void didChange(T? value) {
    super.didChange(value);
    final TltDropdownButtonFormField<T> dropdownButtonFormField =
        widget as TltDropdownButtonFormField<T>;
    assert(dropdownButtonFormField.onChanged != null);
    dropdownButtonFormField.onChanged!(value);
  }

  @override
  void didUpdateWidget(TltDropdownButtonFormField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      setValue(widget.initialValue);
    }
  }
}
