import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sentezel/books/ledger/ledger_transaction/ledger_transaction_model.dart';

class LedgerTransactionDetailBottomSheet extends HookConsumerWidget {
  final LedgerTransaction ledgerTransaction;
  const LedgerTransactionDetailBottomSheet({
    Key? key,
    required this.ledgerTransaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: Column(
        children: [
          const Text(
            'Ledger Transaction Detail',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: const Text('Date'),
              ),
              Text(
                DateFormat(
                  'dd MMMM yyyy hh:mm',
                ).format(ledgerTransaction.transaction!.date),
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: const Text('Amount'),
              ),
              Text(
                ledgerTransaction.amount.toString(),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: const Text('Amount'),
              ),
              Text(
                ledgerTransaction.amount.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
