import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final int? fillColor;
  final int? textColor;
  final double? textSize;
  final Function callback;

  const CalculatorButton({
    required this.text,
    this.fillColor,
    this.textColor,
    this.textSize,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 70,
        height: 70,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            backgroundColor:
                fillColor != null ? Color(fillColor!) : Color(0xffeadbc8),
          ),
          onPressed: () => callback(text),
          child: Text(
            text,
            style: GoogleFonts.teko(
              textStyle: TextStyle(
                fontSize: textSize ?? 20,
                color: textColor != null ? Color(textColor!) : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
