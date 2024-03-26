import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData theme = ThemeData().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff246BFE),
    primary: const Color(0xff246BFE),
  ),
  textTheme: GoogleFonts.poppinsTextTheme().copyWith(
    titleLarge: const TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xff246BFE),
    ),
  ),
);

abstract class ColorsHandler {
  static const Color kGrey1 = Color(0xffFAFAFA);
}
