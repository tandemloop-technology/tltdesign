import 'package:flutter/material.dart';
import 'package:tlt_design/src/components/dropdown_button.dart';
import 'package:tlt_design/src/foundations/colors.dart';
import 'package:tlt_design/src/foundations/theme.dart';
import 'package:tlt_design/src/utils/icons.dart';
import 'package:tlt_design/src/utils/properties.dart';

class TltBreadCrumbElement {
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? content;
  final List<TltBreadCrumbDropdownElement>? dropdownChildren;
  final ValueChanged? dropDownOnChange;
  final VoidCallback onTap;
  Color? presentColor;
  bool isHovered = false;
  int id = 0;
  int activeChildIndex = -1;
  // bool isActive = false;
  TltBreadCrumbElement({
    this.prefixIcon,
    this.content,
    this.dropdownChildren,
    this.dropDownOnChange,
    this.suffixIcon,
    required this.onTap,
  }) : super() {
    // assert(!(content != null && dropdownChildren != null),
    //     "cannot provide both widget and content");
    assert(
        !(content == null &&
            dropdownChildren == null &&
            suffixIcon == null &&
            prefixIcon == null),
        "At least mention one among prefixIcon, suffixIcon, dropdownChildren and content");
  }
}

class TltBreadCrumbDropdownElement {
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget content;
  final VoidCallback? onTap;
  Color? presentColor;
  int id = 0;
  // bool isActive = false;
  TltBreadCrumbDropdownElement({
    this.prefixIcon,
    required this.content,
    this.suffixIcon,
    this.onTap,
  });
}

class TltBreadCrumb extends StatefulWidget {
  static final TltTheme _theme = TltTheme.instance;

  TltBreadCrumb({
    required this.children,
    EdgeInsets? padding,
    this.updateBreadCrumbAutomatically = false,
    TltBreadCrumbSeparator? separator,
    double? separatorSize,
    int? numberOfVisibleElements,
    TextStyle? breadCrumbTextStyle,
    EdgeInsets? truncatedDropdownPadding,
    double? truncatedDropdownMenuItemWidth,
    EdgeInsets? dropdownPadding,
    double? dropdownMenuItemWidth,
    Color? hoverColor,
    Color? activeColor,
    Color? defaultColor,
    Color? selectedMenuItemColor,
    Key? key,
    this.separatorColor,
    this.hoverUnderLine = false,
  })  : activeColor = activeColor ?? _theme.breadCrumbActiveColor,
        hoverColor = hoverColor ?? _theme.breadCrumbHoverColor,
        defaultColor = defaultColor ?? _theme.breadCrumbDefaultColor,
        separator = separator ?? _theme.breadCrumbSeparator,
        separatorSize = separatorSize ?? _theme.breadCrumbSeparatorSize,
        selectedMenuItemColor =
            selectedMenuItemColor ?? _theme.breadCrumbSelectedMenuItemColor,
        numberOfVisibleElements = numberOfVisibleElements != null
            ? numberOfVisibleElements - 1
            : _theme.breadCrumbNumberOfVisibleElements - 1,
        padding = padding ?? _theme.breadCrumbPadding,
        breadCrumbTextStyle = breadCrumbTextStyle != null
            ? breadCrumbTextStyle.copyWith(
                fontSize: breadCrumbTextStyle.fontSize ??
                    _theme.breadCrumbTextStyle.fontSize,
                fontWeight: _theme.breadCrumbTextStyle.fontWeight ??
                    breadCrumbTextStyle.fontWeight,
              )
            : _theme.breadCrumbTextStyle,
        truncatedDropdownMenuItemWidth = truncatedDropdownMenuItemWidth ??
            _theme.breadCrumbDropdownMenuItemWidth,
        truncatedDropdownPadding = truncatedDropdownPadding ??
            _theme.breadCrumbDropdownMenuItemPadding,
        dropdownMenuItemWidth =
            dropdownMenuItemWidth ?? _theme.breadCrumbDropdownMenuItemWidth,
        dropdownPadding =
            dropdownPadding ?? _theme.breadCrumbDropdownMenuItemPadding,
        super(key: key);

