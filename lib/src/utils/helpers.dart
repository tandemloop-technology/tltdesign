import 'package:flutter/widgets.dart';

/// Returns a screen width by using [context]
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

/// Returns a screen height by using [context]
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

/// Returns a screen height in percentages
double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

/// Returns a screen width in percentages
double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;
