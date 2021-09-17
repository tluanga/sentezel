import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/common/ui/screens/control_center_screen.dart';

class SettingsEllipseWidget extends StatelessWidget {
  const SettingsEllipseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            showCupertinoModalBottomSheet(
              expand: true,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const ControlCenterScreen(),
            );
          },
          child: const Icon(
            CupertinoIcons.ellipsis,
            size: 30,
          ),
        ),
      ],
    );
  }
}
