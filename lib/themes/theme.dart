import 'package:flutter/material.dart';

class CustomTheme {
  static Color get cyan => const Color(0xFF0CB8B6);

  static Color get lightCyan => const Color(0xFFEBF7F6);

  static Color get blue => const Color(0xFF1D4C92);

  static Color get blueAccent => const Color(0xFF106eea);

  static Color get lightBlue => const Color(0xFF90B0DF);

  static Color get lightBlue2 => const Color(0xFFF2F7FF);

  static Color get red => const Color(0xFFFF3636);

  static Color get white => const Color(0xFFFFFFFF);

  static Color get lightGrey => const Color(0xFFF6F6F6);

  static Color get black => const Color(0xFF000000);

  static Color get disabled => const Color(0xFFDFDFDF);

  static Color get footerBg => const Color(0xFF1F1F1F);

  static Color get footerBg2 => const Color(0xFF171717);

  static Color get accent => const Color(0xFF313131);

  static Color get t1 => const Color(0xFF313131);

  static Color get t2 => const Color(0xFFE3E3E3);

  static Color get t3 => const Color(0xFFFFFFFF);

  static Color get t4 => const Color(0xFF808080);

  static TextStyle get h1 => TextStyle(
        fontSize: 22,
        color: white,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get h2 => TextStyle(
        fontSize: 22,
        color: white,
        fontWeight: FontWeight.w800,
      );
  static TextStyle get h2Black => TextStyle(
        fontSize: 22,
        color: t1,
        fontWeight: FontWeight.w800,
      );
  static TextStyle get h3 => TextStyle(
        fontSize: 22,
        color: t1,
        fontWeight: FontWeight.w800,
      );
  static TextStyle get h3mb5 => TextStyle(
        fontSize: 30,
        color: t1,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get h3mb3 => TextStyle(
        fontSize: 40,
        color: t1,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get h4 => TextStyle(
        fontSize: 18,
        color: t3,
        fontWeight: FontWeight.w800,
      );
  // static TextStyle get h5mb1 => TextStyle(
  //       fontSize: 18,
  //       color: t3,
  //       fontWeight: FontWeight.w800,
  //     );
  static TextStyle get labelBold => TextStyle(
        fontSize: 16,
        color: t1,
        fontWeight: FontWeight.w800,
      );
  static TextStyle get labelWhite => TextStyle(
        fontSize: 16,
        color: t3,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get labelRegular => TextStyle(
        fontSize: 16,
        color: t1,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get labelGrey => TextStyle(
        fontSize: 16,
        color: t2,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get p => TextStyle(
        fontSize: 16,
        color: t4,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );
  static TextStyle footerLinks(bool hover) => TextStyle(
        fontSize: 14,
        color: hover ? cyan : t3,
        fontWeight: FontWeight.w400,
        height: 1.6,
      );

  static BoxDecoration get mainCardDecoration => BoxDecoration(
        color: CustomTheme.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 2.2,
            offset: const Offset(0, 2),
            color: CustomTheme.black.withOpacity(0.09),
          )
        ],
      );
  static BoxDecoration get mainCardDecoration2 => BoxDecoration(
        color: CustomTheme.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: const Offset(0, 0),
            color: CustomTheme.black.withOpacity(0.1),
          )
        ],
      );
}
