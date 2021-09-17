import 'package:flutter/material.dart';

class SentezelFloatingActionButton extends StatelessWidget {
  final Function onPressed;
  const SentezelFloatingActionButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => onPressed(),
      child: Container(
        height: 70,
        width: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          'assets/icons/add.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
