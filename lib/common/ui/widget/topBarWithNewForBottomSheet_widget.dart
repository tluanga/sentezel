import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBarWithNewForBottomSheetWidget extends StatelessWidget {
  final String label;
  final Function onNew;
  const TopBarWithNewForBottomSheetWidget({
    Key? key,
    required this.label,
    required this.onNew,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 22,
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
                    onNew();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Icon(
                      CupertinoIcons.add_circled,
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
