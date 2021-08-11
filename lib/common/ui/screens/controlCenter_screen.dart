import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentezel/common/constants/route_constant.dart';
import 'package:sentezel/common/constants/ui_constant.dart';
import 'package:sentezel/settings/businessProfile/businessProfile_screen.dart';
import 'package:sentezel/settings/ledgerMaster/legerMaster_screen.dart';
import 'package:sentezel/settings/party/party_screen.dart';

class ControlCenterScreen extends StatelessWidget {
  const ControlCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        color: UiConstant.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: _item(
                    context: context,
                    label: 'Books',
                    icon: CupertinoIcons.book,
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, RouteConstant.books);
                    },
                  ),
                ),
                _item(
                  context: context,
                  label: 'Analytics',
                  icon: CupertinoIcons.chart_bar,
                  onTap: () {},
                ),
                _item(
                  context: context,
                  label: 'New Transaction',
                  icon: CupertinoIcons.selection_pin_in_out,
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: _item(
                    context: context,
                    label: 'Ledger Master',
                    icon: CupertinoIcons.doc_append,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LedgerMasterScreen(),
                        ),
                      );
                    },
                  ),
                ),
                _item(
                  context: context,
                  label: 'Transaction Type',
                  icon: CupertinoIcons.app_badge,
                  onTap: () {},
                ),
                _item(
                  context: context,
                  label: 'Business Profile',
                  icon: CupertinoIcons.list_bullet_below_rectangle,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BusinessProfileSceen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _item(
                  context: context,
                  label: 'Assets',
                  icon: CupertinoIcons.doc_append,
                  onTap: () {},
                ),
                _item(
                  context: context,
                  label: 'Party',
                  icon: CupertinoIcons.app_badge,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PartyScreen(),
                      ),
                    );
                  },
                ),
                _item(
                  context: context,
                  label: 'Change Pin',
                  icon: CupertinoIcons.smallcircle_circle,
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _item(
                  context: context,
                  label: 'Backup',
                  icon: CupertinoIcons.tray_arrow_up,
                  onTap: () {},
                ),
                _item(
                  context: context,
                  label: 'Restore',
                  icon: CupertinoIcons.tray_arrow_down,
                  onTap: () {},
                ),
                _item(
                  context: context,
                  label: 'Reset',
                  icon: CupertinoIcons.gobackward,
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _item(
                  context: context,
                  label: 'About',
                  icon: CupertinoIcons.signature,
                  onTap: () {},
                ),
                _item(
                  context: context,
                  label: 'Logout',
                  icon: CupertinoIcons.eject,
                  onTap: () {},
                ),
                _close(
                  context: context,
                  label: 'Close ',
                  icon: CupertinoIcons.xmark,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _item(
      {required BuildContext context,
      required String label,
      required IconData icon,
      required Function onTap}) {
    double height = MediaQuery.of(context).size.height * 0.14;
    double width = MediaQuery.of(context).size.width * 0.25;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 5),
            Align(
              alignment: Alignment.center,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Icon(
              icon,
              size: 40,
            )
          ],
        ),
      ),
    );
  }

  _close(
      {required BuildContext context,
      required String label,
      required IconData icon,
      required Function onTap}) {
    double height = MediaQuery.of(context).size.height * 0.14;
    double width = MediaQuery.of(context).size.width * 0.25;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 0),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 5),
            Align(
              alignment: Alignment.center,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
