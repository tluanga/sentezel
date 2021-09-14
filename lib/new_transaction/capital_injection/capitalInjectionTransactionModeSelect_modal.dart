import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CapitalInjectionTransactionModeSelectModalBottomSheet
    extends HookConsumerWidget {
  const CapitalInjectionTransactionModeSelectModalBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.read(paymentControllerProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
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
                    activeColor: Colors.green.shade500,
                    onChanged: (value) {
                      ref.watch(paymentControllerProvider.notifier).setState(
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
                      activeColor: Colors.green.shade500,
                      onChanged: (value) {
                        ref
                            .watch(paymentControllerProvider.notifier)
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
