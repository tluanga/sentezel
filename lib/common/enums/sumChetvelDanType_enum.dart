enum SumChetvelDanType {
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

String convertSumChetvelDanTypeToString(SumChetvelDanType type) {
  switch (type) {
    case SumChetvelDanType.lei:
      return 'Lei';
    case SumChetvelDanType.hralh:
      return 'Hralh';
    case SumChetvelDanType.lakluh:
      return 'Lakluh';
    case SumChetvelDanType.pekchhuah:
      return 'Pekchhuah';
    case SumChetvelDanType.debtRepaymentByDebtor:
      return 'Debt Repayment By Debtor';
    case SumChetvelDanType.debtRepaymentToCreditor:
      return 'Debt Repayment To Creditor';
    case SumChetvelDanType.bankToCash:
      return 'Bank To Cash';
    case SumChetvelDanType.purchaseReturn:
      return 'Purchase Return';
    case SumChetvelDanType.saleReturn:
      return 'Sale Return';
    case SumChetvelDanType.capitalInjection:
      return 'Capital Injection';
    case SumChetvelDanType.openingBalanceCash:
      return 'Opening Balance Cash';
    case SumChetvelDanType.openingBalanceBank:
      return 'Opening Balance Bank';
    default:
      return 'Lei';
  }
}
