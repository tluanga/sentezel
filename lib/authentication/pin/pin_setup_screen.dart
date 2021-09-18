import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/authentication/pin/custom_button.dart';
import 'package:sentezel/common/constants/route_constant.dart';

class PinSetupScreen extends HookConsumerWidget {
  const PinSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Pin',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Re-Enter Pin',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Please Enter Passphrase',
              ),
            ),
            CustomButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(RouteConstant.home);
              },
              btnName: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}
