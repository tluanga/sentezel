import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.8,
      height: 55,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          // border: Border.all(
          //   color: Colors.grey.shade500,
          // ),
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        'Reset Data',
        style: GoogleFonts.aBeeZee(fontSize: 20, color: Colors.grey[800]),
      ),
    );
  }
}
