import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/common/ui/widget/dateSelectTimeLine_widget.dart';
import 'package:sentezel/common/ui/widget/topBarWithSave_widget.dart';
import 'package:sentezel/newTransaction/common/partialPayment_widget.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/newTransactionCenter_screen.dart';
import 'package:sentezel/newTransaction/purchase/purchaseOfMaterial/model/purchaseOfMaterial_model.dart';
import 'package:sentezel/newTransaction/purchase/purchaseOfMaterial/purchaseOfMaterialConfirm_modal.dart';
import 'package:sentezel/newTransaction/purchase/purchaseOfMaterial/purchaseOfMaterialTransactionModeSelect_modal.dart';
import 'package:sentezel/newTransaction/purchase/purchaseOfMaterial/purchaseOfMaterial_controller.dart';
import 'package:sentezel/newTransaction/purchase/purchaseOfMaterial/purchaseOfMaterialvalidationError_bottomSheet.dart';
import 'package:sentezel/settings/party/partySelect_modal.dart';

class PurchaseOfMaterialScreen extends HookConsumerWidget {
  const PurchaseOfMaterialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(purchaseOfMaterialControllerProvider);

    onCancel() {
      print('cancel is called');
      ref.read(purchaseOfMaterialControllerProvider.notifier).reset();
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
                  title: 'New Material Purchase',
                  onSave: () {
                    onSubmit(context: context, ref: ref);
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
                    _amount(context: context, ref: ref),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                    _transactionMode(context: context, state: state),
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
                            //Partial Payment
                            _partialPayment(context: context, ref: ref),

                          //---Party Select----
                          _partySelect(context: context, ref: ref),
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 10,
                ),
                //-----ASSET SELECTION----------------------

                //----PARTICULAR SELECTION----------
                _particular(context: context, ref: ref),
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

  onSubmit({required BuildContext context, required WidgetRef ref}) async {
    ref.watch(purchaseOfMaterialControllerProvider.notifier).validate();
    await ref.watch(purchaseOfMaterialControllerProvider.notifier).setup();
    final state = ref.watch(purchaseOfMaterialControllerProvider);
    if (state.errorMessages.length == 0) {
      showModalBottomSheet(
        context: context,
        builder: (context) => PurchaseOfMaterialConfirmationBottomSheet(
          onConfirm: () {
            ref.watch(purchaseOfMaterialControllerProvider.notifier).submit();

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
        builder: (context) => PurchaseOfMaterialValidationErrorBottomSheet(
          validationErrorMessages: state.errorMessages,
        ),
      );
    }
  }

  _amount({required BuildContext context, required WidgetRef ref}) {
    final state = ref.watch(purchaseOfMaterialControllerProvider);
    return Container(
      width: MediaQuery.of(context).size.width * 0.38,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextFormField(
        //
        onChanged: (value) {
          var _value = value != '' ? int.parse(value) : 0;
          print(value);
          ref.watch(purchaseOfMaterialControllerProvider.notifier).setState(
                state.copyWith(
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

  _transactionMode(
      {required BuildContext context, required PurchaseOfMaterial state}) {
    return //------------Transaction Mode----
        GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) =>
              PurchaseOfMaterialTransactionModeSelectModalBottomSheet(),
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

  _partySelect({required BuildContext context, required WidgetRef ref}) {
    final state = ref.watch(purchaseOfMaterialControllerProvider);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => PartySelectModal(
            onSelectParty: (party) {
              ref.watch(purchaseOfMaterialControllerProvider.notifier).setState(
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
              color: state.partyLedger != null
                  ? Colors.grey.shade300
                  : Colors.red.shade300,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }

  _partialPayment({required BuildContext context, required WidgetRef ref}) {
    final state = ref.watch(purchaseOfMaterialControllerProvider);
    return PartialPaymentWidget(
      onChange: (amount) {
        ref.watch(purchaseOfMaterialControllerProvider.notifier).setState(
              state.copyWith(partialPaymentAmount: amount),
            );
      },
      defaultValue: state.partialPaymentAmount,
      maxAmount: state.amount,
    );
  }

  _particular({required BuildContext context, required WidgetRef ref}) {
    final state = ref.watch(purchaseOfMaterialControllerProvider);
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextFormField(
        initialValue: state.particular,
        onChanged: (value) {
          ref.watch(purchaseOfMaterialControllerProvider.notifier).setState(
                state.copyWith(particular: value),
              );
        },
        decoration: InputDecoration(
          labelText: 'particular',
        ),
      ),
    );
  }
}
