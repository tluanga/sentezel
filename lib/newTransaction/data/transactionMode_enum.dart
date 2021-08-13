enum TransactionMode {
  credit,
  paymentByCash,
  paymentByBank,
  partialPaymentByCash,
  partialPaymentByBank,
  contra,
}

String convertTransactionModeToString(TransactionMode mode) {
  if (mode == TransactionMode.credit) return 'Credit';
  if (mode == TransactionMode.paymentByCash) return 'Payment by Cash';
  if (mode == TransactionMode.paymentByBank) return 'Payment by Bank';
  if (mode == TransactionMode.partialPaymentByCash)
    return 'Partial Payment by Cash';
  if (mode == TransactionMode.partialPaymentByBank)
    return 'Partial Payment by Bank';

  return 'Contra';
}
