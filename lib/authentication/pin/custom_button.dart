// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnName;
  final Function() onPressed;
  // final GlobalKey formKey;
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.btnName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
      alignment: Alignment.center,
      width: 130,
      height: 50,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(8.0),
        //  splashColor: Colors.deepOrange,
        focusElevation: 50,
        onPressed: onPressed,
        height: 50,
        minWidth: 130,
        child: Text(
          btnName.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14 * MediaQuery.of(context).textScaleFactor,
              color: Colors.grey[700],
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