  final List<TltBreadCrumbElement> children;
  final EdgeInsets padding;
  final TltBreadCrumbSeparator separator;
  final double separatorSize;
  final int numberOfVisibleElements;
  final bool updateBreadCrumbAutomatically;
  final TextStyle breadCrumbTextStyle;
  final EdgeInsets truncatedDropdownPadding;
  final double truncatedDropdownMenuItemWidth;
  final EdgeInsets dropdownPadding;
  final double dropdownMenuItemWidth;
  final Color hoverColor;
  final Color activeColor;
  final Color defaultColor;
  final Color? selectedMenuItemColor;
  final Color? separatorColor;
  final bool hoverUnderLine;

  @override
  State<TltBreadCrumb> createState() => _TltBreadCrumbState();
}

class _TltBreadCrumbState extends State<TltBreadCrumb> {
  // static final TltTheme _theme = TltTheme.instance;
  // Color defaultColor = widget.defaultColor ?? _theme.tltBreadCrumbDefaultColor;
  // Color activeColor = _theme.tltBreadCrumbActiveColor;
  // Color hoverColor = _theme.tltBreadCrumbHoverColor;
  // Color clickedColor = _theme.tltBreadCrumbClickedColor;
  int finalEntryIndex = 0;
  bool isElementsHidden = false;
  final double iconPadding = 3;
  @override
  void initState() {
    setState(() {
      setChildrenLength();
    });
    setColor(0, widget.defaultColor, true);
    for (TltBreadCrumbElement element in widget.children) {
      element.id = widget.children.indexOf(element);
    }
    isElementsHidden = widget.numberOfVisibleElements <
        widget.children.sublist(0, finalEntryIndex).length - 1;
    super.initState();
  }

  setChildrenLength() {
    finalEntryIndex = widget.children.length;
  }

  setColor(int index, Color color, bool isInItState) {
    for (TltBreadCrumbElement element in widget.children) {
      widget.children.indexOf(element) == index
          ? setState(() {
              if (!isInItState) {
                element.isHovered = !element.isHovered;
              }
              element.presentColor = color;
            })
          : element.presentColor = widget.defaultColor;
    }
  }

  bool setUnderLine(TltBreadCrumbElement element) {
    return (!isLastElement(widget.children.indexOf(element), widget.children) &&
        widget.hoverUnderLine &&
        element.isHovered);
  }

  bool isLastElement(int index, List list) {
    return index == list.length - 1;
  }

  List getChildrenList() {
    for (var element in widget.children) {
      element.id = widget.children.indexOf(element);
    }
    isElementsHidden = widget.numberOfVisibleElements <
        widget.children.sublist(0, finalEntryIndex).length - 1;
    List<TltBreadCrumbElement> visibleList;
    List<TltBreadCrumbElement> truncatedList = [];
    if (widget.numberOfVisibleElements >
        widget.children.sublist(0, finalEntryIndex).length - 1) {
      visibleList = widget.children.sublist(0, finalEntryIndex);
    } else {
      truncatedList = widget.children.sublist(
          1,
          widget.children.length -
              widget.numberOfVisibleElements -
              (widget.children.length - finalEntryIndex));
      visibleList = [widget.children.elementAt(0)] +
          widget.children.sublist(
              widget.children.length -
                  widget.numberOfVisibleElements -
                  (widget.children.length - finalEntryIndex),
              finalEntryIndex);
    }
    // widget.children.sublist(0, widget.numberOfVisibleElements) +
    //     [widget.children.elementAt(finalEntryIndex - 1)];
    // List<TltBreadCrumbElement> _children =
    //     widget.children.sublist(0, finalEntryIndex);
    return [visibleList, truncatedList];
  }

