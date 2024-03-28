import 'package:flutter/material.dart';
import 'package:tlt_design/src/components/items.dart';
import 'package:tlt_design/src/components/space.dart';
import 'package:tlt_design/src/foundations/colors.dart';
import 'package:tlt_design/src/foundations/theme.dart';
import 'package:tlt_design/src/utils/properties.dart';

final TltTheme _theme = TltTheme.instance;

/// [showIndicator] if set to true, a circle indicator is shown, and can be set to true/false to indicate active/inactive status by changing [indicator]
class TltAvatar extends StatelessWidget {
  /// [showIndicator] if set to true, a circle indicator is shown, and can be set to true/false to indicate active/inactive status by changing [indicator]
  TltAvatar({
    Key? key,
    TltSize? avatarSize,
    Color? backgroundColor,
    this.backgroundImage,
    Color? focusColor,
    Widget? child,
    Color? foregroundColor,
    this.foregroundImage,
    Color? indicatorColor,
    this.onBackgroundImageError,
    this.onForegroundImageError,
    this.onTap,
    this.showIndicator = false,
    this.text,
    this.textStyle = const TextStyle(color: Colors.grey),
  })  : assert(!(foregroundImage != null && showIndicator),
            "cannot use foreground image and activity indicator together"),
        assert(backgroundImage != null || onBackgroundImageError == null),
        assert(foregroundImage != null || onForegroundImageError == null),
        avatarSize = avatarSize ?? _theme.avatarSize,
        child = child ?? _theme.avatarChild,
        constructorName = 'default',
        foregroundColor = foregroundColor ?? _theme.avatarForegroundColor,
        indicatorColor = indicatorColor ?? _theme.avatarIndicatorColor,
        maxRadius = null,
        minRadius = null,
        indicatorSize = null,
        radius = 24,
        backgroundColor = backgroundColor ?? _theme.avatarBackgroundColor,
        focusColor = focusColor ?? _theme.avatarFocusColor,
        super(key: key);

  final TltSize avatarSize;
  final Color backgroundColor;
  final ImageProvider? backgroundImage;
  final Color focusColor;
  final Widget child;
  final Color foregroundColor;
  final ImageProvider? foregroundImage;
  final Color indicatorColor;
  final double? maxRadius;
  final TextStyle? textStyle;
  final double? minRadius;
  final ImageErrorListener? onBackgroundImageError;
  final ImageErrorListener? onForegroundImageError;
  final double? indicatorSize;
  final VoidCallback? onTap;
  final double? radius;
  final String? text;

  /// if set to true, a circle indicator is shown, and can be set to true/false to indicate active/inactive status by changing [indicator]
  final bool showIndicator;
  final String constructorName;

  TltAvatar.custom({
    Key? key,
    Color? backgroundColor,
    this.backgroundImage,
    Color? focusColor,
    Widget? child,
    Color? foregroundColor,
    this.foregroundImage,
    Color? indicatorColor,
    this.maxRadius,
    this.minRadius,
    this.onBackgroundImageError,
    this.onForegroundImageError,
    this.text,
    this.onTap,
    this.radius = 24,
    this.showIndicator = false,
    this.textStyle = const TextStyle(color: Colors.grey),
  })  : assert(!(foregroundImage != null && showIndicator),
            "cannot use foreground image and activity indicator together"),
        assert(radius == null || (minRadius == null && maxRadius == null),
            "cannot use maxRadius, minRadius and radius together"),
        constructorName = 'custom',
        backgroundColor = backgroundColor ?? _theme.avatarBackgroundColor,
        focusColor = focusColor ?? _theme.avatarFocusColor,
        child = child ?? _theme.avatarChild,
        foregroundColor = foregroundColor ?? _theme.avatarForegroundColor,
        indicatorColor = indicatorColor ?? _theme.avatarIndicatorColor,
        indicatorSize = radius != null
            ? radius / 1.8
            : maxRadius != null
                ? maxRadius / 1.8
                : minRadius != null
                    ? minRadius / 1.8
                    : 28,
        avatarSize = TltSize.md,
        super(key: key);

