import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/topBarWithSave_widget.dart';
import 'package:sentezel/common/ui/widget/weeklyTableCalendar_widget.dart';
import 'package:sentezel/newTransaction/common/partialPayment_widget.dart';
import 'package:sentezel/newTransaction/common/assetSelect_modal.dart';
import 'package:sentezel/newTransaction/common/partySelect_modal.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/purchasOfAsset/purchaseOfAssetConfirm_dialog.dart';
import 'package:sentezel/newTransaction/purchasOfAsset/purchaseOfAsset_controller.dart';
import 'package:sentezel/newTransaction/purchasOfAsset/transactionModeSelect_modal.dart';

class AssetPurchaseScreen extends HookConsumerWidget {
  const AssetPurchaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentState = ref.watch(purchaseOfAssetControllerProvider);
    final partyName =
        ref.watch(purchaseOfAssetControllerProvider.notifier).getPartyName();
    final assetName =
        ref.watch(purchaseOfAssetControllerProvider.notifier).getAssetName();
    final partialAmountController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                TopBarWithSaveWidget(
                    title: 'New Asset Purchase',
                    onSave: () {
                      print('save');
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Material(child: Text('hello')),
                      );
                    }),
                WeeklyTableCalendarWidget(
                  onDateSelect: (selectedDate) {
                    ref
                        .read(purchaseOfAssetControllerProvider.notifier)
                        .setDate(selectedDate);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //--------------Amount ------------
                    Container(
                      width: MediaQuery.of(context).size.width * 0.38,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Amount',
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    //------------Transaction Mode----
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              TransactionModeSelectModalBottomSheet(),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.55,
                        height: MediaQuery.of(context).size.height * 0.05,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              convertTransactionModeToString(
                                currentState.mode,
                              ),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              CupertinoIcons.arrowtriangle_down,
                              color: Colors.black,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                //------------Party Selection and Partial Amount Entry----
                currentState.mode == TransactionMode.credit ||
                        currentState.mode ==
                            TransactionMode.partialPaymentByBank ||
                        currentState.mode ==
                            TransactionMode.partialPaymentByCash
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          currentState.mode ==
                                      TransactionMode.partialPaymentByBank ||
                                  currentState.mode ==
                                      TransactionMode.partialPaymentByCash
                              ? PartialPaymentWidget(
                                  controller: partialAmountController)
                              : Container(),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => PartySelectModal(
                                  onSelectParty: (party) {
                                    ref
                                        .watch(purchaseOfAssetControllerProvider
                                            .notifier)
                                        .setParty(party);
                                  },
                                  partial: false,
                                ),
                              );
                            },
                            child: Container(
                              width: currentState.mode == TransactionMode.credit
                                  ? MediaQuery.of(context).size.width * 0.97
                                  : MediaQuery.of(context).size.width * 0.55,
                              height: MediaQuery.of(context).size.height * 0.05,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    partyName.isEmpty
                                        ? 'Please Select Pary'
                                        : partyName,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.arrowtriangle_down,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 10,
                ),
                //Asset Selection
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => AssetSelectModal(
                        onSelect: (asset) {
                          ref
                              .watch(purchaseOfAssetControllerProvider.notifier)
                              .setAsset(asset);
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.97,
                    height: MediaQuery.of(context).size.height * 0.05,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          assetName.isEmpty ? 'Please Select Asset' : assetName,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          CupertinoIcons.arrowtriangle_down,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // _assetItem(BuildContext context, LedgerMaster asset) {
  //   Color _color;

  //   return GestureDetector(
  //     onTap: () {
  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //     builder: (context) => NewLedgerMasterScreen(
  //       //       ledgerMaster: ledgerMaster,
  //       //     ),
  //       //   ),
  //       // );
  //     },
  //     child: Container(
  //       margin: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 0),
  //       height: MediaQuery.of(context).size.height * 0.1,
  //       width: MediaQuery.of(context).size.width * 0.9,
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(10),
  //             topRight: Radius.circular(10),
  //             bottomLeft: Radius.circular(10),
  //             bottomRight: Radius.circular(10)),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.grey.withOpacity(0.3),
  //             spreadRadius: 2,
  //             blurRadius: 7,
  //             offset: Offset(0, 3), // changes position of shadow
  //           ),
  //         ],
  //       ),
  //       child: Row(
  //         children: [
  //           Container(
  //             height: MediaQuery.of(context).size.height * 0.1,
  //             width: MediaQuery.of(context).size.width * 0.2,
  //             decoration: BoxDecoration(
  //               color: Colors.amber,
  //               borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(10),
  //                 bottomLeft: Radius.circular(10),
  //               ),
  //             ),
  //             child: Center(
  //               child: Text(
  //                 asset.getInitialLetter(),
  //                 style: TextStyle(
  //                   fontSize: 50,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ),
  //           ),
  //           Column(
  //             mainAxisAlignment: asset.description != null
  //                 ? MainAxisAlignment.spaceAround
  //                 : MainAxisAlignment.spaceEvenly,
  //             children: [
  //               Container(
  //                 width: MediaQuery.of(context).size.width * 0.74,
  //                 child: Center(
  //                   child: Text(
  //                     asset.name,
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               Container(
  //                 width: MediaQuery.of(context).size.width * 0.74,
  //                 height: MediaQuery.of(context).size.height * 0.03,
  //                 child: Center(
  //                   child: Text(
  //                     asset.description != asset.name ? asset.description : '',
  //                     style: TextStyle(
  //                       fontSize: 14,
  //                     ),
  //                     overflow: TextOverflow.ellipsis,
  //                   ),
  //                 ),
  //               ),
  //               Container(
  //                 width: MediaQuery.of(context).size.width * 0.74,
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                   children: [
  //                     // Container(
  //                     //   child: Text(
  //                     //     toBeginningOfSentenceCase(
  //                     //       EnumToString.convertToString(ledgerMaster.type),
  //                     //     )!,
  //                     //   ),
  //                     // ),
  //                     Container(
  //                       child: asset.status == ActiveInActive.active
  //                           ? Text(
  //                               'Active',
  //                               style: TextStyle(
  //                                 color: Colors.green,
  //                               ),
  //                             )
  //                           : Text(
  //                               'In-Active',
  //                               style: TextStyle(
  //                                 color: Colors.red,
  //                               ),
  //                             ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
