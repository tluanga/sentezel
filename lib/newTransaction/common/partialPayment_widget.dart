import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PartialPaymentWidget extends HookWidget {
  final TextEditingController controller;
  const PartialPaymentWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.38,
      child: TextFormField(
        decoration: InputDecoration(
            labelText: 'Partial Payment Amount',
            labelStyle: TextStyle(
              fontSize: 14,
            )),
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
