import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Construct a color from the lower 32 bits of an [int].
///
/// The bits are interpreted as follows:
///
/// * Bits 24-31 are the alpha value.
/// * Bits 16-23 are the red value.
/// * Bits 8-15 are the green value.
/// * Bits 0-7 are the blue value.
///
/// In other words, if AA is the alpha value in hex, RR the red value in hex,
/// GG the green value in hex, and BB the blue value in hex, a color can be
/// expressed as `const Color(0xAARRGGBB)`.
///
/// For example, to get a fully opaque orange, you would use `const
/// Color(0xFFFF9000)` (`FF` FOR THE ALPHA, `FF` FOR THE RED, `90` FOR THE
/// green, and `00` for the blue).
class KColors {
  KColors._();

  // Only use this getter in development!
  static Color get random {
    double value = math.Random().nextDouble() * 0xFFFFFF;
    return Color((value).toInt()).withOpacity(1.0);
  }

  /// Return `Color` with Hex value => #920705
  static const Color primary = Color(0xFF920705);

  /// Return `Color` with Hex value => #9D1F14
  static const Color crimson = Color(0xFF9D1F14);

  /// Return `Color` with Hex value => #272727
  static const Color grey = Color(0xFF272727);

  /// Return `Color` with Hex value => #1D1D1D
  static const Color primaryGrey = Color(0xFF1D1D1D);

  /// Return `Color` with Hex value => #141416
  static const Color darkGrey = Color(0xFF141416);

  /// Return `Color` with Hex value => #CF0000
  static const Color red = Color(0xFFCF0000);
}
