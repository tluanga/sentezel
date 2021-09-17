import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/top_bar_widget.dart';

import 'package:sentezel/settings/restore/restore_button.dart';
import 'package:sentezel/settings/restore/restore_controller.dart';
import 'package:sentezel/settings/restore/restore_model.dart';

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
          GestureDetector(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowMultiple: false,
                // allowedExtensions: ['jpg', 'pdf', 'doc'],
                allowedExtensions: ['zip'],
              );
              if (result != null) {
                ref.read(restoreControllerProvider.notifier).setState(Restore(
                    backupFileIsPicked: true,
                    backupFilePath: result.files.first.path!));
                ref.read(restoreControllerProvider.notifier).restore();
              }
            },
            child: const RestoreButton(),
          ),
        ],
      ),
    );
  }
}
