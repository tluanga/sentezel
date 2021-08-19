import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/dateSelectTimeLine_widget.dart';
import 'package:sentezel/common/ui/widget/topBarWithSave_widget.dart';
import 'package:sentezel/newTransaction/common/partialPayment_widget.dart';
import 'package:sentezel/newTransaction/common/assetSelect_modal.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/newTransaction/purchasOfAsset/purchaseOfAssetConfirm_modal.dart';
import 'package:sentezel/newTransaction/purchasOfAsset/purchaseOfAsset_controller.dart';
import 'package:sentezel/newTransaction/purchasOfAsset/transactionModeSelect_modal.dart';
import 'package:sentezel/settings/party/partySelect_modal.dart';

class AssetPurchaseScreen extends HookConsumerWidget {
  const AssetPurchaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Transaction> currentState =
        ref.watch(purchaseOfAssetControllerProvider);
    final partyName =
        ref.watch(purchaseOfAssetControllerProvider.notifier).getPartyName();
    final assetName =
        ref.watch(purchaseOfAssetControllerProvider.notifier).getAssetName();

    onCancel() {
      ref.read(purchaseOfAssetControllerProvider.notifier).reset();
    }

    return currentState.when(
        data: (data) {
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
                          onSubmit(ref, context);
                        },
                        onCancel: onCancel,
                      ),
                      DateSelectTimeLineWidget(
                        initialDate: data.date,
                        onDateSelected: (selectedDate) {
                          ref
                              .watch(purchaseOfAssetControllerProvider.notifier)
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
                              //
                              onChanged: (value) {
                                ref
                                    .watch(purchaseOfAssetControllerProvider
                                        .notifier)
                                    .setAmount(int.parse(value));
                              },
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
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    convertTransactionModeToString(
                                      data.mode,
                                    ),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
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
                      data.mode == TransactionMode.credit ||
                              data.mode ==
                                  TransactionMode.partialPaymentByBank ||
                              data.mode == TransactionMode.partialPaymentByCash
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                data.mode ==
                                            TransactionMode
                                                .partialPaymentByBank ||
                                        data.mode ==
                                            TransactionMode.partialPaymentByCash
                                    ? PartialPaymentWidget(onChange: (amount) {
                                        ref
                                            .watch(
                                                purchaseOfAssetControllerProvider
                                                    .notifier)
                                            .setPartialPaymentAmount(amount);
                                      })
                                    : Container(),
                                GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) => PartySelectModal(
                                        onSelectParty: (party) {
                                          ref
                                              .watch(
                                                  purchaseOfAssetControllerProvider
                                                      .notifier)
                                              .setParty(party);
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: data.mode == TransactionMode.credit
                                        ? MediaQuery.of(context).size.width *
                                            0.97
                                        : MediaQuery.of(context).size.width *
                                            0.55,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(
                                          color: data.partyId != 0
                                              ? Colors.grey.shade300
                                              : Colors.red.shade300,
                                        )),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          partyName.isEmpty
                                              ? 'Please Select Party'
                                              : partyName,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
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
                                    .watch(purchaseOfAssetControllerProvider
                                        .notifier)
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
                                assetName.isEmpty
                                    ? 'Please Select Asset'
                                    : assetName,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
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
                          initialValue: data.particular,
                          onChanged: (value) {
                            data.particular = value;
                          },
                          decoration: InputDecoration(
                            labelText: 'particular',
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
        },
        loading: () => Center(
              child: CircularProgressIndicator(),
            ),
        error: (error, stack) => Container(child: Text('Error')));
  }

  onSubmit(WidgetRef ref, context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => PurchaseOfAssetConfirmationBottomSheet(
        onConfirm: () {
          ref.watch(purchaseOfAssetControllerProvider.notifier).submit();
        },
        onCancel: () {},
      ),
    );
  }
}
