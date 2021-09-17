import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/constants/route_constant.dart';
import 'package:sentezel/common/ui/widget/top_bar_widget.dart';
import 'package:sentezel/settings/reset/reset_button.dart';
import 'package:sentezel/settings/reset/reset_controller.dart';

class ResetScreen extends HookConsumerWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(resetControllerProvider);
    return Material(
        child: state == 1
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state == 0
                ? Column(
                    children: [
                      TopBarWidget(
                        title: 'Reset',
                        onClose: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(
                        height: 250,
                      ),
                      GestureDetector(
                        onTap: () {
                          ref.read(resetControllerProvider.notifier).reset();
                        },
                        child: const ResetButton(),
                      ),
                    ],
                  )
                : GestureDetector(
                    onTap: () {
                      ref.read(resetControllerProvider.notifier).resetState();
                      Navigator.of(context)
                          .pushReplacementNamed(RouteConstant.splashScreen);
                    },
                    child: const Text(
                        'Reset Completed, you have to restart the app'),
                  ));
  }
}
