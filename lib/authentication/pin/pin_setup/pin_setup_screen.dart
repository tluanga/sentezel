import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:sentezel/authentication/pin/widgets/custom_button.dart';
import 'package:sentezel/authentication/pin/widgets/pin_text_field.dart';
import 'package:sentezel/authentication/pin/widgets/title.dart';
import 'package:sentezel/common/constants/route_constant.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// --Note for rca-pin_code_fields 7.3.0   heihi hmanga mai ang aw..

class PinSetupScreen extends HookConsumerWidget {
  const PinSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinController = useTextEditingController();
    final confirmPinController = useTextEditingController();
    useEffect(() {
      // guard clause
      if (confirmPinController.value.text.isEmpty &&
          pinController.value.text.isEmpty) {
        return;
      }

      if (pinController.value.text != confirmPinController.value.text) {
        print('not equal');
      }
    });
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            widgetTitle(),
            const Spacer(
              flex: 2,
            ),
            PinTextField(
              title: "Enter Four Digit PIN",
              textEditingController: pinController,
            ),
            const SizedBox(
              height: 25,
            ),
            PinTextField(
              title: "Confirm PIN",
              textEditingController: confirmPinController,
            ),
            const Spacer(flex: 6),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Pass Phrase'),
            ),
            CustomButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RouteConstant.home);
                })
          ],
        ),
      ),
    );
  }

  widgetTitle() => const PinTitle(
        icon: CupertinoIcons.pencil_ellipsis_rectangle,
        text: 'Set PIN',
      );
}
