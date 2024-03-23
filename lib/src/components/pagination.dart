import 'package:flutter/material.dart';
import 'package:tlt_design/src/foundations/colors.dart';
import 'package:tlt_design/src/foundations/theme.dart';
import 'package:tlt_design/src/utils/properties.dart';

class TltPagination extends StatefulWidget {
  static final TltTheme _theme = TltTheme.instance;
  TltPagination({
    required this.currentPage,
    required this.totalPages,
    required this.onTap,
    // int? numberOfVisibleItems,
    BoxDecoration? activePageIndicatorDecoration,
    BoxDecoration? inactivePageIndicatorDecoration,
    BoxShape? pageIndicatorShape,
    BorderRadiusGeometry? indicatorBorderRadius,
    BoxDecoration? previousButtonDecoration,
    BoxDecoration? nextButtonDecoration,
    BoxDecoration? navigationButtonDecoration,
    this.previousButtonChild,
    this.nextButtonChild,
    TltPaginationSize? paginationSize,
    Alignment? paginationAlignment,
    double? elementHeight,
    double? elementWidth,
    // EdgeInsets? padding,
    TltPaginationType? paginationType,
    this.selectedBgColor,
    this.unSelectedBgColor,
    TextStyle? activeLabelStyle,
    TextStyle? inActiveLabelStyle,
    Key? key,
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
        // numberOfVisibleItems =
        //     numberOfVisibleItems ?? _theme.paginationNumberOfVisibleElements,
        activePageIndicatorDecoration = activePageIndicatorDecoration != null
            ? activePageIndicatorDecoration.copyWith(
                borderRadius: pageIndicatorShape != BoxShape.circle
                    ? indicatorBorderRadius ??
                        (paginationType == TltPaginationType.cardButton
                            ? BorderRadius.circular(0)
                            : _theme.paginationIndicatorBorderRadius)
                    : null,
                shape: pageIndicatorShape ?? _theme.paginationIndicatorShape,
                // activePageIndicatorDecoration.borderRadius ??
                //     _theme.paginationActivePageIndicatorCardButtonDecoration
                //         .borderRadius,
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
                // inactivePageIndicatorDecoration.borderRadius ??
                //     _theme
                //         .paginationInactivePageIndicatorCardButtonDecoration
                //         .borderRadius,
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
        previousButtonDecoration = previousButtonDecoration != null
            ? previousButtonDecoration.copyWith(
                color: previousButtonDecoration.color ??
                    _theme.paginationPreviousButtonDecoration.color,
                border: previousButtonDecoration.border ??
                    _theme.paginationPreviousButtonDecoration.border,
                borderRadius: previousButtonDecoration.borderRadius ??
                    _theme.paginationPreviousButtonDecoration.borderRadius,
              )
            : paginationType == TltPaginationType.cardButton
                ? _theme.paginationPreviousButtonDecoration
                : null,
        nextButtonDecoration = nextButtonDecoration != null
            ? nextButtonDecoration.copyWith(
                color: nextButtonDecoration.color ??
                    _theme.paginationNextButtonDecoration.color,
                border: nextButtonDecoration.border ??
                    _theme.paginationNextButtonDecoration.border,
                borderRadius: nextButtonDecoration.borderRadius ??
                    _theme.paginationNextButtonDecoration.borderRadius,
              )
            : paginationType == TltPaginationType.cardButton
                ? _theme.paginationNextButtonDecoration
                : null,
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
        // padding = padding ?? _theme.paginationElementPadding,
        paginationType = paginationType ?? _theme.paginationType,
        elementHeight = elementHeight ?? _theme.paginationElementHeight,
        elementWidth = elementWidth ?? _theme.paginationElementWidth,
        activeLabelStyle = activeLabelStyle != null
            ? activeLabelStyle.copyWith(
                color: paginationType != TltPaginationType.cardButton
                    ? activeLabelStyle.color ?? TltColors.white
                    : null,
                fontWeight: activeLabelStyle.fontWeight ??
                    _theme.paginationActiveLabelStyle.fontWeight,
              )
            : _theme.paginationActiveLabelStyle.copyWith(
                color: paginationType != TltPaginationType.cardButton
                    ? TltColors.white
                    : null,
              ),
        inActiveLabelStyle =
            inActiveLabelStyle ?? _theme.paginationInActiveLabelStyle,
        super(key: key);

  final int currentPage;
  final int totalPages;
  final List<VoidCallback> onTap;
  final int numberOfVisibleItems = 6;
  final BoxDecoration activePageIndicatorDecoration;
  final BoxDecoration inactivePageIndicatorDecoration;
  final BoxShape pageIndicatorShape;
  final BoxDecoration? previousButtonDecoration;
  final BoxDecoration? nextButtonDecoration;
  final BoxDecoration? navigationButtonDecoration;
  final BorderRadiusGeometry indicatorBorderRadius;
  final Widget? previousButtonChild;
  final Widget? nextButtonChild;
  final TltPaginationSize paginationSize;
  final Alignment paginationAlignment;
  // final EdgeInsets padding;
  final double elementWidth;
  final double elementHeight;
  final TltPaginationType paginationType;
  final Color? selectedBgColor;
  final Color? unSelectedBgColor;
  final TextStyle activeLabelStyle;
  final TextStyle inActiveLabelStyle;

  @override
  State<TltPagination> createState() => _TltPaginationState();
}

class _TltPaginationState extends State<TltPagination> {
  late int activeIndex;

  int _index1 = 2;
  late int _index2;

  /// commented by Tlt037 because it is not used any where in the page
  // late List _initialList;
  late List _displayList;

  @override
  void initState() {
    _index2 = widget.totalPages > widget.numberOfVisibleItems
        ? _index1 + 4
        : widget.totalPages;
    _displayList = getDisplayList(_index1, _index2);
    setState(() {
      activeIndex = widget.currentPage;
      // widget.activePageIndicatorDecoration.copyWith(
      //   borderRadius: widget.pageIndicatorShape == BoxShape.circle
      //       ? null
      //       : widget.activePageIndicatorDecoration.borderRadius,
      //   shape: widget.pageIndicatorShape,
      // );
      // widget.inactivePageIndicatorDecoration.copyWith(
      //   borderRadius: widget.pageIndicatorShape == BoxShape.circle
      //       ? null
      //       : widget.inactivePageIndicatorDecoration.borderRadius,
      //   shape: widget.pageIndicatorShape,
      // );
    });
    super.initState();
  }

  List getDisplayList(
    int index1,
    int index2,
  ) {
    List list = [];
    for (int i = 0; i < widget.totalPages; i++) {
      list += [i];
    }

    /// commented by Tlt037 because it is not used any where in the page
    // _initialList = list;
    // _displayList =
    //     [list[0]] + if(index1) + list.sublist(index1, index2) + [list[list.length - 1]];
    return [list[0]] +
        list.sublist(index1 - 1, index2 - 1) +
        [list[list.length - 1]];
  }

  @override
  Widget build(BuildContext context) {
    // print(_displayList);
    // print(widget.pageIndicatorShape);
    // print(widget.indicatorBorderRadius);
    // print(widget.activePageIndicatorDecoration.borderRadius);
    // print(widget.inactivePageIndicatorDecoration.borderRadius);
    return Row(
      mainAxisSize: widget.paginationSize == TltPaginationSize.compact
          ? MainAxisSize.min
          : MainAxisSize.max,
      mainAxisAlignment: widget.paginationSize == TltPaginationSize.compact
          ? MainAxisAlignment.center
          : MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // borderRadius: widget.paginationSize == TltPaginationSize.compact
        //     ? widget.activePageIndicatorDecoration.borderRadius : BorderRadius.only(),,
        _NavButton(
          enabled: activeIndex != 1,
          onTap: () {
            setState(() {
              activeIndex = activeIndex - 1;
              // print(activeIndex);
              // print(
              //     _displayList.length == _displayList.indexOf(activeIndex) - 1);
              // print(_displayList.indexOf(activeIndex));
              if ((_displayList.indexOf(activeIndex) == 1) &&
                  (activeIndex > 2)) {
                _index1 = activeIndex - 1;
                _index2 = _index1 + 4;
                // print(_index1);
                // print(_index2);
                _displayList = getDisplayList(_index1, _index2);
              }
            });
          },
          widget: widget,
          icon: Icons.arrow_back,
          text: "Previous",
        ),
        Row(
          children: [
            for (int i in _displayList)
              // if (!((i == _index1 - 1 || i == _index2) &&
              //         _index2 == widget.totalPages - 1) ||
              //     i == _index1 - 1)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (i == _displayList[_displayList.length - 1])
                    if (!(i == _displayList[_displayList.length - 1] &&
                        i == _displayList[_displayList.length - 2] + 1))
                      Container(
                        height: widget.elementHeight,
                        width: widget.elementWidth,
                        decoration: BoxDecoration(
                          color: widget.unSelectedBgColor ??
                              widget.inactivePageIndicatorDecoration.color,
                        ),
                        //     widget.inactivePageIndicatorDecoration.copyWith(
                        //   color: widget.unSelectedBgColor ??
                        //       widget.inactivePageIndicatorDecoration.color,
                        // ),
                        child: Center(
                          child:
                              // _previousDotOnHover
                              //     ? Tooltip(
                              //         richMessage:
                              //             const TextSpan(text: 'Next 5 pages'),
                              //         child: Icon(
                              //           TltIcons.chevrons_right,
                              //           color: widget.inActiveLabelStyle.color,
                              //         ),
                              //       )
                              //     :
                              Text(
                            "...",
                            style: widget.inActiveLabelStyle,
                          ),
                        ),
                      ),
                  Container(
                    height: widget.elementHeight,
                    width: widget.elementWidth,
                    decoration: i == activeIndex - 1
                        ? widget.activePageIndicatorDecoration.copyWith(
                            color: widget.selectedBgColor ??
                                widget.activePageIndicatorDecoration.color,
                          )
                        : widget.inactivePageIndicatorDecoration.copyWith(
                            color: widget.unSelectedBgColor ??
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
                        onTap:
                            // (i == _index1 - 1 || i == _index2)
                            //     ? null
                            //     :
                            () {
                          // print(i - 1);
                          widget.onTap[i]();
                          // print(((i == _displayList[0] &&
                          //         i == _initialList[1] + 1) ||
                          //     ((i == _displayList[1]) &&
                          //         i ==
                          //             _initialList[widget.totalPages - 1] -
                          //                 1)));

                          // print(_index1);
                          // print((i == _displayList[_displayList.length - 1] &&
                          //     i == _initialList[widget.totalPages - 2] + 1));
                          setState(() {
                            if (i == _index1 + 2) {
                              if (i == widget.totalPages - 4) {
                                _index1 = i;
                                _index2 += 2;
                              } else if (_index2 < widget.totalPages - 3) {
                                _index1 = i;
                                _index2 += 2;
                              }
                              // _index2 = _index2 - 3;
                              // print(_index1);
                              _displayList = getDisplayList(_index1, _index2);
                              // print(_displayList);
                              // print(i == widget.totalPages - 3);
                            } else if (i == _index1 - 1) {
                              if (_index1 > 5) {
                                _index1 -= 2;
                                _index2 -= 2;
                                _displayList = getDisplayList(_index1, _index2);
                              } else {
                                _index1 = 2;
                                _index2 = 6;
                                _displayList = getDisplayList(_index1, _index2);
                              }
                            } else {
                              if (i == 0) {
                                _index1 = 2;
                                _index2 = 6;
                                _displayList = getDisplayList(_index1, _index2);
                              } else if (i == widget.totalPages - 1) {
                                _index1 = widget.totalPages - 4;
                                _index2 = widget.totalPages;
                                _displayList = getDisplayList(_index1, _index2);
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
                                    // i == activeIndex - 1
                                    //     ? widget.activePageIndicatorDecoration
                                    //         .borderRadius!
                                    //     : widget.inactivePageIndicatorDecoration
                                    //         .borderRadius!,
                                  ),
                        // widget.paginationType ==
                        //         TltPaginationType.cardButton
                        //     ? null
                        //     :
                        // i == activeIndex - 1
                        //     ? widget.activePageIndicatorDecoration
                        //                 .borderRadius !=
                        //             null
                        //         ? RoundedRectangleBorder(
                        //             borderRadius: widget
                        //                 .activePageIndicatorDecoration
                        //                 .borderRadius!)
                        //         : const CircleBorder()
                        //     : widget.inactivePageIndicatorDecoration
                        //                 .borderRadius !=
                        //             null
                        //         ? RoundedRectangleBorder(
                        //             borderRadius: widget
                        //                 .inactivePageIndicatorDecoration
                        //                 .borderRadius!)
                        //         : const CircleBorder(),
                        child: Center(
                          child: Text(
                            // (i > 3) || (i < widget.totalPages - 4)
                            // ((i == _index1 - 1 || i == _index2) &&
                            //         ((i != 1 && i != widget.totalPages - 1) ||
                            //             (_displayList.firstWhere((i) {
                            //                   if (i == widget.totalPages - 1) {
                            //                     setState(() {
                            //                       // _displayList
                            //                       //     .add(widget.totalPages - 1);
                            //                     });
                            //                   }
                            //                   return i == widget.totalPages - 1;
                            //                 }) ==
                            //                 _displayList.length - 2)))
                            //     ? "..."
                            //     :
                            (i + 1).toString(),
                            style: i == activeIndex - 1
                                ? widget.activeLabelStyle
                                : widget.inActiveLabelStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // print(!((i == _initialList[widget.totalPages - 2]) &&
                  //     i == _initialList[widget.totalPages - 3] + 1));
                  // print(!(i == _displayList[0] &&
                  //     i == _initialList[1] - 1));
                  if (i == _displayList[0])
                    if (!(i == _displayList[0] && i == _displayList[1] - 1))
                      Container(
                        height: widget.elementHeight,
                        width: widget.elementWidth,
                        decoration: BoxDecoration(
                          color: widget.unSelectedBgColor ??
                              widget.inactivePageIndicatorDecoration.color,
                        ),
                        //     widget.inactivePageIndicatorDecoration.copyWith(
                        //   color: widget.unSelectedBgColor ??
                        //       widget.inactivePageIndicatorDecoration.color,
                        // ),
                        child: Center(
                          child:
                              //  _nextDotOnHover
                              //     ? Tooltip(
                              //         richMessage: const TextSpan(
                              //             text: 'Previous 5 pages'),
                              //         child: Icon(
                              //           TltIcons.chevrons_left,
                              //           color: widget.inActiveLabelStyle.color,
                              //         ),
                              //       )
                              //     :
                              Text(
                            "...",
                            style: widget.inActiveLabelStyle,
                          ),
                        ),
                      ),
                ],
              )
            // if (widget.paginationType == TltPaginationType.cardButton
            // //  &&
            // //     widget.inactivePageIndicatorDecoration.border == null
            //     )
            //   Container(
            //     height: widget.elementHeight,
            //     width: 1,
            //     color: widget.activePageIndicatorDecoration.border != null
            //         ? widget.activePageIndicatorDecoration.border!.top.color
            //         : null,
            //   )
          ],
        ),
        _NavButton(
          enabled: activeIndex != widget.totalPages,
          iconFirst: false,
          widget: widget,
          text: "Next",
          icon: Icons.arrow_forward,
          onTap: () {
            setState(() {
              activeIndex = activeIndex + 1;
              // print(activeIndex);
              // print(
              //     _displayList.length == _displayList.indexOf(activeIndex) - 1);
              // print(_displayList.indexOf(activeIndex));
              if ((!_displayList.contains(activeIndex))) {
                if ((activeIndex < widget.totalPages - 3)) {
                  _index1 = activeIndex;
                  _index2 = activeIndex + 4;
                  // print(_index1);
                  // print(_index2);
                } else if (activeIndex > 5) {
                  _index1 = widget.totalPages - 4;
                  _index2 = _index1 + 4;
                }
              }
              _displayList = getDisplayList(_index1, _index2);
            });
          },
        ),
        // TltButton(
        //   enabled: activeIndex != widget.totalPages,
        //   text: "Next",
        //   onTap: () {
        //     setState(() {
        //       activeIndex = activeIndex + 1;
        //     });
        //   },
        //   suffix: const Icon(
        //     Icons.arrow_forward,
        //     color: TltColors.white,
        //   ),
        // ),
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
        height: widget.elementHeight,
        width: widget.previousButtonChild != null
            ? null
            : widget.nextButtonChild != null
                ? null
                : 140,
        // padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
        decoration: widget.paginationType == TltPaginationType.minimal
            ? (iconFirst
                ? widget.previousButtonDecoration != null
                    ? widget.previousButtonDecoration!.copyWith(
                        borderRadius:
                            widget.navigationButtonDecoration!.borderRadius)
                    : widget.navigationButtonDecoration
                : widget.nextButtonDecoration != null
                    ? widget.nextButtonDecoration!.copyWith(
                        borderRadius:
                            widget.navigationButtonDecoration!.borderRadius)
                    : widget.navigationButtonDecoration)
            : iconFirst
                ? widget.navigationButtonDecoration != null
                    ? widget.navigationButtonDecoration!.copyWith(
                        borderRadius:
                            widget.previousButtonDecoration!.borderRadius)
                    : widget.previousButtonDecoration
                : widget.navigationButtonDecoration != null
                    ? widget.navigationButtonDecoration!.copyWith(
                        borderRadius: widget.nextButtonDecoration!.borderRadius)
                    : widget.nextButtonDecoration,
        child: Material(
          color: TltColors.transparent,
          child: InkWell(
            hoverColor: TltColors.black.withOpacity(0.05),
            customBorder: RoundedRectangleBorder(
                borderRadius: widget.paginationType == TltPaginationType.minimal
                    ? iconFirst
                        ? widget.previousButtonDecoration != null
                            ? widget.previousButtonDecoration!.borderRadius!
                            : widget.navigationButtonDecoration!.borderRadius!
                        : widget.nextButtonDecoration != null
                            ? widget.nextButtonDecoration!.borderRadius!
                            : widget.navigationButtonDecoration!.borderRadius!
                    : iconFirst
                        ? widget.navigationButtonDecoration != null
                            ? widget.navigationButtonDecoration!.borderRadius!
                            : widget.previousButtonDecoration!.borderRadius!
                        : widget.navigationButtonDecoration != null
                            ? widget.navigationButtonDecoration!.borderRadius!
                            : widget.nextButtonDecoration!.borderRadius!),
            mouseCursor: enabled ? null : SystemMouseCursors.forbidden,
            onTap: enabled ? onTap : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
              child: Center(
                child: iconFirst
                    ? widget.previousButtonChild ?? defaultNavButtonChild()
                    : widget.nextButtonChild ?? defaultNavButtonChild(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row defaultNavButtonChild() {
    // print("nextButtonDecoration" + widget.nextButtonDecoration.toString());
    // print("previousButtonDecoration" +
    //     widget.previousButtonDecoration.toString());
    // print("navigationButtonDecoration" +
    //     widget.navigationButtonDecoration.toString());
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
      style: widget.inActiveLabelStyle,
    );
  }

  Icon iconElement() {
    return Icon(
      icon,
      size: widget.activeLabelStyle.fontSize,
      color: widget.inActiveLabelStyle.color,
    );
  }
}
