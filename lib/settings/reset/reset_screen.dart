import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/top_bar_widget.dart';
import 'package:sentezel/settings/reset/reset_button.dart';

class ResetScreen extends HookConsumerWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Column(
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
          const ResetButton(),
        ],
      ),
    );
  }
}
