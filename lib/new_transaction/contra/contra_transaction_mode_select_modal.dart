import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/new_transaction/contra/contra_controller.dart';
import 'package:sentezel/new_transaction/contra/contra_mode_enum.dart';
import 'package:sentezel/new_transaction/data/transaction_mode_enum.dart';

class ContraTransactionModeSelectModalBottomSheet extends HookConsumerWidget {
  const ContraTransactionModeSelectModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.read(contraControllerProvider);

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
                    'Select Contra Mode ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //--------------Payment by Cash----
                ListTile(
                  title: const Text(
                    'Cash to Bank',
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
                      ref.watch(contraControllerProvider.notifier).setState(
                            state.data!.value
                                .copyWith(mode: ContraMode.cashToBank),
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
                      'Bank to Cash',
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
                            .watch(contraControllerProvider.notifier)
                            .setState(state.data!.value.copyWith(
                              mode: ContraMode.bankToCash,
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
