import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterId_index.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_index.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_model.dart';
import 'package:sentezel/settings/transactionType/transactionType_repository.dart';

final generalSellControllerProvider =
    StateNotifierProvider<GeneralSellController, AsyncValue<Transaction>>(
        (ref) => GeneralSellController(ref.read)..init());

class GeneralSellController extends StateNotifier<AsyncValue<Transaction>> {
  final Reader _read;
  late Transaction initialState;

  String _partyName = '';
  String getPartyName() => _partyName;
  setParty(LedgerMaster party) {
    _partyName = party.name;
    final data = state.data!.value;
    state = AsyncValue.data(
      data.copyWith(partyId: party.id),
    );

    if (data.mode == TransactionMode.credit)
      state = AsyncValue.data(
        data.copyWith(
          creditSideLedgerId: null,
        ),
      );

    print(state);
  }

  String _creditSideName = '';
  String get CreditSideName => _creditSideName;
  _setCreditSideName() async {
    _creditSideName = await _read(ledgerMasterRepositoryProvider)
        .getLedgerMasterName(state.data!.value.creditSideLedgerId!);
  }

  String _debitSideName = '';
  String get DebitSideName => _debitSideName;
  _setDebitSideName() async {
    _debitSideName = await _read(ledgerMasterRepositoryProvider)
        .getLedgerMasterName(state.data!.value.debitSideLedgerId!);
  }

  //------------This credit amount is for display purpose only----
  //----And it will not be saved in the database
  int _debitAmount = 0;
  int get debitAmount => _debitAmount;
  _setDebitAmount() {
    if (state.data!.value.mode == TransactionMode.partialPaymentByBank ||
        state.data!.value.mode == TransactionMode.partialPaymentByCash) {
      _debitAmount =
          state.data!.value.amount - state.data!.value.partialPaymentAmount!;
    } else
      _debitAmount = state.data!.value.amount;
    print('debit amount is $_debitAmount');
  }

  GeneralSellController(this._read) : super(AsyncValue.loading());

  //------------For Initialization--------
  final int _transactionTypeId = TransactionTypeIndex.SaleOfGoods;
  init() async {
    TransactionType _transactionType =
        await _read(transactionTypeRepositoryProvider)
            .getItem(id: _transactionTypeId);
    initialState = Transaction(
      amount: 0,
      particular: _transactionType.name,
      mode: TransactionMode.paymentByCash,
      sumChetVelDanType: _transactionType.sumChetVelDanType,
      creditSideLedgerId: _transactionType.creditSideLedger,
      debitSideLedgerId: _transactionType.debitSideLedger,
      transactionTypeId: _transactionType.id,
      partyId: null,
      date: DateTime.now(),
    );
    state = AsyncValue.data(
      initialState,
    );

    print(_creditSideName);
  }

  setMode(TransactionMode mode) async {
    int _debitSideid;
    mode == TransactionMode.paymentByCash
        ? _debitSideid = LedgerMasterIndex.Cash
        : _debitSideid = LedgerMasterIndex.Bank;
    //We have to reset the partial payment amount if a partial payment is not selected

    state = AsyncValue.data(
      state.data!.value.copyWith(
        mode: mode,
        debitSideLedgerId: _debitSideid,
        partialPaymentAmount: 0,
      ),
    );
    _setDebitSideName();
  }

  setup() {
    _setDebitAmount();
    _setCreditSideName();
    _setDebitSideName();
  }

  submit() async {
    try {
      _read(transactionRepositoryProvider).add(payload: state.data!.value);
    } catch (e) {
      print(e);
    }
  }

  reset() {
    state = AsyncValue.data(
      initialState,
    );

    _partyName = '';
    print('Reset is called');
  }
}
