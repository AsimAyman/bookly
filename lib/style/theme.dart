import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData theme = ThemeData().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff246BFE),
  ),
  textTheme: GoogleFonts.poppinsTextTheme().copyWith(
    titleLarge: const TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 40,
      color: Color(0xff246BFE),
    ),
    bodyLarge: const TextStyle(
      fontWeight: FontWeight.w800,
      // fontSize: 30,
      color: Color(0xff246BFE),
    ),
  ),
);
