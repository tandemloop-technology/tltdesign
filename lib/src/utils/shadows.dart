import 'package:flutter/material.dart';

/// A class containing static methods to generate box shadow configurations of various strengths and sizes.
class TltShadow {
  /// Generates a list of box shadows of extra small size and light strength.
  static List<BoxShadow> xs({Color? color}) => [
        BoxShadow(
          color: color ?? const Color(0x0c101828),
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ];

  /// Generates a list of box shadows of small size and moderate strength.
  static List<BoxShadow> sm({Color? color}) => [
        const BoxShadow(
          color: Color(0x0f101828),
          blurRadius: 2,
          offset: Offset(0, 1),
        ),
        const BoxShadow(
          color: Color(0x19101828),
          blurRadius: 3,
          offset: Offset(0, 1),
        ),
      ];

  /// Generates a list of box shadows of medium size and moderate strength.
  static List<BoxShadow> md({Color? color}) => [
        BoxShadow(
          color: color ?? const Color(0x0f101828),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
        BoxShadow(
          color: color ?? const Color(0x19101828),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ];

  /// Generates a list of box shadows of large size and strong strength.
  static List<BoxShadow> lg({Color? color}) => [
        BoxShadow(
          color: color ?? const Color(0x0c101828),
          blurRadius: 6,
          offset: const Offset(0, 4),
        ),
        BoxShadow(
          color: color ?? const Color(0x19101828),
          blurRadius: 16,
          offset: const Offset(0, 12),
        ),
      ];

  /// Generates a list of box shadows of extra large size and strong strength.
  static List<BoxShadow> xl({Color? color}) => [
        BoxShadow(
          color: color ?? const Color(0x0a101828),
          blurRadius: 8,
          offset: const Offset(0, 8),
        ),
        BoxShadow(
          color: color ?? const Color(0x19101828),
          blurRadius: 24,
          offset: const Offset(0, 20),
        ),
      ];

  /// Generates a list of box shadows of double extra large size and strong strength.
  static List<BoxShadow> xxl({Color? color}) => [
        BoxShadow(
          color: color ?? const Color(0x3f0f1728),
          blurRadius: 48,
          offset: const Offset(0, 24),
        ),
      ];

  /// Generates a list of box shadows of triple extra large size and strong strength.
  static List<BoxShadow> xxxl({Color? color}) => [
        BoxShadow(
          color: color ?? const Color(0x330f1728),
          blurRadius: 64,
          offset: const Offset(0, 32),
        ),
      ];
}
