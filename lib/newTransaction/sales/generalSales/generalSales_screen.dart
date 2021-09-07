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
import 'package:sentezel/newTransaction/sales/generalSales/generalSalesConfirm_modal.dart';
import 'package:sentezel/newTransaction/sales/generalSales/generalSalesTransactionModeSelect_modal.dart';
import 'package:sentezel/newTransaction/sales/generalSales/generalSales_controller.dart';
import 'package:sentezel/newTransaction/sales/generalSales/generalSalesvalidationError_bottomSheet.dart';
import 'package:sentezel/newTransaction/sales/generalSales/model/generalSales_model.dart';
import 'package:sentezel/settings/party/partySelect_modal.dart';

class GeneralSalesScreen extends HookConsumerWidget {
  const GeneralSalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(generalSalesControllerProvider);

    onCancel() {
      print('cancel is called');
      ref.read(generalSalesControllerProvider.notifier).reset();
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
                        title: 'New Material Purchase',
                        onSave: () {
                          onSubmit(context: context, ref: ref);
                        },
                        onCancel: onCancel,
                      ),
                      DateSelectTimeLineWidget(
                        initialDate: data.date,
                        onDateSelected: (selectedDate) {
                          ref
                              .read(generalSalesControllerProvider.notifier)
                              .setState(
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

                      //------------Party Selection and Partial Amount Entry----
                      data.mode == TransactionMode.credit ||
                              data.mode ==
                                  TransactionMode.partialPaymentByBank ||
                              data.mode == TransactionMode.partialPaymentByCash
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (data.mode ==
                                        TransactionMode.partialPaymentByBank ||
                                    data.mode ==
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
    ref.watch(generalSalesControllerProvider.notifier).validate();
    await ref.watch(generalSalesControllerProvider.notifier).setup();
    final state = ref.watch(generalSalesControllerProvider);
    if (state.data!.value.errorMessages.length == 0) {
      showModalBottomSheet(
        context: context,
        builder: (context) => GeneralSalesConfirmationBottomSheet(
          onConfirm: () {
            ref.watch(generalSalesControllerProvider.notifier).submit();

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
        builder: (context) => GeneralSalesValidationErrorBottomSheet(
          validationErrorMessages: state.data!.value.errorMessages,
        ),
      );
    }
  }

  _amount({required BuildContext context, required WidgetRef ref}) {
    final state = ref.watch(generalSalesControllerProvider);
    return Container(
      width: MediaQuery.of(context).size.width * 0.38,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextFormField(
        //
        onChanged: (value) {
          var _value = value != '' ? int.parse(value) : 0;
          print(value);
          ref.watch(generalSalesControllerProvider.notifier).setState(
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

  _transactionMode(
      {required BuildContext context, required GeneralSales state}) {
    return //------------Transaction Mode----
        GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) =>
              GeneralSalesTransactionModeSelectModalBottomSheet(),
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
    final state = ref.watch(generalSalesControllerProvider);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => PartySelectModal(
            onSelectParty: (party) {
              ref.watch(generalSalesControllerProvider.notifier).setState(
                    state.data!.value.copyWith(partyLedger: party),
                  );
            },
          ),
        );
      },
      child: Container(
        width: state.data!.value.mode == TransactionMode.credit
            ? MediaQuery.of(context).size.width * 0.97
            : MediaQuery.of(context).size.width * 0.55,
        height: MediaQuery.of(context).size.height * 0.05,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
              color: state.data!.value.partyLedger != null
                  ? Colors.grey.shade300
                  : Colors.red.shade300,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              state.data!.value.partyLedger == null
                  ? 'Please Select Party'
                  : state.data!.value.partyLedger!.name,
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
    final state = ref.watch(generalSalesControllerProvider);
    return PartialPaymentWidget(
      onChange: (amount) {
        ref.watch(generalSalesControllerProvider.notifier).setState(
              state.data!.value.copyWith(partialPaymentAmount: amount),
            );
      },
      defaultValue: state.data!.value.partialPaymentAmount,
      maxAmount: state.data!.value.amount,
    );
  }

  _particular({required BuildContext context, required WidgetRef ref}) {
    final state = ref.watch(generalSalesControllerProvider);
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextFormField(
        initialValue: state.data!.value.particular,
        onChanged: (value) {
          ref.watch(generalSalesControllerProvider.notifier).setState(
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
