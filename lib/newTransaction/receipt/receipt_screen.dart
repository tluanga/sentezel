import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/dateSelectTimeLine_widget.dart';
import 'package:sentezel/common/ui/widget/topBarWithSave_widget.dart';
import 'package:sentezel/newTransaction/common/transactionTypeSelect/transactionTypeOfReceiptSelect_modal.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/newTransaction/receipt/receiptConfirm_modal.dart';
import 'package:sentezel/newTransaction/receipt/receipt_controller.dart';
import 'package:sentezel/newTransaction/receipt/receiptTransactionModeSelect_modal.dart';

class ReceiptScreen extends HookConsumerWidget {
  const ReceiptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<Transaction> currentState = ref.watch(receiptControllerProvider);
    final setState = ref.watch(receiptControllerProvider.notifier);
    onCancel() {
      ref.read(receiptControllerProvider.notifier).reset();
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
                        title: 'Receipt',
                        onSave: () {
                          onSubmit(ref, context);
                        },
                        onCancel: () {
                          onCancel();
                        },
                      ),
                      DateSelectTimeLineWidget(
                        initialDate: data.date,
                        onDateSelected: (selectedDate) {
                          data.date = selectedDate;
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
                                data.amount = int.parse(value);
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

                          //------------Transaction Mode----
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) =>
                                    ReceiptTransactionModeSelectModalBottomSheet(),
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
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                TransactionTypeOfReceiptSelectModal(
                              onSelect: (receipt) {
                                ref
                                    .watch(receiptControllerProvider.notifier)
                                    .transactionTypeOfReceiptId = receipt.id;
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
                              border: Border.all(
                                color: data.partyId != 0
                                    ? Colors.grey.shade300
                                    : Colors.red.shade300,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.partyId == null
                                    ? 'Please Select Receipt Head of Account'
                                    : ref
                                        .watch(
                                            receiptControllerProvider.notifier)
                                        .getPartyName(),
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
                      SizedBox(
                        height: 10,
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
      builder: (context) => ReceiptConfirmationBottomSheet(
        onConfirm: () {
          ref.watch(receiptControllerProvider.notifier).submit();
        },
        onCancel: () {},
      ),
    );
  }
}
