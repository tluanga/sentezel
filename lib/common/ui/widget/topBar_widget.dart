import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentezel/common/ui/widget/settingsEllipse_widget.dart';

class TopBarWidget extends StatelessWidget {
  final String title;
  final Function onClose;

  const TopBarWidget({Key? key, required this.title, required this.onClose})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SettingsEllipseWidget(),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            this.onClose();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              CupertinoIcons.xmark_circle,
              size: 45,
              color: Colors.red.shade400,
            ),
          ),
        ),
      ],
    );
  }
}
