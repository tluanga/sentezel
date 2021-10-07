import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/ui/widget/date_select_time_line_widget.dart';
import 'package:sentezel/common/ui/widget/top_bar_with_save_widget.dart';
import 'package:sentezel/new_transaction/purchase/purchase_return/model/purchase_return_model.dart';
import 'package:sentezel/new_transaction/purchase/purchase_return/purchase_return_confirm_modal.dart';
import 'package:sentezel/new_transaction/purchase/purchase_return/purchase_return_controller.dart';
import 'package:sentezel/new_transaction/purchase/purchase_return/purchase_return_transaction_mode_select_modal.dart';
import 'package:sentezel/new_transaction/purchase/purchase_return/purchase_return_validation_error_bottomSheet.dart';

class PurchaseReturnScreen extends HookConsumerWidget {
  const PurchaseReturnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(purchaseReturnControllerProvider);

    onCancel() {
      ref.read(purchaseReturnControllerProvider.notifier).reset();
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                TopBarWithSaveWidget(
                  title: 'Purchase Return',
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
                const SizedBox(
                  height: 10,
                ),
                //----PARTICULAR SELECTION----------
                _particular(context: context, ref: ref),
                const SizedBox(
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
    ref.watch(purchaseReturnControllerProvider.notifier).validate();
    await ref.watch(purchaseReturnControllerProvider.notifier).setup();
    final state = ref.watch(purchaseReturnControllerProvider);
    if (state.errorMessages.isEmpty) {
      showModalBottomSheet(
        context: context,
        builder: (context) => PurchaseReturnConfirmationBottomSheet(
          onConfirm: () {
            ref.watch(purchaseReturnControllerProvider.notifier).submit();

            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
            FocusScope.of(context).unfocus();
          },
          onCancel: () {},
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) => PurchaseReturnValidationErrorBottomSheet(
          validationErrorMessages: state.errorMessages,
        ),
      );
    }
  }

  _amount({required BuildContext context, required WidgetRef ref}) {
    final state = ref.watch(purchaseReturnControllerProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.38,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextFormField(
        onChanged: (value) {
          var _value = value != '' ? int.parse(value) : 0;
          ref.watch(purchaseReturnControllerProvider.notifier).setState(
                state.copyWith(
                  amount: _value,
                ),
              );
        },
        decoration: const InputDecoration(
          labelText: 'Amount',
        ),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  _transactionMode(
      {required BuildContext context, required PurchaseReturn state}) {
    return //------------Transaction Mode----
        GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) =>
              const PurchaseReturnTransactionModeSelectModalBottomSheet(),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.55,
        height: MediaQuery.of(context).size.height * 0.05,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              EnumToString.convertToString(state.mode, camelCase: true),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
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
    final state = ref.watch(purchaseReturnControllerProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextFormField(
        initialValue: state.particular,
        onChanged: (value) {
          ref.watch(purchaseReturnControllerProvider.notifier).setState(
                state.copyWith(particular: value),
              );
        },
        decoration: const InputDecoration(
          labelText: 'particular',
        ),
      ),
    );
  }
}
