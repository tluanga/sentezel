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
          size: 50,
          color: Color(0xff0d47a1),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: GoogleFonts.aBeeZee(
            color: Color(0xff0d47a1),
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
