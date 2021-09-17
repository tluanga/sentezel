enum TransactionType {
  lei,
  hralh,
  lakluh,
  pekchhuah,
  debtRepaymentByDebtor,
  debtRepaymentToCreditor,
  bankToCash,
  cashToBank,
  purchaseReturn,
  saleReturn,
  capitalInjection,
  openingBalanceCash,
  openingBalanceBank,
}

String convertTransactionTypeToString(TransactionType type) {
  switch (type) {
    case TransactionType.lei:
      return 'Lei';
    case TransactionType.hralh:
      return 'Hralh';
    case TransactionType.lakluh:
      return 'Lakluh';
    case TransactionType.pekchhuah:
      return 'Pekchhuah';
    case TransactionType.debtRepaymentByDebtor:
      return 'Debt Repayment By Debtor';
    case TransactionType.debtRepaymentToCreditor:
      return 'Debt Repayment To Creditor';
    case TransactionType.bankToCash:
      return 'Bank To Cash';
    case TransactionType.purchaseReturn:
      return 'Purchase Return';
    case TransactionType.saleReturn:
      return 'Sale Return';
    case TransactionType.capitalInjection:
      return 'Capital Injection';
    case TransactionType.openingBalanceCash:
      return 'Opening Balance Cash';
    case TransactionType.openingBalanceBank:
      return 'Opening Balance Bank';
    default:
      return 'Lei';
  }
}

TransactionType transactionTypeFromString(String value) {
  switch (value) {
    case 'lei':
      return TransactionType.lei;
    case 'hralh':
      return TransactionType.hralh;
    case 'lakluh':
      return TransactionType.lakluh;
    case 'pekchhuah':
      return TransactionType.pekchhuah;
    case 'debtRepaymentByDebtor':
      return TransactionType.debtRepaymentByDebtor;
    case 'debtRepaymentToCreditor':
      return TransactionType.debtRepaymentToCreditor;
    case 'bankToCash':
      return TransactionType.cashToBank;
    case 'cashToBank':
      return TransactionType.bankToCash;
    case 'purchaseReturn':
      return TransactionType.purchaseReturn;
    case 'capitalInjection':
      return TransactionType.capitalInjection;
    case 'openingBalanceCash':
      return TransactionType.openingBalanceCash;
    case 'openingBalanceBank':
      return TransactionType.openingBalanceBank;
    default:
      return TransactionType.lei;
  }
}
