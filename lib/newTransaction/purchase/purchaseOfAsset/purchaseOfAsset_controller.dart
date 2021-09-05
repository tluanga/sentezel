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

final purchaseOfAssetControllerProvider =
    StateNotifierProvider<PurchaseOfAssetController, AsyncValue<Transaction>>(
        (ref) => PurchaseOfAssetController(ref.read)..init());

class PurchaseOfAssetController extends StateNotifier<AsyncValue<Transaction>> {
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

  String _assetName = '';
  String getAssetName() => _assetName;
  setAsset(LedgerMaster asset) {
    _assetName = asset.name;
    final data = state.data!.value;
    state = AsyncValue.data(
      data.copyWith(
        assetLedgerId: asset.id,
        particular: data.particular + '-' + asset.name,
      ),
    );

    print(state);
  }

  String _creditSideName = '';
  String getCreditSideName() => _creditSideName;

  PurchaseOfAssetController(this._read) : super(AsyncValue.loading());

  final int _transactionTypeId = TransactionCategoryIndex.PurchaseOfAssets;

  //----------------Initialization----------------
  init() async {
    TransactionCategory _transactionType =
        await _read(transactionTypeRepositoryProvider)
            .getItem(id: _transactionTypeId);
    initialState = Transaction(
      amount: 0,
      particular: _transactionType.name,
      mode: TransactionMode.paymentByCash,
      transactionType: _transactionType.transactionType,
      creditSideLedgerId: _transactionType.creditSideLedger,
      debitSideLedgerId: _transactionType.debitSideLedger,
      transactionTypeId: _transactionType.id,
      partyId: null,
      date: DateTime.now(),
    );

    _creditSideName = await _read(ledgerMasterRepositoryProvider)
        .getLedgerMasterName(initialState.creditSideLedgerId!);

    state = AsyncValue.data(
      initialState,
    );
    print(_creditSideName);
  }

  setMode(TransactionMode mode) async {
    int _crediSideLedgerId = 0;
    _creditSideName = '';
    if (mode == TransactionMode.paymentByCash ||
        mode == TransactionMode.partialPaymentByCash)
      _crediSideLedgerId = LedgerMasterIndex.Cash;

    if (mode == TransactionMode.partialPaymentByBank ||
        mode == TransactionMode.paymentByBank)
      _crediSideLedgerId = LedgerMasterIndex.Bank;

    state = AsyncValue.data(
      state.data!.value.copyWith(
        creditSideLedgerId: _crediSideLedgerId,
        mode: mode,
      ),
    );
    if (state.data!.value.creditSideLedgerId != 0) _setCreditSideName();
  }

  setParticular(String particular) {
    final data = state.data!.value;
    state = AsyncValue.data(
      data.copyWith(particular: particular),
    );
  }

  setDate(DateTime date) {
    final data = state.data!.value;
    state = AsyncValue.data(
      data.copyWith(date: date),
    );
  }

  setAmount(int amount) {
    final data = state.data!.value;
    state = AsyncValue.data(
      data.copyWith(amount: amount),
    );
  }

  setPartialPaymentAmount(int partialAmount) {
    print('Setting partial amount $partialAmount');
    final data = state.data!.value;
    state = AsyncValue.data(
      data.copyWith(partialPaymentAmount: partialAmount),
    );
  }

  //---------Private helper function
  _setCreditSideName() async {
    _creditSideName = await _read(ledgerMasterRepositoryProvider)
        .getLedgerMasterName(state.data!.value.creditSideLedgerId!);
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
    _assetName = '';
  }
}
