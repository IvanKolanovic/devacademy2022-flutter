import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeColors {
  static Color mint500 = const Color(0xff20C5B5);
  static Color mint400 = const Color(0xff40E0D0);
  static Color mint200 = const Color(0xffB7F2EF);
  static Color mint100 = const Color(0xffE9FBFA);
  static Color teal800 = const Color(0xff1A3440);
  static Color teal600 = const Color(0xff5D939B);
  static Color coral500 = const Color(0xffEF976B);
  static Color coral400 = const Color(0xffF3B08E);
  static Color gray500 = const Color(0xff7C7C7C);
  static Color gray300 = const Color(0xffADADAD);
  static Color gray200 = const Color(0xffCACACA);
  static Color gray50 = const Color(0xffF3F3F3);
  static Color red500 = const Color(0xffEF6B6B);
}

final TextTheme textTheme = TextTheme(
  headline1: GoogleFonts.roboto(
    fontSize: 96,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  ),
  headline2: GoogleFonts.roboto(
    fontSize: 72,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  ),
  headline3: GoogleFonts.roboto(
    fontSize: 48,
    fontWeight: FontWeight.w400,
  ),
  headline5: GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w400,
  ),
  headline6: GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ),
  subtitle1: GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  ),
  bodyText1: GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.15,
  ),
  bodyText2: GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ),
  caption: GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  ),
  button: GoogleFonts.roboto(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.4,
  ),
);

ThemeData theme = ThemeData(
  textTheme: textTheme,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 8),
      primary: ThemeColors.mint400, // background (button) color
      onPrimary: Colors.white, // foreground (text) color
      textStyle: textTheme.button,
    ),
  ),
);
