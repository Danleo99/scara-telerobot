import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(),
  primaryColor: const Color(0xFF0E3B43),
  scaffoldBackgroundColor: Colors.white70,
  textTheme: GoogleFonts.overpassTextTheme(),
);

ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(),
  primaryColor: const Color(0xFF001b2e),
  scaffoldBackgroundColor: Colors.grey[900],
  textTheme: GoogleFonts.overpassTextTheme(),
  // iconTheme: const IconThemeData(color: Colors.white),
);
