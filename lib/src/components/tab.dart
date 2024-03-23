import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tlt_design/src/foundations/colors.dart';
import 'package:tlt_design/src/foundations/theme.dart';
import 'package:tlt_design/src/utils/properties.dart';
import 'package:tlt_design/src/utils/shadows.dart';

class TltTabElement {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? content;
  final VoidCallback onTap;
  final VoidCallback? suffixOnTap;
  bool isActive = false;
  TltTabElement({
    this.prefixIcon,
    this.content,
    this.suffixIcon,
    this.suffixOnTap,
    required this.onTap,
  }) : super() {
    assert(!(content == null && suffixIcon == null && prefixIcon == null),
        "At least mention one among prefixIcon, suffixIcon and content");
  }
}

class TltTab extends StatefulWidget {
  static final TltTheme _theme = TltTheme.instance;

  TltTab({
    Key? key,
    TltTabDecoration? tabDecoration,
    this.showAddButton = false,
    Color? selectedColor,
    this.tabElementWidth,
    double? tabElementHeight,
    this.tabElementAlignment = CrossAxisAlignment.start,
    EdgeInsets? padding,
    this.animationDuration,
    required this.tabs,
    required this.tabView,
    this.tabViewAlignment = Alignment.center,
    this.initialIndex = 0,
    this.tabBarDragStartBehavior = DragStartBehavior.start,
    this.tabViewDragStartBehavior = DragStartBehavior.start,
    this.enableFeedback,
    this.isScrollable = false,
    this.automaticIndicatorColorAdjustment = false,
    TextStyle? unSelectedLabelStyle,
    TextStyle? selectedLabelStyle,
    Color? inactiveIndicatorColor,
    Color? activeIndicatorColor,
    Color? selectedLabelColor,
    Color? unSelectedLabelColor,
    this.hoverColor,
    this.splashColor,
    this.mouseCursor,
    this.overlayColor,
    this.tabBarPhysics,
    this.tabViewPhysics,
    this.splashFactory,
    BorderRadius? splashBorderRadius,
    this.viewPortFraction = 1,
  })  : tabDecoration = tabDecoration ?? _theme.tabDecoration,
        selectedColor = selectedColor ?? _theme.tabSelectedColor,
        tabElementHeight = tabElementHeight ?? _theme.tabElementHeight,
        padding = padding ?? _theme.tabsPadding,
        selectedLabelColor = selectedLabelColor ?? _theme.tabSelectedLabelColor,
        unSelectedLabelColor =
            unSelectedLabelColor ?? _theme.tabUnSelectedLabelColor,
        selectedLabelStyle =
            selectedLabelStyle ?? _theme.tabsSelectedLabelStyle,
        unSelectedLabelStyle =
            unSelectedLabelStyle ?? _theme.tabsUnSelectedLabelStyle,
        splashBorderRadius = splashBorderRadius ?? _theme.tabSplashBorderRadius,
        inactiveIndicatorColor =
            inactiveIndicatorColor ?? _theme.tabInactiveIndicatorColor,
        activeIndicatorColor =
            activeIndicatorColor ?? _theme.tabActiveIndicatorColor,
        assert(tabs.isNotEmpty, "Mention at least one tab"),
        assert(tabs.length == tabView.length,
            "tabs and tabView length must be equal"),
        super(key: key);

  final TltTabDecoration tabDecoration;
  final bool showAddButton;
  final Color selectedColor;
  final double? tabElementWidth;
  final double tabElementHeight;
  final CrossAxisAlignment tabElementAlignment;
  final EdgeInsets padding;
  final List<TltTabElement> tabs;
  final List<Widget> tabView;
  final AlignmentGeometry tabViewAlignment;
  final Duration? animationDuration;
  final int initialIndex;
  final DragStartBehavior tabViewDragStartBehavior;
  final DragStartBehavior tabBarDragStartBehavior;
  final bool? enableFeedback;
  final bool automaticIndicatorColorAdjustment;
  final bool isScrollable;
  final Color selectedLabelColor;
  final Color activeIndicatorColor;
  final Color inactiveIndicatorColor;
  final Color unSelectedLabelColor;
  final Color? splashColor;
  final Color? hoverColor;
  final TextStyle selectedLabelStyle;
  final TextStyle unSelectedLabelStyle;
  final MouseCursor? mouseCursor;
  final ScrollPhysics? tabBarPhysics;
  final ScrollPhysics? tabViewPhysics;
  final double viewPortFraction;
  final BorderRadius? splashBorderRadius;
  final InteractiveInkFeatureFactory? splashFactory;
  final MaterialStateProperty<Color>? overlayColor;

