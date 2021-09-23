import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:sentezel/authentication/pin/pin_setup/pin_setup_controller.dart';

import 'package:sentezel/authentication/pin/widgets/custom_button.dart';
import 'package:sentezel/authentication/pin/widgets/pin_text_field.dart';
import 'package:sentezel/authentication/pin/widgets/title.dart';
import 'package:sentezel/common/constants/route_constant.dart';

import 'package:sentezel/common/ui/widget/elevated_container.dart';

// --Note for rca-pin_code_fields 7.3.0   heihi hmanga mai ang aw..

class PinSetupScreen extends HookConsumerWidget {
  const PinSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pinSetupControllerProvider);
    useEffect(() {
      ref.read(pinSetupControllerProvider.notifier).validate();
    }, [state]);

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Material(
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
                ElevatedContainer(
                  outerBottomPadding: 10,
                  innerHorzPadding: 0,
                  child: TextFormField(
                    //keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.code,
                          color: Colors.blue,
                        ),
                        border: InputBorder.none,
                        labelText: 'Pass Phrase'),
                    onChanged: (value) {
                      ref.read(pinSetupControllerProvider.notifier).setState(
                            state.copyWith(passPhrase: value),
                          );
                    },
                  ),
                ),
                ElevatedContainer(
                  outerBottomPadding: 0,
                  innerHorzPadding: 12,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    child: Column(
                      children: [
                        PinTextField(
                          title: "Enter Four Digit PIN",
                          onChanged: (value) {
                            ref
                                .read(pinSetupControllerProvider.notifier)
                                .setState(
                                  state.copyWith(
                                    pin: value,
                                  ),
                                );
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        PinTextField(
                          title: "Confirm PIN",
                          onChanged: (value) {
                            ref
                                .read(pinSetupControllerProvider.notifier)
                                .setState(
                                  state.copyWith(
                                    pinReEnter: value,
                                  ),
                                );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                state.error.isNotEmpty
                    ? Container(
                        padding: EdgeInsets.only(top: 20),
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ListView.builder(
                          itemCount: state.error.length,
                          itemBuilder: (context, index) {
                            return Text(
                              EnumToString.convertToString(state.error[index],
                                  camelCase: true),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xff616161),
                              ),
                            );
                          },
                        ),
                      )
                    : Container(),
                const Spacer(
                  flex: 6,
                ),
                if (state.error.isEmpty && state.passPhrase.isNotEmpty)
                  CustomButton(
                      title: 'Continue',
                      onPressed: () {
                        ref.read(pinSetupControllerProvider.notifier).save();
                        Navigator.of(context)
                            .pushReplacementNamed(RouteConstant.home);
                      }),
                // const SizedBox(
                //   height: 10,
                // ),
                Spacer(),
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
