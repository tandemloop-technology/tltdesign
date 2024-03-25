import 'dart:developer';

import 'package:flutter/material.dart';

/// Tandemloop Design System Colors
///
/// It has a ten shades of a color.
///
/// Variants [25], [50], [100], [200], [300], [400], [500], [600], [700], [800], [900]
///
/// Default is [500] all colors.
class TltColors {
  /// Transparent
  ///
  /// Completely invisible.
  static const Color transparent = Color(0x00000000);

  /// Black
  ///
  /// Completely opaque and solid.
  static const Color black = Color(0xFF000000);

  /// White
  ///
  /// Completely opaque.
  static const Color white = Color(0xFFFFFFFF);

  /// Blue Color Default [500]
  static const TltColorShade blue = TltColorShade(
    0xFF2E90FA,
    <int, Color>{
      25: Color(0xFFF5FAFF),
      50: Color(0xFFEFF8FF),
      100: Color(0xFFD1E9FF),
      200: Color(0xFFB2DDFF),
      300: Color(0xFF84CAFF),
      400: Color(0xFF53B1FD),
      500: Color(0xFF2E90FA),
      600: Color(0xFF1570EF),
      700: Color(0xFF175CD3),
      800: Color(0xFF1849A9),
      900: Color(0xFF194185),
    },
  );

  /// Blue Light Color Default [500]
  static const TltColorShade blueLight = TltColorShade(
    0xFF0BA5EC,
    <int, Color>{
      25: Color(0xFFF5FBFF),
      50: Color(0xFFF0F9FF),
      100: Color(0xFFE0F2FE),
      200: Color(0xFFB9E6FE),
      300: Color(0xFF7CD4FD),
      400: Color(0xFF36BFFA),
      500: Color(0xFF0BA5EC),
      600: Color(0xFF0086C9),
      700: Color(0xFF026AA2),
      800: Color(0xFF065986),
      900: Color(0xFF0B4A6F),
    },
  );

  /// Blue Gray Color Default [500]
  static const TltColorShade blueGray = TltColorShade(
    0xFF4E5BA6,
    <int, Color>{
      25: Color(0xFFFCFCFD),
      50: Color(0xFFF8F9FC),
      100: Color(0xFFEAECF5),
      200: Color(0xFFC8CCE5),
      300: Color(0xFF9EA5D1),
      400: Color(0xFF717BBC),
      500: Color(0xFF4E5BA6),
      600: Color(0xFF3E4784),
      700: Color(0xFF363F72),
      800: Color(0xFF293056),
      900: Color(0xFF101323),
    },
  );

  /// Gray Color Default [500]
  static const TltColorShade gray = TltColorShade(
    0xFF667085,
    <int, Color>{
      25: Color(0xFFFCFCFD),
      50: Color(0xFFF9FAFB),
      100: Color(0xFFF2F4F7),
      200: Color(0xFFE4E7EC),
      300: Color(0xFFD0D5DD),
      400: Color(0xFF98A2B3),
      500: Color(0xFF667085),
      600: Color(0xFF475467),
      700: Color(0xFF344054),
      800: Color(0xFF1D2939),
      900: Color(0xFF101828),
    },
  );

  /// Indigo Color Default [500]
  static const TltColorShade indigo = TltColorShade(
    0xFF6172F3,
    <int, Color>{
      25: Color(0xFFF5F8FF),
      50: Color(0xFFEEF4FF),
      100: Color(0xFFE0EAFF),
      200: Color(0xFFC7D7FE),
      300: Color(0xFFA4BCFD),
      400: Color(0xFF8098F9),
      500: Color(0xFF6172F3),
      600: Color(0xFF444CE7),
      700: Color(0xFF3538CD),
      800: Color(0xFF2D31A6),
      900: Color(0xFF2D3282),
    },
  );

  /// Purple Color Default [500]
  static const TltColorShade purple = TltColorShade(
    0xFF9E77ED,
    <int, Color>{
      25: Color(0xFFFCFAFF),
      50: Color(0xFFF9F5FF),
      100: Color(0xFFF4EBFF),
      200: Color(0xFFE9D7FE),
      300: Color(0xFFD6BBFB),
      400: Color(0xFFB692F6),
      500: Color(0xFF9E77ED),
      600: Color(0xFF7F56D9),
      700: Color(0xFF6941C6),
      800: Color(0xFF53389E),
      900: Color(0xFF42307D),
    },
  );

