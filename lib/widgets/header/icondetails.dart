import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget iconContent(IconData _iconer, String _content,
    [double _iconsize, double _textsize, Color colore]) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(
      children: [
        Icon(
          _iconer,
          color: colore == null ? Colors.white : colore,
          size: _iconsize == null ? 20.0 : _iconsize,
        ),
        SizedBox(
          width: 5.0,
        ),
        Text(
          _content,
          style: GoogleFonts.montserrat(
              color: colore == null ? Colors.white : colore,
              fontSize: _textsize == null ? 15.0 : _textsize),
        )
      ],
    ),
  );
}
