import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tlt_design/src/foundations/colors.dart';
import 'package:tlt_design/src/foundations/theme.dart';
import 'package:tlt_design/src/utils/icons.dart';
import 'package:tlt_design/src/utils/properties.dart';

/// TltPagination widget is used for navigating between screens. It requires three parameters:
/// 1) total pages: Total number of pages in the pagination.
/// 2) current page: The current active page.
/// 3) onTap: Callback function triggered when a page is tapped.
///
/// This pagination component adapts its state based on the provided parameters.
/// If total pages is received from the backend, the widget updates its state accordingly to activate the appropriate page.
/// If no data is provided, the widget automatically manages its state.
///
/// Customization options include:
/// - Active and inactive decoration for pagination items.
/// - Widgets and decorations for previous and next buttons.
/// - Ability to skip forward or backward by five pages.
///
/// developers can customize the pagination according to their specific requirements,
/// adjusting decorations, button widgets, and skip page functionality as needed.
class TltPagination extends StatefulWidget {
  static final TltTheme _theme = TltTheme.instance;
  TltPagination({
    required this.currentPage,
    required this.totalPages,
    required this.onTap,
    BoxDecoration? activePageIndicatorDecoration,
    BoxDecoration? inactivePageIndicatorDecoration,
    BoxShape? pageIndicatorShape,
    BorderRadius? indicatorBorderRadius,
    BoxDecoration? navigationButtonDecoration,
    this.previousButtonWidget,
    this.nextButtonWidget,
    TltPaginationSize? paginationSize,
    Alignment? paginationAlignment,
    double? indicatorHeight,
    double? indicatorWidth,
    TltPaginationType? paginationType,
    this.selectedColor,
    this.unSelectedColor,
    TextStyle? activePageNumberStyle,
    TextStyle? inActivePageNumberStyle,
    Key? key,
    EdgeInsets? indicatorPadding,
    TltPageSkipType? pageSkipType,
  })  : assert(!(totalPages < 1), "total pages must be at least 1"),
        assert(
            !(paginationType == TltPaginationType.cardButton &&
                paginationSize == TltPaginationSize.expanded),
            "cardButton cannot be used in expanded view"),
        assert(!(onTap.length != totalPages),
            "onTap length and total pages must be equal"),
        assert(
            !(indicatorBorderRadius != null &&
                paginationType == TltPaginationType.cardButton),
            "cannot apply borderRadius for cardButton type"),
        assert(
            !(indicatorBorderRadius != null &&
                pageIndicatorShape == BoxShape.circle),
            "cannot apply borderRadius for circular pageIndicator"),
        assert((totalPages >= currentPage),
            "current page must be less than or equal to total pages "),
        activePageIndicatorDecoration = activePageIndicatorDecoration != null
            ? activePageIndicatorDecoration.copyWith(
                borderRadius: pageIndicatorShape != BoxShape.circle
                    ? indicatorBorderRadius ??
                        (paginationType == TltPaginationType.cardButton
                            ? BorderRadius.circular(0)
                            : _theme.paginationIndicatorBorderRadius)
                    : null,
                shape: pageIndicatorShape ?? _theme.paginationIndicatorShape,
                color: paginationType != TltPaginationType.cardButton
                    ? activePageIndicatorDecoration.color ??
                        _theme.paginationActivePageIndicatorMinimalDecoration
                            .color
                    : activePageIndicatorDecoration.color ??
                        _theme.paginationActivePageIndicatorCardButtonDecoration
                            .color)
            : (paginationType != TltPaginationType.cardButton
                ? _theme.paginationActivePageIndicatorMinimalDecoration
                    .copyWith(
                    shape:
                        pageIndicatorShape ?? _theme.paginationIndicatorShape,
                    borderRadius: pageIndicatorShape != BoxShape.circle
                        ? indicatorBorderRadius ??
                            _theme.paginationIndicatorBorderRadius
                        : null,
                  )
                : _theme.paginationActivePageIndicatorCardButtonDecoration
                    .copyWith(
                    shape:
                        pageIndicatorShape ?? _theme.paginationIndicatorShape,
                    borderRadius: pageIndicatorShape != BoxShape.circle
                        ? indicatorBorderRadius
                        : null,
                  )),
        inactivePageIndicatorDecoration = inactivePageIndicatorDecoration !=
                null
            ? inactivePageIndicatorDecoration.copyWith(
                borderRadius: pageIndicatorShape != BoxShape.circle
                    ? indicatorBorderRadius ??
                        (paginationType == TltPaginationType.cardButton
                            ? BorderRadius.circular(0)
                            : _theme.paginationIndicatorBorderRadius)
                    : null,
                shape: pageIndicatorShape ?? _theme.paginationIndicatorShape,
                color: paginationType != TltPaginationType.cardButton
                    ? inactivePageIndicatorDecoration.color ??
                        _theme.paginationInactivePageIndicatorMinimalDecoration
                            .color
                    : inactivePageIndicatorDecoration.color ??
                        _theme
                            .paginationInactivePageIndicatorCardButtonDecoration
                            .color)
            : (paginationType != TltPaginationType.cardButton
                ? _theme.paginationInactivePageIndicatorMinimalDecoration
                    .copyWith(
                    shape:
                        pageIndicatorShape ?? _theme.paginationIndicatorShape,
                    borderRadius: pageIndicatorShape != BoxShape.circle
                        ? indicatorBorderRadius ??
                            _theme.paginationIndicatorBorderRadius
                        : null,
                  )
                : _theme.paginationInactivePageIndicatorCardButtonDecoration
                    .copyWith(
                    shape:
                        pageIndicatorShape ?? _theme.paginationIndicatorShape,
                    borderRadius: pageIndicatorShape != BoxShape.circle
                        ? indicatorBorderRadius
                        : null,
                  )),
        pageIndicatorShape =
            pageIndicatorShape ?? _theme.paginationIndicatorShape,
        indicatorBorderRadius =
            indicatorBorderRadius ?? _theme.paginationIndicatorBorderRadius,
        navigationButtonDecoration = navigationButtonDecoration != null
            ? navigationButtonDecoration.copyWith(
                color: navigationButtonDecoration.color ??
                    _theme.paginationNavigationButtonDecoration.color,
                border: navigationButtonDecoration.border ??
                    _theme.paginationNavigationButtonDecoration.border,
                borderRadius: navigationButtonDecoration.borderRadius ??
                    _theme.paginationNavigationButtonDecoration.borderRadius,
              )
            : paginationType == TltPaginationType.cardButton
                ? null
                : _theme.paginationNavigationButtonDecoration,
        paginationSize = paginationSize ??
            (paginationType != TltPaginationType.cardButton
                ? _theme.paginationSize
                : TltPaginationSize.compact),
        paginationAlignment = paginationAlignment ?? _theme.paginationAlignment,
        paginationType = paginationType ?? _theme.paginationType,
        indicatorHeight = indicatorHeight ?? _theme.paginationElementHeight,
        indicatorWidth = indicatorWidth ?? _theme.paginationElementWidth,
        activePageNumberStyle = activePageNumberStyle != null
            ? activePageNumberStyle.copyWith(
                color: paginationType != TltPaginationType.cardButton
                    ? activePageNumberStyle.color ?? TltColors.white
                    : null,
                fontWeight: activePageNumberStyle.fontWeight ??
                    _theme.paginationActiveLabelStyle.fontWeight,
              )
            : _theme.paginationActiveLabelStyle.copyWith(
                color: paginationType != TltPaginationType.cardButton
                    ? TltColors.white
                    : null,
              ),
        inActivePageNumberStyle =
            inActivePageNumberStyle ?? _theme.paginationInActiveLabelStyle,
        indicatorPadding =
            indicatorPadding ?? const EdgeInsets.symmetric(horizontal: 3),
        pageSkipType = pageSkipType ?? _theme.pageSkipType,
        super(key: key);

