import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecorations({
    required String labelText,
    IconData? prefixIcon,
}) {
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Color(0xFF9E007E)
          ),
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xFF9E007E),
                width: 3
            )
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Color(0xFF9E007E),
        ),
        prefixIcon: prefixIcon != null
          ? Icon(prefixIcon, color: Color(0xFF9E007E))
          : null
    );
  }
}