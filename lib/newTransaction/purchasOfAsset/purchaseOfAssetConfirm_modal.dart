import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sentezel/common/ui/pallete.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/purchasOfAsset/purchaseOfAsset_controller.dart';

class PurchaseOfAssetConfirmationBottomSheet extends HookConsumerWidget {
  final Function onConfirm;
  final Function onCancel;
  const PurchaseOfAssetConfirmationBottomSheet({
    Key? key,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentState = ref.watch(purchaseOfAssetControllerProvider);
    // final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final double itemFontSize = 16;
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                        currentState.particular,
                        style: TextStyle(
                          color: Palette.blackGrey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
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
                          DateFormat('dd-EE-yyyy').format(currentState.date),

                          // formatter.format(model.transaction.date),
                          style: TextStyle(
                            color: Palette.textColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
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
                  TableRow(
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
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ,
                                // model.debitSideLedgerName,
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
                              currentState.amount.toString(),
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
                  ),

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
                              'credit side ledger',
                              // model.creditSideLedgerName,
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
                              currentState.amount.toString(),
                              style: TextStyle(
                                color: Palette.textColor,
                                fontSize: itemFontSize,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  //---------Credit Partial Payment----------------
                  currentState.mode == TransactionMode.partialPaymentByBank ||
                          currentState.mode ==
                              TransactionMode.partialPaymentByCash
                      ? TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 25,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Text(
                                        'To',
                                        style: TextStyle(
                                          color: Palette.textColor,
                                          fontSize: itemFontSize,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      currentState.mode ==
                                              TransactionMode
                                                  .partialPaymentByBank
                                          ? 'Bank'
                                          : 'Cash',
                                      style: TextStyle(
                                        color: Palette.textColor,
                                        fontSize: itemFontSize,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Center(
                                  child: Text(
                                    currentState.creditPartialPaymentAmount
                                        .toString(),
                                    style: TextStyle(
                                      color: Palette.textColor,
                                      fontSize: itemFontSize,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : TableRow(children: [
                          Container(),
                          Container(),
                          Container(),
                        ]),
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
                    Navigator.pop(context);
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
}




// class PurchaseOfAssetConfirmationBottomSheet extends StatefulWidget {
//   final Function onConfirm;
//   final Function onCancel;
//   const PurchaseOfAssetConfirmationBottomSheet({
//     Key? key,
//     required this.onConfirm,
//     required this.onCancel,
//   }) : super(key: key);

//   @override
//   _AssetPurchaseConfirmationBottomSheetState createState() =>
//       _AssetPurchaseConfirmationBottomSheetState();
// }

// class _AssetPurchaseConfirmationBottomSheetState
//     extends State<PurchaseOfAssetConfirmationBottomSheet> {
 
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: SafeArea(
//         top: false,
//         child:  Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                     
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Table(
//                           border: TableBorder.all(color: Palette.textColor),
//                           columnWidths: {
//                             0: FractionColumnWidth(.6),
//                             1: FractionColumnWidth(.2),
//                             2: FractionColumnWidth(.2),
//                           },
//                           children: [
//                             TableRow(
//                               children: [
//                                 Container(
//                                   height: 25,
//                                   child: Center(
//                                     child: Text(
//                                       'Particulars',
//                                       style: TextStyle(
//                                         fontSize: itemFontSize,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 25,
//                                   child: Center(
//                                     child: Text(
//                                       'Debit',
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   height: 28,
//                                   child: Center(
//                                     child: Text(
//                                       'Credit',
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             TableRow(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Container(
//                                     height: 25,
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(

//                                           'debit Side ledger',
//                                           // model.debitSideLedgerName,
//                                           style: TextStyle(
//                                             color: Palette.textColor,
//                                             fontSize: itemFontSize,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding:
//                                               const EdgeInsets.only(right: 10),
//                                           child: Text(
//                                             'Dr.',
//                                             style: TextStyle(
//                                               color: Palette.textColor,
//                                               fontSize: itemFontSize,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Container(
//                                     child: Center(
//                                       child: Text(
//                                         'debit amount',
//                                         style: TextStyle(
//                                           color: Palette.textColor,
//                                           fontSize: itemFontSize,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container()
//                               ],
//                             ),

//                             TableRow(
//                               children: [
//                                 Container(
//                                   height: 40,
//                                   child: Row(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Text(
//                                           'To',
//                                           style: TextStyle(
//                                             color: Palette.textColor,
//                                             fontSize: itemFontSize,
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       Text(
//                                         'credit side ledger',
//                                         // model.creditSideLedgerName,
//                                         style: TextStyle(
//                                           color: Palette.textColor,
//                                           fontSize: itemFontSize,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Container(),
//                                 Container(
//                                   child: Center(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Text(
//                                         model.transaction.amount.toString(),
//                                         style: TextStyle(
//                                           color: Palette.textColor,
//                                           fontSize: itemFontSize,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             //---------Credit Partial Payment----------------
//                             model.getCreditType() ==
//                                     TransactionConstant.isPartialCreditPayment
//                                 ? TableRow(
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Container(
//                                           height: 25,
//                                           child: Row(
//                                             children: [
//                                               Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(1.0),
//                                                 child: Text(
//                                                   'To',
//                                                   style: TextStyle(
//                                                     color: Palette.textColor,
//                                                     fontSize: itemFontSize,
//                                                   ),
//                                                 ),
//                                               ),
//                                               SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Text(
//                                                 model.getCashOrBankString(),
//                                                 style: TextStyle(
//                                                   color: Palette.textColor,
//                                                   fontSize: itemFontSize,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       Container(),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Container(
//                                           child: Center(
//                                             child: Text(
//                                               model.transaction
//                                                   .creditPartialPaymentAmount
//                                                   .toString(),
//                                               style: TextStyle(
//                                                 color: Palette.textColor,
//                                                 fontSize: itemFontSize,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                 : TableRow(children: [
//                                     Container(),
//                                     Container(),
//                                     Container(),
//                                   ]),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             border: Border.all(color: Colors.blue.shade400),
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: Colors.black26,
//                                 offset: Offset(0, 2),
//                                 blurRadius: 6.0,
//                               ),
//                             ],
//                           ),
//                           child: ListTile(
//                             title: Text(
//                               'Confirm',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Palette.textColor,
//                               ),
//                             ),
//                             leading: Icon(CupertinoIcons.checkmark_alt),
//                             onTap: () {
//                               widget.onConfirm();
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             border: Border.all(color: Colors.red.shade400),
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: const [
//                               BoxShadow(
//                                 color: Colors.black26,
//                                 offset: Offset(0, 2),
//                                 blurRadius: 6.0,
//                               ),
//                             ],
//                           ),
//                           child: ListTile(
//                             title: Text(
//                               'Cancel',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Palette.textColor,
//                               ),
//                             ),
//                             leading: Icon(CupertinoIcons.nosign),
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 : Container(
//                     child: Text('Loading'),
//                   );
//           },
//         ),
//       ),
//     );
//   }
// }
