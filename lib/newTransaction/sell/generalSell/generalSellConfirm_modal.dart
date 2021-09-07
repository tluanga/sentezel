import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/purchase/purchaseOfMaterial/purchaseOfMaterial_controller.dart';

class PurchaseOfMaterialConfirmationBottomSheet extends HookConsumerWidget {
  final Function onConfirm;
  final Function onCancel;
  final double itemFontSize = 16;
  const PurchaseOfMaterialConfirmationBottomSheet({
    Key? key,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(purchaseOfMaterialControllerProvider);

    return Material(
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 30,
              decoration: BoxDecoration(color: Colors.redAccent[100]),
              child: Center(
                child: Text(
                  'Please Confirm Transaction Summary before Submit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Row(
                      children: [
                        Text(
                          'Comment :',
                          style: TextStyle(
                            color: Palette.blackGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          state.particular!,
                          style: TextStyle(
                            color: Palette.blackGrey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(
                          color: Palette.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        ':',
                        style: TextStyle(
                          color: Palette.textColor,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        DateFormat('dd-EE-yyyy').format(state.date),

                        // formatter.format(model.transaction.date),
                        style: TextStyle(
                          color: Palette.textColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(color: Palette.textColor),
                columnWidths: {
                  0: FractionColumnWidth(.6),
                  1: FractionColumnWidth(.2),
                  2: FractionColumnWidth(.2),
                },
                children: [
                  _tableHeader(),
                  //---------------DEBIT SIDE-----------

                  _debitSide(
                    debitSideLedgerName: state.debitSideLedger!.name,
                    amount: state.debitAmount,
                  ),

                  //--------------CREDIT SIDE-----
                  if (state.mode == TransactionMode.credit ||
                      state.mode == TransactionMode.partialPaymentByCash ||
                      state.mode == TransactionMode.partialPaymentByBank)
                    _creditSide(
                      creditSideLedgerName: state.partyLedger!.name,
                      amount: state.creditAmount,
                    ),
                  //--Normal Payment -- Non Credit- Non Partial
                  if (state.mode == TransactionMode.paymentByCash ||
                      state.mode == TransactionMode.paymentByBank)
                    _creditSide(
                        creditSideLedgerName: state.creditSideLedger!.name,
                        amount: state.creditAmount),

                  //---Partial Payment
                  if (state.mode == TransactionMode.partialPaymentByCash ||
                      state.mode == TransactionMode.partialPaymentByBank)
                    _creditSide(
                      creditSideLedgerName: state.creditSideLedger!.name,
                      amount: state.partialPaymentAmount,
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.blue.shade400),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(
                    'Confirm',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Palette.textColor,
                    ),
                  ),
                  leading: Icon(CupertinoIcons.checkmark_alt),
                  onTap: () {
                    this.onConfirm();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.red.shade400),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Palette.textColor,
                    ),
                  ),
                  leading: Icon(CupertinoIcons.nosign),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _tableHeader() {
    return TableRow(
      children: [
        Container(
          height: 25,
          child: Center(
            child: Text(
              'Particulars',
              style: TextStyle(
                fontSize: itemFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          height: 25,
          child: Center(
            child: Text(
              'Debit',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          height: 28,
          child: Center(
            child: Text(
              'Credit',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  //---------------Debit Side------------
  _debitSide({required String debitSideLedgerName, required int amount}) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  debitSideLedgerName,
                  style: TextStyle(
                    color: Palette.textColor,
                    fontSize: itemFontSize,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    'Dr.',
                    style: TextStyle(
                      color: Palette.textColor,
                      fontSize: itemFontSize,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Center(
              child: Text(
                amount.toString(),
                style: TextStyle(
                  color: Palette.textColor,
                  fontSize: itemFontSize,
                ),
              ),
            ),
          ),
        ),
        Container()
      ],
    );
  }

  //------------------CREDIT SIDE ------------------
  _creditSide({required String creditSideLedgerName, required int amount}) {
    return //-----------------Credit Side-----------------
        TableRow(
      children: [
        Container(
          height: 40,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'To',
                  style: TextStyle(
                    color: Palette.textColor,
                    fontSize: itemFontSize,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                creditSideLedgerName,
                style: TextStyle(
                  color: Palette.textColor,
                  fontSize: itemFontSize,
                ),
              ),
            ],
          ),
        ),
        Container(),
        Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                amount.toString(),
                style: TextStyle(
                  color: Palette.textColor,
                  fontSize: itemFontSize,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