  final Map<TltSize, Map<String, double>> sizes = {
    TltSize.xs: {
      "radius": 14,
      "indicatorSize ": 7,
      "indicatorBorderSize ": 1,
    },
    TltSize.sm: {
      "radius": 17,
      "indicatorSize ": 9,
      "indicatorBorderSize ": 1,
    },
    TltSize.md: {
      "radius": 22,
      "indicatorSize ": 11,
      "indicatorBorderSize ": 1,
    },
    TltSize.lg: {
      "radius": 25,
      "indicatorSize ": 13,
      "indicatorBorderSize ": 1.5,
    },
    TltSize.xl: {
      "radius": 30,
      "indicatorSize ": 16,
      "indicatorBorderSize ": 1.5,
    },
    TltSize.xxl: {
      "radius": 33,
      "indicatorSize ": 18,
      "indicatorBorderSize ": 2,
    },
  };

  double? get _radius {
    if (radius == null && constructorName == "default") {
      return sizes[avatarSize]!["radius"]!;
    } else {
      if (maxRadius == null && minRadius == null) {
        return radius ?? 50.0;
      } else {
        return null;
      }
    }
  }

  dynamic get _childDiameter {
    return _radius != null
        ? _radius! * 2.0
        : maxRadius != null
            ? maxRadius! * 2.0
            : minRadius! * 2.0;
  }

  double get _indicatorPadding {
    return constructorName == "custom" ? indicatorSize! / 80.0 : 0.0;
  }

  double get _borderRadius {
    return _radius != null
        ? _radius! * _radius!
        : maxRadius != null
            ? maxRadius! * maxRadius!
            : minRadius! * minRadius!;
  }