  @override
  State<TltTab> createState() => TltTabState();
}

class TltTabState extends State<TltTab> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
      initialIndex: widget.initialIndex,
      animationDuration: widget.animationDuration,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _tabController!.addListener(
      () {
        setState(() {});
      },
    );
    return DefaultTabController(
      length: widget.tabs.length,
      child: Column(
        crossAxisAlignment: widget.tabElementAlignment,
        children: [
          Row(
            children: [
              Flexible(
                child: TabBar(
                  controller: _tabController,
                  dragStartBehavior: widget.tabBarDragStartBehavior,
                  isScrollable: widget.isScrollable,
                  labelStyle: widget.selectedLabelStyle,
                  unselectedLabelStyle: widget.unSelectedLabelStyle,
                  mouseCursor: widget.mouseCursor,
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    for (var state in states) {
                      if (state == MaterialState.hovered) {
                        return widget.hoverColor;
                      } else if (state == MaterialState.pressed) {
                        return widget.splashColor;
                      }
                    }
                    return null;
                  }),
                  physics: widget.tabBarPhysics,
                  splashFactory: widget.splashFactory,
                  splashBorderRadius: widget.splashBorderRadius,
                  indicatorWeight: 0,
                  enableFeedback: widget.enableFeedback,
                  automaticIndicatorColorAdjustment:
                      widget.automaticIndicatorColorAdjustment,
                  onTap: ((value) {
                    widget.tabs[value].onTap();
                  }),
                  labelColor: widget.selectedLabelColor,
                  unselectedLabelColor: widget.unSelectedLabelColor,
                  labelPadding: const EdgeInsets.all(0),
                  indicatorPadding: const EdgeInsets.all(0),
                  indicator: BoxDecoration(
                    color: widget.tabDecoration == TltTabDecoration.button
                        ? widget.selectedColor
                        : TltColors.transparent,
                    //     : TltColors.transparent,
                    border: widget.tabDecoration != TltTabDecoration.button
                        ? Border(
                            bottom: BorderSide(
                              color: widget.activeIndicatorColor,
                              width: 4,
                            ),
                          )
                        : null,
                    boxShadow:
                        (widget.tabDecoration == TltTabDecoration.button && true
                            // i.isActive
                            )
                            ? TltShadow.md()
                            : null,
                    borderRadius:
                        widget.tabDecoration == TltTabDecoration.button
                            ? widget.splashBorderRadius
                            : null,
                  ),
                  tabs: [
                    for (TltTabElement i in widget.tabs)
                      Container(
                        height: widget.tabElementHeight,
                        width: widget.tabElementWidth,
                        decoration: BoxDecoration(
                          border:
                              widget.tabDecoration != TltTabDecoration.button
                                  ? Border(
                                      bottom: BorderSide(
                                        color: widget.inactiveIndicatorColor,
                                        width: 2,
                                      ),
                                    )
                                  : null,
                          borderRadius:
                              widget.tabDecoration == TltTabDecoration.button
                                  ? widget.splashBorderRadius
                                  : null,
                        ),
                        padding: widget.padding,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              if (i.prefixIcon != null)
                                Row(
                                  children: [
                                    i.prefixIcon!,
                                    const SizedBox(
                                      width: 12,
                                    ),
                                  ],
                                ),
                              if (i.content != null) Text(i.content!),
                              if (i.suffixIcon != null)
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Material(
                                      color: TltColors.transparent,
                                      child: InkWell(
                                        hoverColor: widget.hoverColor,
                                        splashColor: widget.splashColor,
                                        borderRadius: widget.splashBorderRadius,
                                        onTap: i.suffixOnTap,
                                        child: i.suffixIcon!,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (!widget.showAddButton)
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: widget.tabDecoration == TltTabDecoration.underline
                        ? Border(
                            bottom: BorderSide(
                              color: widget.inactiveIndicatorColor,
                              width: 2,
                            ),
                          )
                        : null,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        hoverColor: widget.hoverColor,
                        splashColor: widget.splashColor,
                        borderRadius: widget.splashBorderRadius,
                        onTap: () {},
                        child: Container(
                          padding: widget.padding,
                          height: widget.tabElementHeight,
                          child: Icon(
                            Icons.add,
                            size: widget.unSelectedLabelStyle.fontSize! * 1.4,
                            color: widget.unSelectedLabelColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: TabBarView(
              viewportFraction: widget.viewPortFraction,
              dragStartBehavior: widget.tabViewDragStartBehavior,
              physics: widget.tabViewPhysics,
              controller: _tabController,
              children: [
                for (Widget i in widget.tabView)
                  Align(
                    alignment: widget.tabViewAlignment,
                    child: i,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
