import 'package:fl_klikfilm/app/styles/kfilm_colors.dart';
import 'package:fl_klikfilm/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KFilmThemes {
  const KFilmThemes._();

  static ThemeData defaultTheme(
    BuildContext context, {
    required String bodyFont,
    required String displayFont,
  }) {
    final TextTheme baseTextTheme = Theme.of(context).textTheme;
    final TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFont, baseTextTheme);
    final TextTheme displayTextTheme = GoogleFonts.getTextTheme(displayFont, baseTextTheme);
    final TextTheme textTheme = displayTextTheme.copyWith(
      bodyLarge: bodyTextTheme.bodyLarge,
      bodyMedium: bodyTextTheme.bodyMedium,
      bodySmall: bodyTextTheme.bodySmall,
      labelLarge: bodyTextTheme.labelLarge,
      labelMedium: bodyTextTheme.labelMedium,
      labelSmall: bodyTextTheme.labelSmall,
    );

    const ColorScheme colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffb4ab),
      surfaceTint: Color(0xffffb4ab),
      onPrimary: Color(0xff561e19),
      primaryContainer: Color(0xff73332d),
      onPrimaryContainer: Color(0xffffdad6),
      secondary: Color(0xffe7bdb8),
      onSecondary: Color(0xff442926),
      secondaryContainer: Color(0xff5d3f3c),
      onSecondaryContainer: Color(0xffffdad6),
      tertiary: Color(0xffe0c38c),
      onTertiary: Color(0xff3f2e04),
      tertiaryContainer: Color(0xff584419),
      onTertiaryContainer: Color(0xfffddfa6),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1a1110),
      onSurface: Color(0xfff1dedc),
      onSurfaceVariant: Color(0xffd8c2bf),
      outline: Color(0xffa08c8a),
      outlineVariant: Color(0xff534341),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff1dedc),
      inversePrimary: Color(0xff904a43),
      primaryFixed: Color(0xffffdad6),
      onPrimaryFixed: Color(0xff3b0907),
      primaryFixedDim: Color(0xffffb4ab),
      onPrimaryFixedVariant: Color(0xff73332d),
      secondaryFixed: Color(0xffffdad6),
      onSecondaryFixed: Color(0xff2c1513),
      secondaryFixedDim: Color(0xffe7bdb8),
      onSecondaryFixedVariant: Color(0xff5d3f3c),
      tertiaryFixed: Color(0xfffddfa6),
      onTertiaryFixed: Color(0xff261900),
      tertiaryFixedDim: Color(0xffe0c38c),
      onTertiaryFixedVariant: Color(0xff584419),
      surfaceDim: Color(0xff1a1110),
      surfaceBright: Color(0xff423735),
      surfaceContainerLowest: Color(0xff140c0b),
      surfaceContainerLow: Color(0xff231918),
      surfaceContainer: Color(0xff271d1c),
      surfaceContainerHigh: Color(0xff322826),
      surfaceContainerHighest: Color(0xff3d3231),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: colorScheme,
      fontFamily: FontFamily.roboto,
      textTheme: textTheme.apply(bodyColor: colorScheme.onSurface, displayColor: colorScheme.onSurface),
      canvasColor: colorScheme.surface,
      scaffoldBackgroundColor: Colors.transparent,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
          foregroundColor: Colors.white,
          backgroundColor: KColors.primary,
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: FontFamily.roboto),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: KColors.primary,
          foregroundColor: Colors.white,
          textStyle: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontFamily: FontFamily.roboto,
          ),
        ),
      ),
    );
  }
}
