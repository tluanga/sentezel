import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';

import 'package:sentezel/newTransaction/sell/generalSell/generalSell_controller.dart';

class GeneralSellTransactionModeSelectModalBottomSheet
    extends HookConsumerWidget {
  const GeneralSellTransactionModeSelectModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.read(generalSellControllerProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
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
                  title: Text(
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
                          .watch(generalSellControllerProvider.notifier)
                          .setState(
                            state.copyWith(mode: TransactionMode.paymentByCash),
                          );

                      Navigator.pop(context);
                    },
                    groupValue: state.mode,
                  ),
                ),
                //----------Payment By Bank---------------
                Container(
                  margin: EdgeInsets.all(0),
                  child: ListTile(
                    title: Text(
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
                            .watch(generalSellControllerProvider.notifier)
                            .setState(state.copyWith(
                              mode: TransactionMode.paymentByBank,
                            ));

                        Navigator.pop(context);
                      },
                      groupValue: state.mode,
                    ),
                  ),
                ),
                //--------------
                Container(
                  margin: EdgeInsets.all(0),
                  child: ListTile(
                    title: Text(
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
                            .watch(generalSellControllerProvider.notifier)
                            .setState(
                              state.copyWith(mode: TransactionMode.credit),
                            );

                        Navigator.pop(context);
                      },
                      groupValue: state.mode,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  child: ListTile(
                    title: Text(
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
                            .watch(generalSellControllerProvider.notifier)
                            .setState(
                              state.copyWith(
                                  mode: TransactionMode.partialPaymentByBank),
                            );

                        Navigator.pop(context);
                      },
                      groupValue: state.mode,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  child: ListTile(
                    title: Text(
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
                            .watch(generalSellControllerProvider.notifier)
                            .setState(
                              state.copyWith(
                                  mode: TransactionMode.partialPaymentByCash),
                            );

                        Navigator.pop(context);
                      },
                      groupValue: state.mode,
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
