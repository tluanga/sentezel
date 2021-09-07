import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/common/ui/widget/dateSelectTimeLine_widget.dart';
import 'package:sentezel/common/ui/widget/topBarWithSave_widget.dart';
import 'package:sentezel/newTransaction/newTransactionCenter_screen.dart';
import 'package:sentezel/newTransaction/receipt/model/receipt_model.dart';
import 'package:sentezel/newTransaction/receipt/receiptConfirm_modal.dart';
import 'package:sentezel/newTransaction/receipt/receiptTransactionModeSelect_modal.dart';
import 'package:sentezel/newTransaction/receipt/receiptTypeSelect/receiptTypeSelect_modal.dart';
import 'package:sentezel/newTransaction/receipt/receipt_controller.dart';

import 'package:sentezel/newTransaction/sales/salesReturn/salesReturnvalidationError_bottomSheet.dart';

class ReceiptScreen extends HookConsumerWidget {
  const ReceiptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(receiptControllerProvider);

    onCancel() {
      print('cancel is called');
      ref.read(receiptControllerProvider.notifier).reset();
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
            child: state.when(
                data: (data) {
                  print(data);
                  return Column(
                    children: [
                      TopBarWithSaveWidget(
                        title: 'Sales Return',
                        onSave: () {
                          onSubmit(context: context, ref: ref);
                        },
                        onCancel: onCancel,
                      ),
                      DateSelectTimeLineWidget(
                        initialDate: data.date,
                        onDateSelected: (selectedDate) {
                          ref.read(receiptControllerProvider.notifier).setState(
                                data.copyWith(date: selectedDate),
                              );
                        },
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //--------------Amount ------------
                          _amount(context: context, ref: ref),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
                          _transactionMode(context: context, state: data),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      //-----ASSET SELECTION----------------------
                      _receiptTypeSelect(context: context, ref: ref),
                      //----PARTICULAR SELECTION----------
                      _particular(context: context, ref: ref),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  );
                },
                loading: () {
                  return CircularProgressIndicator();
                },
                error: (error, stack) {}),
          ),
        ),
      ),
    );
  }

  onSubmit({required BuildContext context, required WidgetRef ref}) async {
    ref.watch(receiptControllerProvider.notifier).validate();
    await ref.watch(receiptControllerProvider.notifier).setup();
    final state = ref.watch(receiptControllerProvider);
    if (state.data!.value.errorMessages.length == 0) {
      showModalBottomSheet(
        context: context,
        builder: (context) => ReceiptConfirmationBottomSheet(
          onConfirm: () {
            ref.watch(receiptControllerProvider.notifier).submit();

            showCupertinoModalBottomSheet(
              expand: true,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => NewTranscationCenterScreen(),
            );
          },
          onCancel: () {},
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) => SalesReturnValidationErrorBottomSheet(
          validationErrorMessages: state.data!.value.errorMessages,
        ),
      );
    }
  }

  _amount({required BuildContext context, required WidgetRef ref}) {
    final state = ref.watch(receiptControllerProvider);
    return Container(
      width: MediaQuery.of(context).size.width * 0.38,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextFormField(
        //
        onChanged: (value) {
          var _value = value != '' ? int.parse(value) : 0;
          print(value);
          ref.watch(receiptControllerProvider.notifier).setState(
                state.data!.value.copyWith(
                  amount: _value,
                ),
              );
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
    );
  }

  _transactionMode({required BuildContext context, required Receipt state}) {
    return //------------Transaction Mode----
        GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => ReceiptTransactionModeSelectModalBottomSheet(),
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
              EnumToString.convertToString(state.mode, camelCase: true),
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
    );
  }

  _receiptTypeSelect({required BuildContext context, required WidgetRef ref}) {
    final state = ref.watch(receiptControllerProvider).data!.value;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => ReceiptTypeSelectModal(
            onSelect: (asset) {},
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
            color: state.category == null
                ? Colors.red.shade200
                : Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              state.category == null
                  ? 'Please Select Receipt Category'
                  : state.category!.name,
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
    );
  }

  _particular({required BuildContext context, required WidgetRef ref}) {
    final state = ref.watch(receiptControllerProvider);
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextFormField(
        initialValue: state.data!.value.particular,
        onChanged: (value) {
          ref.watch(receiptControllerProvider.notifier).setState(
                state.data!.value.copyWith(particular: value),
              );
        },
        decoration: InputDecoration(
          labelText: 'particular',
        ),
      ),
    );
  }
}
