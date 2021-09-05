import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/enums/sumChetvelDanType_enum.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';

import 'package:sentezel/newTransaction/sell/generalSell/generalSell_model.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterId_index.dart';

import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_index.dart';

final generalSellControllerProvider =
    StateNotifierProvider<GeneralSellController, GeneralSell>(
        (ref) => GeneralSellController(ref.read)..init());

class GeneralSellController extends StateNotifier<GeneralSell> {
  final Reader _read;

  GeneralSellController(this._read)
      : super(
          GeneralSell(
            amount: 0,
            particular: 'Sell of Goods',
            date: DateTime.now(),
            mode: TransactionMode.paymentByCash,
          ),
        );
  init() async {
    final _paymentSide = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: LedgerMasterIndex.Cash);
    final _creditSideLedger = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: LedgerMasterIndex.Sales);
    state = state.copyWith(
      creditSideLedger: _creditSideLedger,
      debitSideLedger: _paymentSide,
    );
  }

  setup() async {
    print('setting up');
    var _debitSideLedger;
    if (state.mode == TransactionMode.paymentByCash ||
        state.mode == TransactionMode.partialPaymentByCash) {
      _debitSideLedger = await _read(ledgerMasterRepositoryProvider)
          .getItem(id: LedgerMasterIndex.Cash);
    }
    if (state.mode == TransactionMode.paymentByCash ||
        state.mode == TransactionMode.partialPaymentByCash) {
      _debitSideLedger = await _read(ledgerMasterRepositoryProvider)
          .getItem(id: LedgerMasterIndex.Bank);
    }

    state = state.copyWith(
      creditAmount: state.amount,
      debitAmount: state.amount - state.partialPaymentAmount,
      debitSideLedger: _debitSideLedger,
    );
  }

  submit() async {
    try {
      _read(transactionRepositoryProvider).add(
          payload: Transaction(
              amount: state.debitAmount,
              particular: state.particular,
              date: state.date,
              mode: state.mode,
              sumChetVelDanType: TransactionType.lakluh,
              transactionTypeId: TransactionCategoryIndex.SaleOfGoods,
              debitSideLedgerId: state.debitSideLedger != null
                  ? state.debitSideLedger!.id
                  : null,
              partyId: state.party != null ? state.party!.id : null,
              creditSideLedgerId: LedgerMasterIndex.Sales));
    } catch (e) {
      print(e);
    }
  }
}
