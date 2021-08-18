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

SumChetvelDanType sumChetvelDanTypeFromString(String value) {
  switch (value) {
    case 'lei':
      return SumChetvelDanType.lei;
    case 'hralh':
      return SumChetvelDanType.hralh;
    case 'lakluh':
      return SumChetvelDanType.lakluh;
    case 'pekchhuah':
      return SumChetvelDanType.pekchhuah;
    case 'debtRepaymentByDebtor':
      return SumChetvelDanType.debtRepaymentByDebtor;
    case 'debtRepaymentToCreditor':
      return SumChetvelDanType.debtRepaymentToCreditor;
    case 'bankToCash':
      return SumChetvelDanType.cashToBank;
    case 'cashToBank':
      return SumChetvelDanType.bankToCash;
    case 'purchaseReturn':
      return SumChetvelDanType.purchaseReturn;
    case 'capitalInjection':
      return SumChetvelDanType.capitalInjection;
    case 'openingBalanceCash':
      return SumChetvelDanType.openingBalanceCash;
    case 'openingBalanceBank':
      return SumChetvelDanType.openingBalanceBank;
    default:
      return SumChetvelDanType.lei;
  }
}
