import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textLabel({
  required BuildContext context,
  required String text,
  double? fontSize, // Null
  Color? color,
  FontWeight? fontWeight,
  double? letterSpacing,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontSize: fontSize ?? 14,
      color: color ?? Theme.of(context).primaryColor,
      fontWeight: fontWeight ?? FontWeight.w500,
      letterSpacing: letterSpacing ?? 0,
    ),
    overflow: TextOverflow.visible,
    textAlign: textAlign,
  );
}
