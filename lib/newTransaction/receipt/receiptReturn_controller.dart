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

final receiptControllerProvider =
    StateNotifierProvider<ReceiptController, AsyncValue<Transaction>>(
        (ref) => ReceiptController(ref.read)..init());

class ReceiptController extends StateNotifier<AsyncValue<Transaction>> {
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

  String _debitSideName = '';
  String get DebitSideName => _debitSideName;

  ReceiptController(this._read) : super(AsyncValue.loading());

  //------------For Initialization--------
  final int _transactionTypeId = TransactionTypeIndex.PurchaseReturn;
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
    _setCreditSideName();
    _setDebitSideName();

    print(_creditSideName);
  }

  setMode(TransactionMode mode) async {
    int _debitSideid;
    mode == TransactionMode.paymentByCash
        ? _debitSideid = LedgerMasterIndex.Cash
        : _debitSideid = LedgerMasterIndex.Bank;
    state = AsyncValue.data(
      state.data!.value.copyWith(
        mode: mode,
        debitSideLedgerId: _debitSideid,
      ),
    );
    _setDebitSideName();
  }

  //---------Private helper function
  _setCreditSideName() async {
    _creditSideName = await _read(ledgerMasterRepositoryProvider)
        .getLedgerMasterName(state.data!.value.creditSideLedgerId!);
  }

  _setDebitSideName() async {
    _debitSideName = await _read(ledgerMasterRepositoryProvider)
        .getLedgerMasterName(state.data!.value.debitSideLedgerId!);
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
