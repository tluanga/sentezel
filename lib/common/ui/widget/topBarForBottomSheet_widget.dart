import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBarForBottomSheetWidget extends StatelessWidget {
  final String label;
  final Function onExit;
  const TopBarForBottomSheetWidget({
    Key? key,
    required this.label,
    required this.onExit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.13,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    onExit();
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
