import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PinTitle extends StatelessWidget {
  const PinTitle({Key? key, required this.text, required this.icon})
      : super(key: key);
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //  Icon(CupertinoIcons.lock_fill),
        Icon(
          icon,
          size: 37,
          color: Colors.grey[800],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: GoogleFonts.aBeeZee(
            color: Colors.grey[900],
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
