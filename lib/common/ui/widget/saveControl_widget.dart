import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaveWidget extends StatelessWidget {
  final Function onSave;
  const SaveWidget({Key? key, required this.onSave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
