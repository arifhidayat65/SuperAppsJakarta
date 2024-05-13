import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static const String primaryFont = 'Nunito';

  static final TextStyle descriptionSmall = GoogleFonts.getFont(
    primaryFont,
    fontSize: 14,
  );

  static final TextStyle headline1 = GoogleFonts.getFont(
    primaryFont,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
  );

  static final TextStyle headline2 = GoogleFonts.getFont(
    primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
