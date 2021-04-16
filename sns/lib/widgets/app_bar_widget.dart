import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appBar(BuildContext context, {String title = 'SNS'}) {
  return AppBar(
    title: Text(
      title,
      style: GoogleFonts.pacifico(
        fontSize: 50,
        color: Colors.black,
      ),
    ),
  );
}
