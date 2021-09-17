import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/common/ui/widget/date_select_time_line_widget.dart';
import 'package:sentezel/common/ui/widget/top_bar_with_save_widget.dart';
import 'package:sentezel/new_transaction/common/partial_payment_widget.dart';
import 'package:sentezel/new_transaction/common/asset_select_modal.dart';
import 'package:sentezel/new_transaction/data/transaction_mode_enum.dart';
import 'package:sentezel/new_transaction/new_transaction_center_screen.dart';
import 'package:sentezel/new_transaction/purchase/purchase_of_asset/model/purchase_of_asset_model.dart';
import 'package:sentezel/new_transaction/purchase/purchase_of_asset/purchase_of_asset_confirm_modal.dart';
import 'package:sentezel/new_transaction/purchase/purchase_of_asset/purchase_of_asset_controller.dart';
import 'package:sentezel/new_transaction/purchase/purchase_of_asset/purchase_of_asset_transaction_mode_select_modal.dart';
import 'package:sentezel/new_transaction/purchase/purchase_of_asset/purchase_of_asset_validation_error_bottomSheet.dart';

import 'package:sentezel/settings/party/party_select_modal.dart';

class PurchaseOfAssetScreen extends HookConsumerWidget {
  const PurchaseOfAssetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(purchaseOfAssetControllerProvider);
    onCancel() {
      ref.read(purchaseOfAssetControllerProvider.notifier).reset();
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
                  title: 'New Asset Purchase',
                  onSave: () {
                    onSubmit(context: context, ref: ref);
                  },
                  onCancel: onCancel,
                ),
                DateSelectTimeLineWidget(
                  initialDate: state.date,
                  onDateSelected: (selectedDate) {
                    ref
                        .watch(purchaseOfAssetControllerProvider.notifier)
                        .setState(
                          state.copyWith(
                            date: selectedDate,
                          ),
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
                const SizedBox(
                  height: 10,
                ),
                //-----ASSET SELECTION----------------------
                _assetSelect(context: context, ref: ref),
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

  onSubmit({required BuildContext context, required WidgetRef ref}) {
    ref.watch(purchaseOfAssetControllerProvider.notifier).validate();
    ref.watch(purchaseOfAssetControllerProvider.notifier).setup();
    final state = ref.watch(purchaseOfAssetControllerProvider);
    if (state.errorMessages.isEmpty) {
      showModalBottomSheet(
        context: context,
        builder: (context) => PurchaseOfAssetConfirmationBottomSheet(
          onConfirm: () {
            ref.watch(purchaseOfAssetControllerProvider.notifier).submit();

            showCupertinoModalBottomSheet(
              expand: true,
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const NewTranscationCenterScreen(),
            );
          },
          onCancel: () {},
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) => PurchaseOfAssetValidationErrorBottomSheet(
          validationErrorMessages: state.errorMessages,
        ),
      );
    }
  }

  _amount({required BuildContext context, required WidgetRef ref}) {
    final state = ref.watch(purchaseOfAssetControllerProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.38,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextFormField(
        onChanged: (value) {
          var _value = value != '' ? int.parse(value) : 0;
          ref.watch(purchaseOfAssetControllerProvider.notifier).setState(
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
      {required BuildContext context, required PurchaseOfAsset state}) {
    return //------------Transaction Mode----
        GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) =>
              const PurchaseOfAssetTransactionModeSelectModalBottomSheet(),
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

  _assetSelect({required BuildContext context, required WidgetRef ref}) {
    final state = ref.watch(purchaseOfAssetControllerProvider);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => AssetSelectModal(
            onSelect: (asset) {
              ref.watch(purchaseOfAssetControllerProvider.notifier).setState(
                    state.copyWith(assetLedger: asset),
                  );
            },
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.97,
        height: MediaQuery.of(context).size.height * 0.05,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            color: state.assetLedger == null
                ? Colors.red.shade200
                : Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              state.assetLedger == null
                  ? 'Please Select Asset'
                  : state.assetLedger!.name,
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

  _partySelect({required BuildContext context, required WidgetRef ref}) {
    final state = ref.watch(purchaseOfAssetControllerProvider);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => PartySelectModal(
            onSelectParty: (party) {
              ref.watch(purchaseOfAssetControllerProvider.notifier).setState(
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
        padding: const EdgeInsets.all(10),
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

  _partialPayment({required BuildContext context, required WidgetRef ref}) {
    final state = ref.watch(purchaseOfAssetControllerProvider);
    return PartialPaymentWidget(
      onChange: (amount) {
        ref.watch(purchaseOfAssetControllerProvider.notifier).setState(
              state.copyWith(partialPaymentAmount: amount),
            );
      },
      defaultValue: state.partialPaymentAmount,
      maxAmount: state.amount,
    );
  }

  _particular({required BuildContext context, required WidgetRef ref}) {
    final state = ref.watch(purchaseOfAssetControllerProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextFormField(
        initialValue: state.particular,
        onChanged: (value) {
          ref.watch(purchaseOfAssetControllerProvider.notifier).setState(
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
