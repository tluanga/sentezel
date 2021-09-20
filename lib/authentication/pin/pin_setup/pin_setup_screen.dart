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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Material(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Spacer(
                  flex: 1,
                ),
                widgetTitle(),
                const Spacer(
                  flex: 2,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                      color: Colors.white, // Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none, labelText: 'Pass Phrase'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white, // Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ]),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
                const Spacer(
                  flex: 6,
                ),
                CustomButton(
                    title: 'Continue',
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(RouteConstant.home);
                    }),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  widgetTitle() => const PinTitle(
        icon: CupertinoIcons.pencil_ellipsis_rectangle,
        text: 'Set PIN',
      );
}
