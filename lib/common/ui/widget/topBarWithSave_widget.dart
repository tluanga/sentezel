import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentezel/common/ui/widget/settingsEllipse_widget.dart';

class TopBarWithSaveWidget extends StatelessWidget {
  final String title;
  final Function onSave;
  final Function onCancel;
  const TopBarWithSaveWidget({
    Key? key,
    required this.title,
    required this.onSave,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: 2,
        right: 2,
      ),
      child: Row(
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
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onSave(),
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Icon(
                      CupertinoIcons.checkmark_circle,
                      size: 45,
                      color: Colors.green.shade400,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onCancel();
                    Navigator.pop(context);
                  },
                  child: Icon(
                    CupertinoIcons.xmark_circle,
                    size: 45,
                    color: Colors.red.shade400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
