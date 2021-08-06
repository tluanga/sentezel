import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentezel/common/ui/widget/settingsEllipse_widget.dart';

class TopBarNewItemWidget extends StatelessWidget {
  final String title;
  final Function onSave;
  const TopBarNewItemWidget({
    Key? key,
    required this.title,
    required this.onSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
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
                  onTap: () {
                    onSave();
                    Navigator.pop(context);
                  },
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
                    Navigator.pop(context);
                    // Navigator.pushReplacementNamed(context, RouteConstant.home);
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
