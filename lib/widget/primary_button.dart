import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Widget primaryButton(
    {required String label,
    required Color backgroundColor,
    required Size size,
    Function()? onPressed,
    double? shadow,
    Color? shadowColor,
    double? borderWidth,
    Color? borderColor,
    Color? textColor,
    bool isLoading = false}) {
  return TextButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(backgroundColor),
      minimumSize: MaterialStatePropertyAll(
        size,
      ),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      elevation: MaterialStatePropertyAll(shadow),
      shadowColor: MaterialStatePropertyAll(
        shadowColor,
      ),
      side: MaterialStatePropertyAll(
        BorderSide(
            color: borderColor ?? Colors.transparent, width: borderWidth ?? 0),
      ),
    ),
    onPressed: onPressed,
    child: isLoading
        ? const CircularProgressIndicator(
            color: Colors.white,
          )
        : Text(
            label,
            style: GoogleFonts.poppins(
                fontSize: 15, color: textColor ?? Colors.white),
          ),
  );
}
