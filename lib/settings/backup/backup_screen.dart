import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/top_bar_widget.dart';
import 'package:sentezel/settings/backup/backup_button.dart';
import 'package:sentezel/settings/backup/backup_controller.dart';
import 'package:sentezel/setup/system_config.dart';
import 'package:share/share.dart';

class BackupScreen extends HookConsumerWidget {
  const BackupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          children: [
            TopBarWidget(
              title: 'Backup',
              onClose: () {
                Navigator.pop(context);
              },
            ),
            const Spacer(),
            const Icon(
              CupertinoIcons.tray_arrow_up,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250,
              child: Text(
                '''Backup all user generated data and save to local and cloud''',
                textAlign: TextAlign.center,
                style: GoogleFonts.aBeeZee(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                await ref.read(backupControllerProvider.notifier).backup();

                await Share.shareFiles([SystemConfig.appBackupFile],
                    text: 'Sentezel Backup @ ${DateTime.now()}');
              },
              child: const BackupButton(),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}
