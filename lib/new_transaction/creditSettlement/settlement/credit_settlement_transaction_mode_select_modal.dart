import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/new_transaction/creditSettlement/settlement/credit_settlement_controller.dart';
import 'package:sentezel/new_transaction/data/transaction_mode_enum.dart';

class CreditSettlementTransactionModeSelectModalBottomSheet
    extends HookConsumerWidget {
  const CreditSettlementTransactionModeSelectModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.read(creditSettlementControllerProvider);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'Select Transaction Mode ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //--------------Payment by Cash----
                ListTile(
                  title: const Text(
                    'Payment By Cash',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Radio(
                    value: TransactionMode.paymentByCash,
                    activeColor: Colors.green.shade500,
                    onChanged: (value) {
                      ref
                          .watch(creditSettlementControllerProvider.notifier)
                          .setState(
                            state.data!.value
                                .copyWith(mode: TransactionMode.paymentByCash),
                          );

                      Navigator.pop(context);
                    },
                    groupValue: state.data!.value.mode,
                  ),
                ),
                //----------Payment By Bank---------------
                Container(
                  margin: const EdgeInsets.all(0),
                  child: ListTile(
                    title: const Text(
                      'Payment by Bank',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Radio(
                      value: TransactionMode.paymentByBank,
                      activeColor: Colors.green.shade500,
                      onChanged: (value) {
                        ref
                            .watch(creditSettlementControllerProvider.notifier)
                            .setState(state.data!.value.copyWith(
                              mode: TransactionMode.paymentByBank,
                            ));

                        Navigator.pop(context);
                      },
                      groupValue: state.data!.value.mode,
                    ),
                  ),
                ),
                //--------------
              ],
            ),
          ),
        ],
      ),
    );
  }
}