  /// Pink Color Default [500]
  static const TltColorShade pink = TltColorShade(
    0xFFEE46BC,
    <int, Color>{
      25: Color(0xFFFEF6FB),
      50: Color(0xFFFDF2FA),
      100: Color(0xFFFCE7F6),
      200: Color(0xFFFCCEEE),
      300: Color(0xFFFAA7E0),
      400: Color(0xFFF670C7),
      500: Color(0xFFEE46BC),
      600: Color(0xFFDD2590),
      700: Color(0xFFC11574),
      800: Color(0xFF9E165F),
      900: Color(0xFF851651),
    },
  );

  /// Violet Color Default [500]
  static const TltColorShade violet = TltColorShade(
    0xFF7A5AF8,
    <int, Color>{
      25: Color(0xFFFAFAFF),
      50: Color(0xFFF4F3FF),
      100: Color(0xFFEBE9FE),
      200: Color(0xFFD9D6FE),
      300: Color(0xFFBDB4FE),
      400: Color(0xFF9B8AFB),
      500: Color(0xFF7A5AF8),
      600: Color(0xFF6938EF),
      700: Color(0xFF5925DC),
      800: Color(0xFF4A1FB8),
      900: Color(0xFF3E1C96),
    },
  );

  /// Orange Color Default [500]
  static const TltColorShade orange = TltColorShade(
    0xFFFB6514,
    <int, Color>{
      25: Color(0xFFFFFAF5),
      50: Color(0xFFFFF6ED),
      100: Color(0xFFFFEAD5),
      200: Color(0xFFFDDCAB),
      300: Color(0xFFFEB273),
      400: Color(0xFFFD853A),
      500: Color(0xFFFB6514),
      600: Color(0xFFEC4A0A),
      700: Color(0xFFC4320A),
      800: Color(0xFF9C2A10),
      900: Color(0xFF7E2410),
    },
  );

  /// Rose Color Default [500]
  static const TltColorShade rose = TltColorShade(
    0xFFF63D68,
    <int, Color>{
      25: Color(0xFFFFF5F6),
      50: Color(0xFFFFF1F3),
      100: Color(0xFFFFE4E8),
      200: Color(0xFFFECDD6),
      300: Color(0xFFFEA3B4),
      400: Color(0xFFFD6F8E),
      500: Color(0xFFF63D68),
      600: Color(0xFFE31B54),
      700: Color(0xFFC01048),
      800: Color(0xFFA11043),
      900: Color(0xFF89123E),
    },
  );

  /// Error Color Default [500]
  static const TltColorShade error = TltColorShade(
    0xFFF04438,
    <int, Color>{
      25: Color(0xFFFFFBFA),
      50: Color(0xFFFEF3F2),
      100: Color(0xFFFEE4E2),
      200: Color(0xFFFECDCA),
      300: Color(0xFFFDA29B),
      400: Color(0xFFF97066),
      500: Color(0xFFF04438),
      600: Color(0xFFD92D20),
      700: Color(0xFFB42318),
      800: Color(0xFF912018),
      900: Color(0xFF7A271A),
    },
  );

  /// Warning Color Default [500]
  static const TltColorShade warning = TltColorShade(
    0xFFF79009,
    <int, Color>{
      25: Color(0xFFFFFCF5),
      50: Color(0xFFFFFAEB),
      100: Color(0xFFFEF0C7),
      200: Color(0xFFFEDF89),
      300: Color(0xFFFEC84B),
      400: Color(0xFFFDB022),
      500: Color(0xFFF79009),
      600: Color(0xFFDC6803),
      700: Color(0xFFB54708),
      800: Color(0xFF93370D),
      900: Color(0xFF7A2E0E),
    },
  );

  /// Success Color Default [500]
  static const TltColorShade success = TltColorShade(
    0xFF12B76A,
    <int, Color>{
      25: Color(0xFFF6FEF9),
      50: Color(0xFFECFDF3),
      100: Color(0xFFD1FADF),
      200: Color(0xFFA6F4C5),
      300: Color(0xFF6CE9A6),
      400: Color(0xFF32D583),
      500: Color(0xFF12B76A),
      600: Color(0xFF039855),
      700: Color(0xFF027A48),
      800: Color(0xFF05603A),
      900: Color(0xFF054F31),
    },
  );
}

/// [TltDesign] have its own Colors shade generator that is basically extends the [ColorSwatch] from material.
class TltColorShade extends ColorSwatch<int> {
  const TltColorShade(int primary, Map<int, Color> swatch)
      : super(primary, swatch);

  @override
  Color operator [](int index) {
    try {
      return super[index]!;
    } catch (err) {
      log(
        '[$index] is not a valid color shade index. \nUse one of the following: [25, 50, 100, 200, 300, 400, 500, 600, 700, 800, 900]',
        name: 'TLT',
      );
      throw "[$index] is not a valid color shade index.";
    }
  }
}
