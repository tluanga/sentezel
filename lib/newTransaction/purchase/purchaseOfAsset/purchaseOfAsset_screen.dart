import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/dateSelectTimeLine_widget.dart';
import 'package:sentezel/common/ui/widget/topBarWithSave_widget.dart';
import 'package:sentezel/newTransaction/common/partialPayment_widget.dart';
import 'package:sentezel/newTransaction/common/assetSelect_modal.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/purchase/purchaseOfAsset/purchaseOfAssetConfirm_modal.dart';
import 'package:sentezel/newTransaction/purchase/purchaseOfAsset/purchaseOfAssetTransactionModeSelect_modal.dart';
import 'package:sentezel/newTransaction/purchase/purchaseOfAsset/purchaseOfAsset_controller.dart';
import 'package:sentezel/settings/party/partySelect_modal.dart';

class PurchaseOfAssetScreen extends HookConsumerWidget {
  const PurchaseOfAssetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(purchaseOfAssetControllerProvider);

    onCancel() {
      print('cancel is called');
      ref.read(purchaseOfAssetControllerProvider.notifier).reset();
    }

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
                  initialDate: state.date,
                  onDateSelected: (selectedDate) {
                    state = state.copyWith(date: selectedDate);
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
                          state = state.copyWith(amount: int.parse(value));
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
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    //------------Transaction Mode----
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              PurchaseOfAssetTransactionModeSelectModalBottomSheet(),
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
                              EnumToString.convertToString(state.mode,
                                  camelCase: true),
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
                state.mode == TransactionMode.credit ||
                        state.mode == TransactionMode.partialPaymentByBank ||
                        state.mode == TransactionMode.partialPaymentByCash
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (state.mode ==
                                  TransactionMode.partialPaymentByBank ||
                              state.mode ==
                                  TransactionMode.partialPaymentByCash)
                            PartialPaymentWidget(
                              onChange: (amount) {
                                ref
                                    .watch(purchaseOfAssetControllerProvider
                                        .notifier)
                                    .setState(
                                      state.copyWith(
                                          partialPaymentAmount: amount),
                                    );
                              },
                              defaultValue: state.partialPaymentAmount,
                              maxAmount: state.amount,
                            ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => PartySelectModal(
                                  onSelectParty: (party) {
                                    ref
                                        .watch(purchaseOfAssetControllerProvider
                                            .notifier)
                                        .setState(
                                          state.copyWith(partyLedger: party),
                                        );
                                  },
                                ),
                              );
                            },
                            child: Container(
                              width: state.mode == TransactionMode.credit
                                  ? MediaQuery.of(context).size.width * 0.97
                                  : MediaQuery.of(context).size.width * 0.55,
                              height: MediaQuery.of(context).size.height * 0.05,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                    color: state.partyLedger != 0
                                        ? Colors.grey.shade300
                                        : Colors.red.shade300,
                                  )),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    state.partyLedger == null
                                        ? 'Please Select Party'
                                        : state.partyLedger!.name,
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
                //-----ASSET SELECTION----------------------
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => AssetSelectModal(
                        onSelect: (asset) {
                          ref
                              .watch(purchaseOfAssetControllerProvider.notifier)
                              .setState(
                                state.copyWith(assetLedger: asset),
                              );
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
                          state.assetLedger == null
                              ? 'Please Select Asset'
                              : state.assetLedger!.name,
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
                    initialValue: state.particular,
                    onChanged: (value) {
                      ref
                          .watch(purchaseOfAssetControllerProvider.notifier)
                          .setState(
                            state.copyWith(particular: value),
                          );
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
  }

  onSubmit(WidgetRef ref, context) {
    ref.watch(purchaseOfAssetControllerProvider.notifier).setup();
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
