import 'package:flutter/material.dart';
import 'package:tlt_design/src/foundations/colors.dart';
import 'package:tlt_design/src/foundations/text_styles.dart';
import 'package:tlt_design/src/utils/icons.dart';

/// A collection of commonly used UI elements for TLT design system.
class TltItems {
  /// Creates a dot widget.
  static Container dot({
    double dotSize = 5.5,
    Color? dotColor,
  }) {
    return Container(
      height: dotSize,
      width: dotSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: dotColor ?? TltColors.blue[500],
      ),
    );
  }

  /// Creates an icon widget.
  static Icon icon({
    double? iconSize,
    IconData iconData = TltIcons.user,
    Color? iconColor,
  }) {
    return Icon(
      iconData,
      size: iconSize,
      color: iconColor ?? TltColors.blue[500],
    );
  }

  /// Creates an avatar widget.
  static Container avatar({
    double radius = 18.0,
    ImageProvider? imageData,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 2),
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: TltColors.white,
        ),
        shape: BoxShape.circle,
        image: imageData != null
            ? DecorationImage(
                image: imageData,
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: imageData == null
          ? Icon(TltIcons.user, size: radius * 0.7, color: TltColors.blue[500])
          : null,
    );
  }

  /// Creates a text widget.
  static Text text({
    required String text,
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? TltColors.blue[500],
        fontWeight: fontWeight ?? FontWeight.w600,
      ),
    );
  }

  /// Creates a menu item widget with optional prefix, text, hint text, and suffix.
  static Widget menuItem({
    Widget? prefix,
    String? text,
    TextStyle? textStyle,
    String? hintText,
    TextStyle? hintStyle,
    Widget? suffix,
  }) =>
      Row(
        children: [
          if (prefix != null) prefix,
          Expanded(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '  ${text ?? ''}',
                    style: textStyle ??
                        TltStyles.body1.copyWith(color: TltColors.gray[900]),
                  ),
                  TextSpan(
                    text: '  ${hintText ?? ''}',
                    style: hintStyle ??
                        TltStyles.body1.copyWith(color: TltColors.gray[500]),
                  ),
                ],
              ),
            ),
          ),
          if (suffix != null) suffix,
        ],
      );

  /// Creates a notification text widget with specified text, background color, font color, radius, and font size.
  static Widget notificationText({
    String text = "0",
    Color bgColor = TltColors.error,
    Color fontColor = TltColors.white,
    double radius = 20,
    double fontSize = 12,
  }) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: fontColor,
            fontSize: fontSize,
            height: 1,
          ),
        ),
      ),
    );
  }
}
