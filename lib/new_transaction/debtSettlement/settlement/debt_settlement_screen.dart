import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sentezel/common/helpers/CurrrencySeperatorStringFormatter_helper.dart';
import 'package:sentezel/common/ui/widget/date_select_time_line_widget.dart';
import 'package:sentezel/common/ui/widget/top_bar_with_save_widget.dart';
import 'package:sentezel/new_transaction/debtSettlement/model/debtor_model.dart';
import 'package:sentezel/new_transaction/debtSettlement/settlement/debt_settlement_confirm_modal.dart';
import 'package:sentezel/new_transaction/debtSettlement/settlement/debt_settlement_transaction_mode_select_modal.dart';
import 'package:sentezel/new_transaction/debtSettlement/settlement/debt_settlement_validation_error_bottomSheet.dart';
import 'package:sentezel/new_transaction/debtSettlement/settlement/debt_settlement_controller.dart';
import 'package:sentezel/new_transaction/debtSettlement/settlement/debt_settlement_model.dart';
import 'package:sentezel/new_transaction/new_transaction_center_screen.dart';

class DebtSettlementScreen extends HookConsumerWidget {
  final Debtor debtor;
  const DebtSettlementScreen({Key? key, required this.debtor})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(debtSettlementControllerProvider);

    useEffect(() {
      ref
          .read(debtSettlementControllerProvider.notifier)
          .loadData(debtor: debtor);
    }, []);
    onCancel() {}

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: state.when(
                data: (data) {
                  return Column(
                    children: [
                      TopBarWithSaveWidget(
                        title: 'Debt Settlement ',
                        onSave: () {
                          onSubmit(context: context, ref: ref);
                        },
                        onCancel: onCancel,
                      ),
                      DateSelectTimeLineWidget(
                        initialDate: data.date,
                        onDateSelected: (selectedDate) {
                          ref
                              .read(debtSettlementControllerProvider.notifier)
                              .setState(
                                data.copyWith(date: selectedDate),
                              );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    'Current Debt of',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    data.debtor!.party!.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                currencySeperatorStringFormatterHelper(
                                    data.debtor!.amount),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
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
                      const SizedBox(
                        height: 10,
                      ),
                      //----PARTICULAR SELECTION----------
                      _particular(context: context, ref: ref),
                      const SizedBox(
                        height: 6,
                      ),
                    ],
                  );
                },
                loading: () {
                  return const Center(child: Text('Loading debtor list'));
                },
                error: (error, stack) {}),
          ),
        ),
      ),
    );
  }

  onSubmit({required BuildContext context, required WidgetRef ref}) async {
    ref.watch(debtSettlementControllerProvider.notifier).validate();
    await ref.watch(debtSettlementControllerProvider.notifier).setup();
    final state = ref.watch(debtSettlementControllerProvider);
    if (state.data!.value.errorMessages.isEmpty) {
      showModalBottomSheet(
        context: context,
        builder: (context) => DebtSettlementConfirmationBottomSheet(
          onConfirm: () {
            ref.watch(debtSettlementControllerProvider.notifier).submit();

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
        builder: (context) => DebtSettlementValidationErrorBottomSheet(
          validationErrorMessages: state.data!.value.errorMessages,
        ),
      );
    }
  }

  _amount({required BuildContext context, required WidgetRef ref}) {
    final state = ref.watch(debtSettlementControllerProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.38,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextFormField(
        onChanged: (value) {
          var _value = value != '' ? int.parse(value) : 0;
          ref.watch(debtSettlementControllerProvider.notifier).setState(
                state.data!.value.copyWith(
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
      {required BuildContext context, required DebtSettlement state}) {
    return //------------Transaction Mode----
        GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) =>
              const DebtSettlementTransactionModeSelectModalBottomSheet(),
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
    final state = ref.watch(debtSettlementControllerProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextFormField(
        initialValue: state.data!.value.particular,
        onChanged: (value) {
          ref.watch(debtSettlementControllerProvider.notifier).setState(
                state.data!.value.copyWith(particular: value),
              );
        },
        decoration: const InputDecoration(
          labelText: 'particular',
        ),
      ),
    );
  }
}