  Widget breadCrumbBuilder() {
    // List<TltBreadCrumbElement> _children =
    //     widget.children.sublist(0, finalEntryIndex);
    // widget.children[(widget.children.length - 1)].isActive = true;

    List children = getChildrenList()[0];
    List truncatedList = getChildrenList()[1];
    return
        // LayoutBuilder(
        //   builder: (BuildContext context, BoxConstraints constraints) {
        //     Widget a = SizedBox();
        //     if (constraints.maxWidth > 600) {
        //       a =
        Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      // alignment: WrapAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: [
        for (TltBreadCrumbElement i in children)
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (children.indexOf(i) == 1 && isElementsHidden)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: TltDropdownButton(
                        selectedItemColor: widget.selectedMenuItemColor,
                        dropdownWidth: widget.truncatedDropdownMenuItemWidth,
                        dropdownPadding: widget.truncatedDropdownPadding,
                        items: truncatedList
                            .map(
                              (label) => DropdownMenuItem<TltBreadCrumbElement>(
                                value: label,
                                child: label.content != null
                                    ? Text(label.content)
                                    // : label.widget ??
                                    : Icon(
                                        label.prefixIcon ??
                                            label.suffixIcon ??
                                            TltIcons.filter,
                                      ),
                              ),
                            )
                            .toList(),
                        underline: const SizedBox(),
                        isDense: true,
                        customButton: Padding(
                          padding: widget.truncatedDropdownPadding,
                          child: Text(
                            "...",
                            style: TextStyle(
                              fontSize: widget.breadCrumbTextStyle.fontSize,
                              letterSpacing: 1,
                              color: widget.breadCrumbTextStyle.color,
                            ),
                          ),
                        ),
                        focusColor: TltColors.transparent,
                        onChanged: (TltBreadCrumbElement? _) {
                          if (widget.updateBreadCrumbAutomatically) {
                            setState(() {
                              finalEntryIndex = _!.id + 1;
                            });
                          }
                          _!.onTap();
                        },
                      ),
                    ),
                    separator()
                  ],
                ),
              // InkWell(
              //   mouseCursor: MouseCursor.defer,
              //   hoverColor: TltColors.transparent,
              //   focusColor: TltColors.transparent,
              //   splashColor: TltColors.transparent,
              //   highlightColor: TltColors.transparent,
              //   onTap: () {},
              //   child: const Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 20),
              //     child: Text("..."),
              //   ),
              // ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///
                  InkWell(
                    mouseCursor: MouseCursor.defer,
                    hoverColor: TltColors.transparent,
                    focusColor: TltColors.transparent,
                    splashColor: TltColors.transparent,
                    highlightColor: TltColors.transparent,
                    onHover: (_) {
                      // setState(() {
                      //   i.isHovered = !i.isHovered;
                      // });
                      !isLastElement(children.indexOf(i), children)
                          ? setColor(
                              i.id,
                              _ ? widget.hoverColor : widget.defaultColor,
                              false)
                          : null;
                    },
                    onTap: () {
                      i.onTap();
                      if (widget.updateBreadCrumbAutomatically) {
                        !isLastElement(children.indexOf(i), children)
                            ? setState(() {
                                finalEntryIndex = i.id + 1;
                              })
                            : null;
                      }
                    },
                    child: Row(
                      children: [
                        if (i.prefixIcon != null && i.dropdownChildren == null)
                          Padding(
                            padding: EdgeInsets.only(
                                right: i.content != null ? 5 : 0),
                            child: Icon(
                              i.prefixIcon!,
                              color:
                                  isLastElement(children.indexOf(i), children)
                                      ? widget.activeColor
                                      : i.presentColor ?? widget.defaultColor,
                            ),
                          ),
                        if (i.content != null && i.dropdownChildren == null)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              i.content!,
                              style: widget.breadCrumbTextStyle.copyWith(
                                shadows: [
                                  Shadow(
                                      color: isLastElement(
                                              children.indexOf(i), children)
                                          ? widget.activeColor
                                          : i.presentColor ??
                                              widget.defaultColor,
                                      offset:
                                          Offset(0, setUnderLine(i) ? -3 : -1))
                                ],
                                decoration: setUnderLine(i)
                                    ? TextDecoration.underline
                                    : TextDecoration.none,
                                decorationColor: setUnderLine(i)
                                    ? widget.activeColor
                                    : widget.hoverColor,
                                // height: 2,
                                color: TltColors.transparent,
                              ),
                            ),
                          ),
                        if (i.dropdownChildren != null)
                          TltDropdownButton(
                            selectedItemColor: widget.selectedMenuItemColor,
                            dropdownWidth: widget.dropdownMenuItemWidth,
                            dropdownPadding: widget.dropdownPadding,
                            isDense: true,
                            onTap: () async {
                              i.onTap();
                              // if (widget.updateBreadCrumbAutomatically) {
                              //   !isLastElement(_children.indexOf(i), _children)
                              //       ? setState(() {
                              //           finalEntryIndex = i.id + 1;
                              //         })
                              //       : null;
                              // }
                            },
                            underline: const SizedBox(),
                            customButton: dropdownHeading(i, children),
                            items: i.dropdownChildren!
                                .map(
                                  (label) => DropdownMenuItem<
                                      TltBreadCrumbDropdownElement>(
                                    value: label,
                                    child: label.content,
                                  ),
                                )
                                .toList(),
                            value: i.activeChildIndex != -1
                                ? i.dropdownChildren![i.activeChildIndex]
                                : null,
                            onChanged: (TltBreadCrumbDropdownElement? _) {
                              if (widget.updateBreadCrumbAutomatically) {
                                !isLastElement(children.indexOf(i), children)
                                    ? setState(() {
                                        finalEntryIndex = i.id + 1;
                                      })
                                    : null;
                              }
                              i.dropDownOnChange!(_);
                              if (_!.onTap != null) _.onTap!();
                              setState(() {
                                i.activeChildIndex =
                                    i.dropdownChildren!.indexOf(_);
                              });
                            },
                          ),
                        if (i.suffixIcon != null && i.dropdownChildren == null)
                          Padding(
                            padding: EdgeInsets.only(
                                left: i.content != null ? 5 : 0),
                            child: Icon(
                              i.suffixIcon!,
                              color:
                                  isLastElement(children.indexOf(i), children)
                                      ? widget.activeColor
                                      : i.presentColor,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (!isLastElement(children.indexOf(i), children)) separator()
                ],
              ),
            ],
          ),
      ],
      // );
      // }
      //     return a;
      //   },
    );
  }

  Row dropdownHeading(TltBreadCrumbElement i, List<dynamic> children) {
    return Row(
      children: [
        if (i.prefixIcon != null)
          Padding(
            padding: EdgeInsets.only(right: i.content != null ? 5 : 0),
            child: Icon(
              i.prefixIcon!,
              color: isLastElement(children.indexOf(i), children)
                  ? widget.activeColor
                  : i.presentColor,
            ),
          ),
        if (i.content != null)
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: i.content != null ? 5 : 0),
            child: Text(
              i.content!,
              style: widget.breadCrumbTextStyle.copyWith(
                color: isLastElement(children.indexOf(i), children)
                    ? widget.activeColor
                    : i.presentColor,
              ),
            ),
          ),
        if (i.suffixIcon != null)
          Padding(
            padding: EdgeInsets.only(left: i.content != null ? 5 : 0),
            child: Icon(
              i.suffixIcon,
              color: isLastElement(children.indexOf(i), children)
                  ? widget.activeColor
                  : i.presentColor,
            ),
          ),
      ],
    );
  }

  Padding separator() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Text(
        widget.separator == TltBreadCrumbSeparator.arrow ? ">" : "/",
        style: TextStyle(
            fontSize: widget.separatorSize, color: widget.separatorColor),
        // size: widget.separatorSize,
        // color: widget.defaultColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: breadCrumbBuilder(),
    );
  }
}
