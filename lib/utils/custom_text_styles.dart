import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  final body = GoogleFonts.poppins().copyWith(
    fontSize: 12,
    color: Colors.black,
  );
  final headings = GoogleFonts.poppins().copyWith(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  final smallHeadings = GoogleFonts.poppins().copyWith(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );
}
