import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

Widget icons(IconData _iconer, String _open, [Color colore]) {
  return IconButton(
      icon: Icon(
        _iconer,
        size: 15.0,
        color: colore == null ? Colors.white70 : colore,
      ),
      onPressed: () {
        js.context.callMethod('open', [
          'https://$_open.com'
        ]); //can create issue bcause this is web plugin
      });
}
