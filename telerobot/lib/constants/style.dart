import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: const Color(0xFFF15F22),
  scaffoldBackgroundColor: Colors.white70,
  textTheme: GoogleFonts.oswaldTextTheme(),
);

ThemeData darkTheme = ThemeData(
  backgroundColor: Colors.black87,
  primaryColor: const Color(0xFFF15F22),
  scaffoldBackgroundColor: Colors.black87,
  textTheme: GoogleFonts.oswaldTextTheme(),
  iconTheme: const IconThemeData(color: Colors.white),
);
