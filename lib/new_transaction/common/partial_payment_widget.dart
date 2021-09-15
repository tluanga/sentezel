import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PartialPaymentWidget extends HookWidget {
  final int defaultValue;
  final int maxAmount;
  final Function(int) onChange;
  const PartialPaymentWidget({
    Key? key,
    required this.onChange,
    required this.defaultValue,
    required this.maxAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 0.38,
      child: TextFormField(
        initialValue: this.defaultValue.toString(),
        onChanged: (value) {
          var _value = value != '' ? int.parse(value) : 0;
          onChange(_value);
        },
        decoration: const InputDecoration(
          labelText: 'Partial Payment Amount',
          labelStyle: TextStyle(
            fontSize: 14,
          ),
        ),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        validator: (value) {
          if (int.parse(value!) >= this.maxAmount) {
            print('Cannot be large or equal to the max amount');
          }
        },
      ),
    );
  }
}
