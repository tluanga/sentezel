import 'package:flutter/material.dart';

class MoneyInputField extends StatelessWidget {
  final String label;
  const MoneyInputField({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
    );
  }
}