  final int currentPage;
  final int totalPages;
  final List<VoidCallback> onTap;
  final int numberOfVisibleItems = 15;
  final BoxDecoration activePageIndicatorDecoration;
  final BoxDecoration inactivePageIndicatorDecoration;
  final BoxShape pageIndicatorShape;
  final BoxDecoration? navigationButtonDecoration;
  final BorderRadius indicatorBorderRadius;
  final Widget? previousButtonWidget;
  final Widget? nextButtonWidget;

  /// This variable determines whether the previous and next buttons should be positioned at the end of the screen or not.
  /// /// [TltPaginationSize] has enums [TltPaginationSize.compact] & [TltPaginationSize.expanded]
  final TltPaginationSize paginationSize;
  final Alignment paginationAlignment;

  /// This variable sets the width of the navigation buttons.
  final double indicatorWidth;

  /// This variable sets the height of the navigation buttons.
  final double indicatorHeight;

  /// Pagination type represents whether the pagination should be displayed as a card or minimal.
  /// [TltPaginationType] has enums [TltPaginationType.minimal] & [TltPaginationType.cardButton]
  final TltPaginationType paginationType;
  final Color? selectedColor;
  final Color? unSelectedColor;

  /// TextStyle for the active page text
  final TextStyle activePageNumberStyle;

