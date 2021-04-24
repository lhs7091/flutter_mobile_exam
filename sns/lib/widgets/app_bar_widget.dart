import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appBar(BuildContext context,
    {String title = 'SNS', removeBackButton = false}) {
  return AppBar(
    automaticallyImplyLeading: removeBackButton,
    title: Text(
      title,
      style: GoogleFonts.pacifico(
        fontSize: 40,
        color: Colors.black,
      ),
    ),
  );
}
