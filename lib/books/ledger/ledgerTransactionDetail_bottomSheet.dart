import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LedgerTransactionDetailBottomSheet extends HookConsumerWidget {
  const LedgerTransactionDetailBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Container(
        child: Column(
          children: [
            Text('Ledger Transaction'),
          ],
        ),
      ),
    );
  }
}
