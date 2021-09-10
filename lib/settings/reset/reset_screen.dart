import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/iconButton_widget.dart';
import 'package:sentezel/common/ui/widget/topBar_widget.dart';
import 'package:sentezel/settings/reset/reset_button.dart';

class ResetScreen extends HookConsumerWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Container(
        child: Column(
          children: [
            TopBarWidget(
              title: 'Reset',
              onClose: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 250,
            ),
            ResetButton(),
          ],
        ),
      ),
    );
  }
}