  /// TextStyle for the in active page text
  final TextStyle inActivePageNumberStyle;
  final EdgeInsets indicatorPadding;

  /// Page skip type represents whether to display ellipses or arrows.
  /// [TltPageSkipType] has enums [TltPageSkipType.none] and [TltPageSkipType.arrow],
  /// which are used to navigate to the next and previous 5 pages.
  final TltPageSkipType pageSkipType;

  @override
  State<TltPagination> createState() => _TltPaginationState();
}

class _TltPaginationState extends State<TltPagination> {
  late int activeIndex;

  late int _startIndex;
  late int _endIndex;

  late List _displayList;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  void didUpdateWidget(TltPagination oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentPage != widget.currentPage ||
        oldWidget.totalPages != widget.totalPages) {
      _initialize();
    }
  }

  void _initialize() {
    /// Condition to load the display list when the current page is between 1 and 5.
    /// Condition to load the display list without the last ellipses.
    /// When the current index is between total page and total page - 5.
    /// Condition to load the display list when none of the above conditions are met.
    _startIndex = widget.currentPage <= 5
        ? 2
        : widget.currentPage >= widget.totalPages - 4
            ? widget.totalPages - 5
            : widget.currentPage - 2;

    /// Condition to load the display list when the current page is between 1 and 5.
    /// Condition to load the display list without the last ellipses.
    /// When the current index is between total page and total page - 5.
    /// Condition to load the display list when none of the above conditions are met.
    _endIndex = widget.currentPage <= 5
        ? min(7, widget.totalPages)
        : widget.currentPage >= widget.totalPages - 4
            ? widget.totalPages
            : widget.currentPage + 3;

    _displayList = getDisplayList(_startIndex, _endIndex);
    setState(() {
      activeIndex = widget.currentPage;
    });
  }

  /// Builds the list to display on the frontend.
  List getDisplayList(
    int index1,
    int index2,
  ) {
    List list = [];
    for (int i = 0; i < widget.totalPages; i++) {
      list += [i];
    }

    return widget.totalPages.bitLength > 1
        ? [list[0]] +
            list.sublist(
              index1 - 1,
              index2 - 1,
            ) +
            [list[list.length - 1]]
        : [list[0]];
  }

  /// Common function for calculating the next 5 pages and the next page forward position.
  /// Calculates the forward position.
  void nextPageFunction(int activeIndex) {
    if (activeIndex > widget.totalPages - 4) {
      /// Calculates pagination for the last 5 pages.
      _startIndex = max(2, widget.totalPages - 5);
      _endIndex = widget.totalPages;
    } else if (activeIndex >= 5) {
      /// Calculates pagination for pages after the 5th page.
      _startIndex = activeIndex - 2;
      _endIndex = activeIndex + 3;
    } else if (activeIndex < 5) {
      /// Calculates pagination for pages between 1 and 5.
      _startIndex = 2;
      _endIndex = min(7, widget.totalPages);
    } else {
      /// Calculates pagination for pages before the ellipsis when moving forward.
      _startIndex = activeIndex - 2;
      _endIndex = activeIndex + 3;
    }
    _displayList = getDisplayList(_startIndex, _endIndex);
  }

  /// Common function for calculating the pervious 5 pages and the pervious page backward position.
  /// Calculates pagination for backward pages.
  void perviousPageFunction(int activeIndex) {
    if (activeIndex > widget.totalPages - 4) {
      /// Calculates pagination for the last 5 pages.
      _startIndex = max(2, widget.totalPages - 5);
      _endIndex = widget.totalPages;
    } else if (activeIndex >= 5) {
      /// Calculates pagination for pages preceding the 5th page when moving backward.
      _startIndex = activeIndex - 2;
      _endIndex = activeIndex + 3;
    } else if (activeIndex < 5) {
      /// Calculates pagination for pages between 1 and 5.
      _startIndex = 2;
      _endIndex = min(7, widget.totalPages);
    } else {
      /// Calculates pagination for pages after the ellipsis when moving backward.
      _startIndex = activeIndex - 2;
      _endIndex = activeIndex + 3;
    }
    _displayList = getDisplayList(_startIndex, _endIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: widget.paginationSize == TltPaginationSize.compact
          ? MainAxisSize.min
          : MainAxisSize.max,
      mainAxisAlignment: widget.paginationSize == TltPaginationSize.compact
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _NavButton(
          enabled: activeIndex != 1,
          onTap: () {
            setState(() {
              activeIndex--;
              perviousPageFunction(activeIndex);
            });
            widget.onTap[activeIndex - 1]();
          },
          widget: widget,
          icon: Icons.arrow_back,
          text: "Previous",
        ),
        Row(
          children: [
            for (int i in _displayList)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_displayList.length > 1)
                    if (i == _displayList[_displayList.length - 1])
                      if (!(
                          // i == _displayList[_displayList.length - 1] &&
                          i == _displayList[_displayList.length - 2] + 1))
                        widget.pageSkipType == TltPageSkipType.none
                            ? Container(
                                width: widget.indicatorWidth,
                                height: widget.indicatorHeight,
                                padding: widget.indicatorPadding,
                                child: Center(
                                  child: Text(
                                    "...",
                                    style: widget.inActivePageNumberStyle,
                                  ),
                                ),
                              )
                            : InkWell(
                                borderRadius: widget.indicatorBorderRadius,
                                onTap: () {
                                  setState(() {
                                    activeIndex += 5;
                                    nextPageFunction(activeIndex);
                                  });
                                },
                                child: Container(
                                  height: widget.indicatorHeight,
                                  width: widget.indicatorWidth,
                                  decoration: BoxDecoration(
                                    color: widget.unSelectedColor ??
                                        widget.inactivePageIndicatorDecoration
                                            .color,
                                  ),
                                  child: Tooltip(
                                    message: 'Next 5 pages',
                                    child: Center(
                                      child: Icon(
                                        TltIcons.chevrons_right,
                                        color: widget
                                            .inActivePageNumberStyle.color,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                  Container(
                    margin:
                        widget.paginationType == TltPaginationType.cardButton
                            ? null
                            : widget.indicatorPadding,
                    height: widget.indicatorHeight,
                    width: widget.indicatorWidth,
                    decoration: i == activeIndex - 1
                        ? widget.activePageIndicatorDecoration.copyWith(
                            color: widget.selectedColor ??
                                widget.activePageIndicatorDecoration.color,
                          )
                        : widget.inactivePageIndicatorDecoration.copyWith(
                            color: widget.unSelectedColor ??
                                widget.inactivePageIndicatorDecoration.color,
                          ),
                    child: Material(
                      color: TltColors.transparent,
                      child: InkWell(
                        splashColor: TltColors.transparent,
                        highlightColor: TltColors.transparent,
                        hoverColor: i == activeIndex - 1
                            ? widget.activePageIndicatorDecoration.color
                            : Color.alphaBlend(TltColors.white.withOpacity(0.7),
                                widget.activePageIndicatorDecoration.color!),
                        onTap: () {
                          widget.onTap[i]();

                          setState(() {
                            /// Condition is to prevent the on click for the same page multiple time
                            if (activeIndex - 1 != i) {
                              /// Determines the direction of the user's click.
                              /// Returns `true` if the user clicked forward or next page,
                              /// `false` if the user clicked back or previous page.
                              if (activeIndex - 1 < i) {
                                /// Calculates forward pages.
                                if (i >= widget.totalPages - 4) {
                                  /// Calculates pagination for the last 5 pages.
                                  _startIndex = max(2, widget.totalPages - 5);
                                  _endIndex = widget.totalPages;
                                } else if (i > 5) {
                                  /// this calculation is to go forward page after 5th page
                                  _startIndex = i - 1;
                                  _endIndex = i + 4;
                                } else if (i < 4) {
                                  /// Calculates pagination for pages after the 5th page.
                                  _startIndex = 2;
                                  _endIndex = min(7, widget.totalPages);
                                } else {
                                  /// Calculates pagination for pages before the ellipsis when moving forward.
                                  _startIndex = i - 1;
                                  _endIndex = i + 4;
                                }
                                _displayList =
                                    getDisplayList(_startIndex, _endIndex);
                              } else {
                                /// Calculates pagination for backward pages.
                                if (i >= widget.totalPages - 4) {
                                  /// Calculates pagination for the last 5 pages.
                                  _startIndex = max(2, widget.totalPages - 5);
                                  _endIndex = widget.totalPages;
                                } else if (i > 5) {
                                  /// Calculates pagination for pages before the 5th page when moving backward.
                                  _startIndex = i - 1;
                                  _endIndex = i + 4;
                                } else if (i < 4) {
                                  /// Calculates pagination for pages between 1 and 5.
                                  _startIndex = 2;
                                  _endIndex = min(7, widget.totalPages);
                                } else {
                                  /// Calculates pagination for pages after the ellipsis when moving backward.
                                  _startIndex = i - 1;
                                  _endIndex = i + 4;
                                }
                                _displayList =
                                    getDisplayList(_startIndex, _endIndex);
                              }
                            }
                            activeIndex = i + 1;
                          });
                        },
                        customBorder: widget.pageIndicatorShape ==
                                BoxShape.circle
                            ? const CircleBorder()
                            : widget.paginationType ==
                                    TltPaginationType.cardButton
                                ? null
                                : RoundedRectangleBorder(
                                    borderRadius: widget.indicatorBorderRadius,
                                  ),
                        child: Center(
                          child: Text(
                            (i + 1).toString(),
                            style: i == activeIndex - 1
                                ? widget.activePageNumberStyle
                                : widget.inActivePageNumberStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (_displayList.length > 1)
                    if (i == _displayList[0])
                      if (!(i == _displayList[0] && i == _displayList[1] - 1))
                        widget.pageSkipType == TltPageSkipType.none
                            ? Container(
                                width: widget.indicatorWidth,
                                height: widget.indicatorHeight,
                                padding: widget.indicatorPadding,
                                child: Center(
                                  child: Text(
                                    "...",
                                    style: widget.inActivePageNumberStyle,
                                  ),
                                ),
                              )
                            : InkWell(
                                borderRadius: widget.indicatorBorderRadius,
                                onTap: () {
                                  setState(() {
                                    activeIndex -= 5;
                                    perviousPageFunction(activeIndex);
                                  });
                                },
                                child: Container(
                                  height: widget.indicatorHeight,
                                  width: widget.indicatorWidth,
                                  decoration: BoxDecoration(
                                    color: widget.unSelectedColor ??
                                        widget.inactivePageIndicatorDecoration
                                            .color,
                                  ),
                                  child: Tooltip(
                                    richMessage: const TextSpan(
                                        text: 'Previous 5 pages'),
                                    child: Center(
                                      child: Icon(
                                        TltIcons.chevrons_left,
                                        color: widget
                                            .inActivePageNumberStyle.color,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                ],
              )
          ],
        ),
        _NavButton(
          enabled: activeIndex != widget.totalPages,
          iconFirst: false,
          widget: widget,
          text: "Next",
          icon: Icons.arrow_forward,
          onTap: () {
            widget.onTap[activeIndex]();
            setState(() {
              activeIndex++;
              nextPageFunction(activeIndex);
            });
          },
        ),
      ],
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    Key? key,
    required this.widget,
    required this.text,
    required this.icon,
    required this.onTap,
    this.iconFirst = true,
    required this.enabled,
  }) : super(key: key);

  final TltPagination widget;
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final bool iconFirst;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: Container(
        height: widget.indicatorHeight,
        width: widget.previousButtonWidget != null
            ? null
            : widget.nextButtonWidget != null
                ? null
                : 140,
        decoration: widget.paginationType == TltPaginationType.minimal
            ? widget.navigationButtonDecoration
            : null,
        child: Material(
          color: TltColors.transparent,
          child: InkWell(
            hoverColor: TltColors.black.withOpacity(0.05),
            customBorder: RoundedRectangleBorder(
                borderRadius: widget.paginationType == TltPaginationType.minimal
                    ? widget.navigationButtonDecoration!.borderRadius!
                    : BorderRadius.zero),
            mouseCursor: enabled ? null : SystemMouseCursors.forbidden,
            onTap: enabled ? onTap : null,
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: Center(
                child: iconFirst
                    ? widget.previousButtonWidget ?? defaultNavButton()
                    : widget.nextButtonWidget ?? defaultNavButton(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row defaultNavButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        iconFirst ? iconElement() : textElement(),
        const SizedBox(
          width: 10,
        ),
        !iconFirst ? iconElement() : textElement(),
      ],
    );
  }

  Text textElement() {
    return Text(
      text,
      style: widget.inActivePageNumberStyle,
    );
  }

  Icon iconElement() {
    return Icon(
      icon,
      size: widget.activePageNumberStyle.fontSize,
      color: widget.inActivePageNumberStyle.color,
    );
  }
}
