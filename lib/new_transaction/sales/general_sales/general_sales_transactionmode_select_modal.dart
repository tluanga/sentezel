import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:sentezel/new_transaction/data/transaction_mode_enum.dart';
import 'package:sentezel/new_transaction/sales/general_sales/general_sales_controller.dart';

class GeneralSalesTransactionModeSelectModalBottomSheet
    extends HookConsumerWidget {
  const GeneralSalesTransactionModeSelectModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.read(generalSalesControllerProvider);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
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
                    onChanged: (value) {
                      ref
                          .watch(generalSalesControllerProvider.notifier)
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
                      onChanged: (value) {
                        ref
                            .watch(generalSalesControllerProvider.notifier)
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
                Container(
                  margin: const EdgeInsets.all(0),
                  child: ListTile(
                    title: const Text(
                      'Full Credit',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Radio(
                      value: TransactionMode.credit,
                      onChanged: (value) {
                        ref
                            .watch(generalSalesControllerProvider.notifier)
                            .setState(
                              state.data!.value
                                  .copyWith(mode: TransactionMode.credit),
                            );

                        Navigator.pop(context);
                      },
                      groupValue: state.data!.value.mode,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(0),
                  child: ListTile(
                    title: const Text(
                      'Credit with Partial Payment by Bank',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Radio(
                      value: TransactionMode.partialPaymentByBank,
                      onChanged: (value) {
                        ref
                            .watch(generalSalesControllerProvider.notifier)
                            .setState(
                              state.data!.value.copyWith(
                                  mode: TransactionMode.partialPaymentByBank),
                            );

                        Navigator.pop(context);
                      },
                      groupValue: state.data!.value.mode,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(0),
                  child: ListTile(
                    title: const Text(
                      'Credit with Partial Payment by Cash',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Radio(
                      value: TransactionMode.partialPaymentByCash,
                      onChanged: (value) {
                        ref
                            .watch(generalSalesControllerProvider.notifier)
                            .setState(
                              state.data!.value.copyWith(
                                  mode: TransactionMode.partialPaymentByCash),
                            );

                        Navigator.pop(context);
                      },
                      groupValue: state.data!.value.mode,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
