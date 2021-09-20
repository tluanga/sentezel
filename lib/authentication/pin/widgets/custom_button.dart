import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomButton extends HookConsumerWidget {
  final String title;
  final Function onPressed;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
      alignment: Alignment.center,
      width: 130,
      height: 50,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(8.0),
        focusElevation: 50,
        height: 50,
        minWidth: 130,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
              fontWeight: FontWeight.bold),
        ),
        // On Pressed
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
