import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/purchasOfAsset/purchaseOfAsset_controller.dart';

class TransactionModeSelectModalBottomSheet extends HookConsumerWidget {
  const TransactionModeSelectModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setState = ref.read(purchaseOfAssetControllerProvider.notifier);
    final readState = ref.read(purchaseOfAssetControllerProvider);
    return Container(
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
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Ledger Master Type',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Direct'),
                  trailing: Radio(
                    value: TransactionMode.paymentByCash,
                    onChanged: (value) {
                      setState.setMode(TransactionMode.paymentByCash);
                    },
                    groupValue: readState.mode,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(0),
                  child: ListTile(
                    title: Text('Indirect'),
                    trailing: Radio(
                      value: TransactionMode.partialPaymentByBank,
                      onChanged: (value) {
                        print('before change value ${_type.value}');
                        _type.value = LedgerMasterType.indirect;
                        print('Change value ${_type.value}');
                      },
                      groupValue: _type.value,
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
