import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData getTheme() => ThemeData(

    colorScheme: ColorScheme.light(
      primary: Colors.orange.shade400,
      surface: const Color.fromARGB(255, 247, 242, 242),
      surfaceContainerLow: Colors.grey.shade300,
      surfaceContainerLowest: Colors.grey.shade600,
      onSurface: Colors.black87
    ),

    textTheme: TextTheme(
      bodyLarge: GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 18
        )
      ),
      bodyMedium: GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 16
        )
      ),
      bodySmall: GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 14
        )
      ),
      titleLarge: GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 20
        )
      ),
      labelLarge: GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 12
        )
      ),

    )
  );
}