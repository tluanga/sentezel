import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/common/ui/screens/controlCenter_screen.dart';

class SettingsEllipseWidget extends StatelessWidget {
  const SettingsEllipseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              
              showCupertinoModalBottomSheet(
                expand: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) => ControlCenterScreen(),
              );
            },
            child: Icon(
              CupertinoIcons.ellipsis,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
