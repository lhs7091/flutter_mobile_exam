import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appBar(BuildContext context, {String title = 'SNS'}) {
  return AppBar(
    title: Text(
      title,
      style: GoogleFonts.pacifico(
        color: Colors.black.withOpacity(0.5),
        fontSize: 50.0,
      ),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).primaryColor,
  );
}
