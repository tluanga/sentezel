import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/iconButton_widget.dart';
import 'package:sentezel/common/ui/widget/topBarForBottomSheet_widget.dart';

class BackupScreen extends HookConsumerWidget {
  const BackupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          children: [
            TopBarForBottomSheetWidget(
                label: 'Backup',
                onExit: () {
                  Navigator.pop(context);
                }),
            // Text(
            //   'Backup',
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            STLIconButton(),
          ],
        ),
      )),
    );
  }
}
