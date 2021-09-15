import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/top_bar_widget.dart';

import 'package:sentezel/settings/restore/restore_button.dart';

class RestoreScreen extends HookConsumerWidget {
  const RestoreScreen({Key? key}) : super(key: key);

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
          const RestoreButton(),
        ],
      ),
    );
  }
}
