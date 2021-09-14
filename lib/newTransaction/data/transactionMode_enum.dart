enum TransactionMode {
  credit,
  paymentByCash,
  paymentByBank,
  partialPaymentByCash,
  partialPaymentByBank,
  contra,
}

String transactionModeToString(TransactionMode mode) {
  if (mode == TransactionMode.credit) return 'Credit';
  if (mode == TransactionMode.paymentByCash) return 'Payment by Cash';
  if (mode == TransactionMode.paymentByBank) return 'Payment by Bank';
  if (mode == TransactionMode.partialPaymentByCash)
    return 'Partial Payment by Cash';
  if (mode == TransactionMode.partialPaymentByBank)
    return 'Partial Payment by Bank';

  return 'Contra';
}

// Future<LedgerMaster> getTransactionModeLedgerMaster(mode) async {
//   if (mode == TransactionMode.partialPaymentByBank ||
//       mode == TransactionMode.paymentByBank) {
//     Provider((ref) async {
//       return await ref
//           .read(ledgerMasterRepositoryProvider)
//           .getItem(id: LedgerMasterIndex.Bank);
//     });
//   } else {
//     final _paymentSide = Provider((ref) async {
//       await ref
//           .read(ledgerMasterRepositoryProvider)
//           .getItem(id: LedgerMasterIndex.Cash);
//     });
//     return _paymentSide;
//   }
// }
