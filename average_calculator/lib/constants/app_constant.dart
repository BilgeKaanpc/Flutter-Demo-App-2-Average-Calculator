import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constands {
  static const mainColor = Colors.indigo;
  static const String titleText = "Calculate Average";
  static final TextStyle titleStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: mainColor);

  static BorderRadius borderRadius = BorderRadius.circular(16);

  static final TextStyle lessonCountText = GoogleFonts.quicksand(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: mainColor,
  );
  static final TextStyle averageTextStyle = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w800,
    color: mainColor,
  );

  static const dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static const horizontalPadding8 = EdgeInsets.symmetric(horizontal:8);
}
