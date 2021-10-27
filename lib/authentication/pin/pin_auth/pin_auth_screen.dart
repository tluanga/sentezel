import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sentezel/authentication/pin/pin_auth/pin_auth_controller.dart';
import 'package:sentezel/authentication/pin/pin_setup/pin_setup_controller.dart';
import 'package:sentezel/authentication/pin/widgets/pin_text_field.dart';
import 'package:sentezel/authentication/pin/widgets/title.dart';
import 'package:sentezel/common/constants/route_constant.dart';
import 'package:sentezel/common/ui/widget/elevated_container.dart';

class PinAuthenticationScreen extends HookConsumerWidget {
  const PinAuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pinAuthControllerProvider);
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
                                .read(pinAuthControllerProvider.notifier)
                                .setEnterPin(value);
                            value;

                            if (state.pin == value) {
                              Navigator.of(context)
                                  .pushReplacementNamed(RouteConstant.home);
                            }
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
                if (state.error.isNotEmpty) Text(state.error),
                const Spacer(
                  flex: 6,
                ),
                // if (state.error.isEmpty && state.passPhrase.isNotEmpty)
                //   CustomButton(
                //       title: 'Continue',
                //       onPressed: () {
                //         Navigator.of(context)
                //             .pushReplacementNamed(RouteConstant.home);
                //       }),
                // const SizedBox(
                //   height: 10,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  widgetTitle() => const PinTitle(
        icon: CupertinoIcons.pencil_ellipsis_rectangle,
        text: 'Enter PIN',
      );
}
