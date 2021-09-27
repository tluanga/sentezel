import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/common/ui/screens/control_center_screen.dart';

class SettingsEllipseWidget extends StatelessWidget {
  const SettingsEllipseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
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
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width * 0.12,
              height: MediaQuery.of(context).size.height * 0.03 + 10,
              child: Row(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Container(
                  //   width: 12.0,
                  //   height: 12.0,
                  //   decoration: const BoxDecoration(
                  //     color: Colors.orange,
                  //     shape: BoxShape.circle,
                  //   ),
                  // ),
                  // Container(
                  //   width: 12.0,
                  //   height: 12.0,
                  //   decoration: const BoxDecoration(
                  //     color: Colors.blue,
                  //     shape: BoxShape.circle,
                  //   ),
                  // ),
                  // Container(
                  //   width: 12.0,
                  //   height: 12.0,
                  //   decoration: const BoxDecoration(
                  //     color: Colors.green,
                  //     shape: BoxShape.circle,
                  //   ),
                  // ),
                  JelloIn(
                    delay: const Duration(milliseconds: 100),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  JelloIn(
                    delay: const Duration(milliseconds: 200),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  JelloIn(
                    delay: const Duration(milliseconds: 300),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
