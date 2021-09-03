import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/enums/sumChetvelDanType_enum.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';

import 'package:sentezel/newTransaction/sell/generalSell/generalSell_model.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterId_index.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';
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
            creditAmount: 0,
            debitAmount: 0,
            particular: '',
            date: DateTime.now(),
            mode: TransactionMode.paymentByCash,
          ),
        );
  init() async {
    final _paymentSide = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: LedgerMasterIndex.Cash);
    final _debitSideLedger = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: LedgerMasterIndex.Sales);
    state = state.copyWith(
      creditSideLedger: _paymentSide,
      debitSideLedger: _debitSideLedger,
    );
  }

  setAmount(int amount) {
    print(amount);
    state = state.copyWith(
      creditAmount: amount,
      debitAmount: amount - state.partialPaymentAmount,
    );
  }

  setMode(TransactionMode mode) async {
    int _paymentSideid;
    LedgerMaster _paymentSide;
    if (mode == TransactionMode.paymentByCash) {
      _paymentSideid = LedgerMasterIndex.Cash;
      _paymentSide = await _read(ledgerMasterRepositoryProvider)
          .getItem(id: _paymentSideid)!;
      state = state.copyWith(
        creditSideLedger: _paymentSide,
        mode: mode,
      );
    }
    if (mode == TransactionMode.paymentByCash) {
      _paymentSideid = LedgerMasterIndex.Bank;
      _paymentSide = await _read(ledgerMasterRepositoryProvider)
          .getItem(id: _paymentSideid)!;
      state = state.copyWith(
        creditSideLedger: _paymentSide,
        mode: mode,
      );
    }
    state = state.copyWith(
      mode: mode,
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
              sumChetVelDanType: SumChetvelDanType.lakluh,
              transactionTypeId: TransactionTypeIndex.SaleOfGoods,
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
