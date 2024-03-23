import 'package:flutter/material.dart';
import 'package:tlt_design/src/foundations/colors.dart';
import 'package:tlt_design/src/foundations/theme.dart';
import 'package:tlt_design/src/utils/icons.dart';

class TltBadge extends StatelessWidget {
  static final TltTheme _theme = TltTheme.instance;
  TltBadge({
    Key? key,
    this.borderStyle,
    this.borderRadius,
    Color? backgroundColor,
    this.shadow = const [],
    Color? checkMarkColor,
    double? checkMarkSize,
    double? contentSpacing,
    this.enabled = true,
    required this.label,
    this.onTap,
    EdgeInsets? padding,
    this.prefix,
    this.selected = false,
    Color? selectedColor,
    this.selectedShadow = const [],
    this.showCheckMark = false,
    this.suffix,
    String? suffixTooltip,
    this.suffixOnTap,
    this.tooltip = "",
  })  : assert(!(suffix == null && suffixOnTap != null),
            "You can't have a suffixOnTap without a suffix"),
        backgroundColor = backgroundColor ?? _theme.badgeBackgroundColor,
        checkMarkColor = checkMarkColor ?? _theme.badgeCheckMarkColor,
        checkMarkSize = checkMarkSize ?? _theme.badgeCheckMarkSize,
        contentSpacing = contentSpacing ?? _theme.badgeContentSpacing,
        padding = padding ?? _theme.badgePadding,
        selectedColor = selectedColor ?? _theme.badgeSelectedColor,
        suffixTooltip = suffixTooltip ?? _theme.badgeSuffixTooltip,
        // label = label ??
        //     Text(
        //       "Label",
        //       style: TextStyle(
        //           color: TltColors.blue[700],
        //           fontSize: 12,
        //           height: 1,
        //           fontWeight: FontWeight.w600),
        //     ),
        super(key: key);

  final Border? borderStyle;

  final BorderRadius? borderRadius;

  /// change [backgroundColor] to set default badge background color
  final Color backgroundColor;

  /// set default [shadow], has no effect when [enabled] is set false
  final List<BoxShadow> shadow;

  /// set [checkMarkColor] to change check mark color when [selected] is set to true
  final Color checkMarkColor;

  /// set [checkMarkSize] to change check mark size when [selected] is set to true
  final double checkMarkSize;

  /// change [contentSpacing] to change spacing between [prefix],[label] and [suffix]
  final double? contentSpacing;

  /// set [enabled] to false to disable [TltBadge]
  final bool enabled;
  final Widget label;

  /// [onTap] function to be executed when badge is clicked
  final VoidCallback? onTap;

  /// change [padding] to change default badge padding and set a uniform padding to get a circular shape
  final EdgeInsets padding;
  final Widget? prefix;

  /// change value of [selected] to select/deselect [TltBadge], if set to true [backgroundColor],  is ignored
  final bool selected;

  /// change value of [selectedColor] to set selected color, if mentioned [backgroundColor] is ignored
  final Color selectedColor;

  /// change value of [selectedShadow] to set selected shadow, if mentioned [shadow] is ignored
  final List<BoxShadow> selectedShadow;

  /// change [showCheckMark] to show/hide selected check mark
  final bool showCheckMark;
  final Widget? suffix;
  final String suffixTooltip;

  /// [suffixOnTap] function to be executed when [suffix] is clicked
  final VoidCallback? suffixOnTap;
  final String tooltip;

  BorderRadius? get _borderRadius {
    return borderRadius ??
        const BorderRadius.all(
          Radius.circular(20),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor:
          !enabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
      child: AbsorbPointer(
        absorbing: !enabled,
        child: Opacity(
          opacity: !enabled ? 0.5 : 1,
          child: Tooltip(
            message: onTap != null ? tooltip : "",
            child: Container(
              decoration: BoxDecoration(
                boxShadow: enabled
                    ? selected
                        ? selectedShadow
                        : shadow
                    : null,
                color: selected ? selectedColor : backgroundColor,
                border: borderStyle,
                borderRadius: _borderRadius,
              ),
              child: InkWell(
                borderRadius: _borderRadius,
                hoverColor: TltColors.gray.withOpacity(0.1),
                focusColor: TltColors.gray.withOpacity(0.1),
                splashColor: TltColors.gray.withOpacity(0.1),
                highlightColor: TltColors.gray.withOpacity(0.1),
                onTap: onTap,
                child: Padding(
                  padding: padding,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          showCheckMark
                              ? const SizedBox()
                              : prefix ?? const SizedBox(),
                          showCheckMark && selected
                              ? DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: TltColors.black.withOpacity(0.5),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Icon(
                                      showCheckMark ? TltIcons.check : null,
                                      size: checkMarkSize,
                                      color: checkMarkColor,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: suffix == null ? padding.top : 0,
                          bottom: suffix == null ? padding.bottom : 0,
                          left: (showCheckMark && selected) || prefix != null
                              ? contentSpacing!
                              : 0,
                          right: suffix != null ? 0 : 0,
                        ),
                        // symmetric(
                        //   horizontal: prefix != null
                        //       ? suffix == null
                        //           ? padding.horizontal
                        //           : padding.horizontal / 2
                        //       : suffix == null
                        //           ? padding.horizontal
                        //           : padding.horizontal / 2,
                        //   vertical: suffix == null ? padding.top : 0,
                        // ),
                        child: label,
                      ),
                      if (suffix != null)
                        SizedBox(
                          width: contentSpacing,
                        ),
                      if (suffix != null)
                        Tooltip(
                          message: suffixOnTap != null ? suffixTooltip : "",
                          child: InkWell(
                            borderRadius: _borderRadius,
                            onTap: suffixOnTap,
                            onHover: (_) {},
                            hoverColor: TltColors.transparent,
                            focusColor: TltColors.transparent,
                            splashColor: TltColors.transparent,
                            highlightColor: TltColors.transparent,
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: suffix!),
                          ),
                        ),
                    ],
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
