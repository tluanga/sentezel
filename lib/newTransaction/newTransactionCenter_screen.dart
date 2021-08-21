import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/newTransaction/purchase/purchaseOfAsset/purchaseOfAsset_screen.dart';
import 'package:sentezel/newTransaction/purchase/purchaseOfMaterial/purchaseOfMaterial_screen.dart';
import 'package:sentezel/newTransaction/purchase/purchaseReturn/purchaseReturn_screen.dart';
import 'package:sentezel/newTransaction/sell/generalSell/generalSell_screen.dart';
import 'package:sentezel/newTransaction/sell/sellReturn/sellReturn_screen.dart';
import 'package:sentezel/settings/ledgerMaster/legerMaster_screen.dart';

class NewTranscationCenterScreen extends StatelessWidget {
  const NewTranscationCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        color: Palette.background,
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
                    label: 'Purchase of Asset',
                    icon: CupertinoIcons.cube,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PurchaseOfAssetScreen(),
                        ),
                      );
                    },
                  ),
                ),
                _item(
                  context: context,
                  label: 'Purchase of Material',
                  icon: CupertinoIcons.cube_box,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PurchaseOfMaterialScreen(),
                      ),
                    );
                  },
                ),
                _item(
                  context: context,
                  label: 'Purchase Return',
                  icon: CupertinoIcons.selection_pin_in_out,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PurchaseReturnScreen(),
                      ),
                    );
                  },
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
                    label: 'Sell of Products',
                    icon: CupertinoIcons.dot_square,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GeneralSellScreen(),
                        ),
                      );
                    },
                  ),
                ),
                _item(
                  context: context,
                  label: 'Sell Return',
                  icon: CupertinoIcons.hurricane,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SellReturnScreen(),
                      ),
                    );
                  },
                ),
                _item(
                  context: context,
                  label: 'Receipt',
                  icon: CupertinoIcons.list_bullet_below_rectangle,
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _item(
                  context: context,
                  label: 'Payment',
                  icon: CupertinoIcons.square_arrow_down_on_square,
                  onTap: () {},
                ),
                _item(
                  context: context,
                  label: 'Debt Repayment',
                  icon: CupertinoIcons.square_on_circle,
                  onTap: () {},
                ),
                _item(
                  context: context,
                  label: 'Credit Repayment',
                  icon: CupertinoIcons.square_stack,
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _item(
                  context: context,
                  label: 'Contra',
                  icon: CupertinoIcons.square_line_vertical_square_fill,
                  onTap: () {},
                ),
                _item(
                  context: context,
                  label: 'Capital Injection',
                  icon: CupertinoIcons.square_stack_3d_down_dottedline,
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
