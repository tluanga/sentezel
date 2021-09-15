import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestoreButton extends StatelessWidget {
  const RestoreButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade500,
          ),
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          children: const [
            Icon(
              CupertinoIcons.tray_arrow_down,
              size: 80,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Restore Backup',
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