  double get _focusBorderSize {
    double borderSize;
    if (constructorName == "default") {
      borderSize = 4;
    } else {
      borderSize = radius == null
          ? maxRadius == null
              ? minRadius == null
                  ? 6.25
                  : minRadius! / 8
              : maxRadius! / 8
          : radius! / 8;
    }
    return borderSize;
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Builder(
        builder: (BuildContext context) {
          final FocusNode focusNode = Focus.of(context);
          bool hasFocus = focusNode.hasFocus;
          return InkWell(
            borderRadius: BorderRadius.circular(_borderRadius),
            focusColor: TltColors.transparent,
            hoverColor: TltColors.gray[25],
            splashColor: TltColors.transparent,
            highlightColor: TltColors.transparent,
            onTap: onTap != null
                ? () {
                    if (hasFocus) {
                      focusNode.unfocus();
                    } else {
                      focusNode.requestFocus();
                    }
                    onTap!();
                  }
                : null,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: focusNode.hasFocus ? focusColor : TltColors.gray[25],
                borderRadius: BorderRadius.circular(_borderRadius),
              ),
              child: Padding(
                padding: EdgeInsets.all(_focusBorderSize),
                child: CircleAvatar(
                  backgroundColor: backgroundColor,
                  backgroundImage: backgroundImage,
                  foregroundColor: foregroundColor,
                  foregroundImage: foregroundImage,
                  maxRadius: maxRadius,
                  minRadius: minRadius,
                  onBackgroundImageError: onBackgroundImageError,
                  onForegroundImageError: onForegroundImageError,
                  radius: _radius,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      text != null && _theme.avatarChild == child
                          ? Text(
                              text!.contains(' ')
                                  ? "${text![0].toUpperCase()}${text![text!.indexOf(' ') + 1].toUpperCase()}"
                                  : text![0].toUpperCase(),
                              style: textStyle!.copyWith(
                                color: textStyle!.color ??
                                    TltColors.blueLight[500],
                                fontWeight: FontWeight.w900,
                                fontSize: radius! - 4,
                              ),
                            )
                          : child,
                      Container(
                        alignment: Alignment.bottomRight,
                        height: _childDiameter,
                        width: _childDiameter,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: showIndicator
                            ? Padding(
                                padding: EdgeInsets.only(
                                    bottom: _indicatorPadding,
                                    right: _indicatorPadding),
                                child: SizedBox(
                                  height: indicatorSize ??
                                      sizes[avatarSize]!["indicatorSize "]!,
                                  width: indicatorSize ??
                                      sizes[avatarSize]!["indicatorSize "]!,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: TltColors.white,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          constructorName == "default"
                                              ? sizes[avatarSize]![
                                                  "indicatorBorderSize "]!
                                              : indicatorSize! / 12),
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: indicatorColor,
                                          shape: BoxShape.circle,
                                          // border: Border.all(
                                          //   color: TltColors.transparent,
                                          //   width: constructorName == "default"
                                          //       ? sizes[avatarSize]![
                                          //           "indicatorBorderSize "]!
                                          //       : indicatorSize! / 12,
                                          // ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TltAvatarLabelGroup extends StatelessWidget {
  TltAvatarLabelGroup({
    Key? key,
    required this.tltAvatar,
    required this.heading,
    this.headingFontSize = 14,
    Color? headingColor,
    this.subHeading,
    this.subHeadingFontSize,
    this.subHeadingColor,
  })  : headingColor = headingColor ?? TltColors.gray[800],
        super(key: key);

  final TltAvatar tltAvatar;
  final String heading;
  final Color? headingColor;
  final double headingFontSize;
  final String? subHeading;
  final Color? subHeadingColor;
  final double? subHeadingFontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        tltAvatar,
        TltXSpace(headingFontSize / 2.58),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TltItems.text(
              text: heading,
              color: headingColor ?? TltColors.gray[800],
              fontSize: headingFontSize,
            ),
            if (subHeading != null)
              TltItems.text(
                text: subHeading!,
                color: subHeadingColor ?? headingColor!.withOpacity(0.6),
                fontWeight: FontWeight.w500,
                fontSize: subHeadingFontSize ?? headingFontSize * 0.9,
              ),
          ],
        )
      ],
    );
  }
}

class AvatarData {
  final ImageProvider? bgImg;
  final String? text;
  final Color? textColor;
  final Color? bgColor;
  final VoidCallback? onTap;

  AvatarData({
    this.textColor,
    this.onTap,
    this.bgColor,
    this.text,
    this.bgImg,
  });
}

class TltAvatarGroup extends StatelessWidget {
  TltAvatarGroup({
    Key? key,
    required this.avatarRadius,
    required this.avatarData,
    this.textStyle = const TextStyle(),
    Color? focusColor,
  })  : focusColor = focusColor ?? _theme.avatarFocusColor,
        super(key: key);

  final List<AvatarData> avatarData;
  final double avatarRadius;
  final TextStyle? textStyle;
  final Color focusColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            for (var item in avatarData.reversed)
              Padding(
                padding: EdgeInsets.only(
                    left: avatarData.indexOf(item) * avatarRadius * 1.5),
                child: TltAvatar.custom(
                  focusColor: focusColor,
                  onTap: item.onTap,
                  backgroundColor: item.bgColor != null
                      ? item.bgColor!
                      : TltColors.blueLight[50],
                  radius: avatarRadius,
                  backgroundImage: item.bgImg,
                  child: item.text != null
                      ? Text(
                          item.text!.contains(' ')
                              ? "${item.text![0].toUpperCase()}${item.text![item.text!.indexOf(' ') + 1].toUpperCase()}"
                              : item.text![0].toUpperCase(),
                          style: textStyle!.copyWith(
                            color: item.textColor ?? TltColors.blueLight[500],
                            fontWeight: FontWeight.w900,
                            fontSize: avatarRadius - 4,
                          ),
                        )
                      : const SizedBox(),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
