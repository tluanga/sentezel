import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/constants/route_constant.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/new_transaction/capital_injection/capital_injection_screen.dart';
import 'package:sentezel/new_transaction/contra/contra_screen.dart';
import 'package:sentezel/new_transaction/creditSettlement/creditor_list_screen.dart';

import 'package:sentezel/new_transaction/payment/payment_screen.dart';
import 'package:sentezel/new_transaction/purchase/purchase_of_material/purchase_of_material_screen.dart';
import 'package:sentezel/new_transaction/purchase/purchase_return/purchase_return_screen.dart';

import 'package:sentezel/new_transaction/receipt/receipt_screen.dart';
import 'package:sentezel/new_transaction/sales/general_sales/general_sales_screen.dart';
import 'package:sentezel/new_transaction/sales/sales_return/sales_return_screen.dart';

import 'debtSettlement/debtor_list_screen.dart';

class NewTranscationCenterScreen extends HookConsumerWidget {
  const NewTranscationCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      Navigator.pushNamed(
                          context, RouteConstant.purchaseOfAsset);
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
                        builder: (context) => const PurchaseOfMaterialScreen(),
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
                        builder: (context) => const PurchaseReturnScreen(),
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
                          builder: (context) => const GeneralSalesScreen(),
                        ),
                      );
                    },
                  ),
                ),
                _item(
                  context: context,
                  label: 'Sales Return',
                  icon: CupertinoIcons.hurricane,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SalesReturnScreen(),
                      ),
                    );
                  },
                ),
                _item(
                  context: context,
                  label: 'Receipt',
                  icon: CupertinoIcons.list_bullet_below_rectangle,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReceiptScreen(),
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
                  label: 'Payment',
                  icon: CupertinoIcons.square_arrow_down_on_square,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentScreen(),
                      ),
                    );
                  },
                ),
                _item(
                  context: context,
                  label: 'Debt Settlement',
                  icon: CupertinoIcons.square_on_circle,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DebtorListScreen(),
                      ),
                    );
                  },
                ),
                _item(
                  context: context,
                  label: 'Credit Settlement',
                  icon: CupertinoIcons.square_stack,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreditorListScreen(),
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
                  label: 'Contra',
                  icon: CupertinoIcons.square_line_vertical_square_fill,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ContraScreen(),
                      ),
                    );
                  },
                ),
                _item(
                  context: context,
                  label: 'Capital Injection',
                  icon: CupertinoIcons.square_stack_3d_down_dottedline,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CapitalInjectionScreen(),
                      ),
                    );
                  },
                ),
                _close(
                  context: context,
                  label: 'Close ',
                  icon: CupertinoIcons.xmark,
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RouteConstant.home, ModalRoute.withName('/'));
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
            const SizedBox(height: 5),
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
