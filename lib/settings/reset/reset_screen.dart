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
                      const Spacer(),
                      const Icon(
                        Icons.restore,
                        color: Colors.blue,
                        size: 80,
                      ),
                      const Spacer(),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          ref.read(resetControllerProvider.notifier).reset();
                        },
                        child: const ResetButton(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : GestureDetector(
                    onTap: () {
                      ref.read(resetControllerProvider.notifier).resetState();
                      Navigator.of(context)
                          .pushReplacementNamed(RouteConstant.splashScreen);
                    },
                    child: const Center(
                      child:
                          Text('Reset Completed, you have to restart the app'),
                    ),
                  ));
  }
}
