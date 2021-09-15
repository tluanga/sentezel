import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/top_bar_for_bottom_sheet_widget.dart';
import 'package:sentezel/settings/backup/backup_button.dart';

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
                label: '',
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
            BackupButton(),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade500,
                ),
              ),
              child: Text(
                '''
              Backup all user generated data and save to local and cloud
              ''',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
