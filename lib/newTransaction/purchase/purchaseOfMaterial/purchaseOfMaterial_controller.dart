import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:sentezel/common/enums/sumChetvelDanType_enum.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterId_index.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_index.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_model.dart';
import 'package:sentezel/settings/transactionType/transactionType_repository.dart';

final purchaseOfMaterialControllerProvider = StateNotifierProvider<
        PurchaseOfMaterialController, AsyncValue<Transaction>>(
    (ref) => PurchaseOfMaterialController(ref.read)..init());

class PurchaseOfMaterialController
    extends StateNotifier<AsyncValue<Transaction>> {
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

  PurchaseOfMaterialController(this._read) : super(AsyncValue.loading());

  //-------------Initializing the State------------
  final int _transactionTypeId = TransactionTypeIndex.PurchaseOfRawMaterial;
  init() async {
    TransactionType _transactionType =
        await _read(transactionTypeRepositoryProvider)
            .getItem(id: _transactionTypeId);
    initialState = Transaction(
      amount: 0,
      particular: _transactionType.name,
      mode: TransactionMode.paymentByCash,
      sumChetVelDanType: _transactionType.sumChetVelDanType,
      creditSideLedgerId: _transactionType.debitSideLedger,
      debitSideLedgerId: _transactionType.creditSideLedger,
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
    if (mode == TransactionMode.paymentByCash ||
        mode == TransactionMode.partialPaymentByCash) {
      final data = state.data!.value;
      state = AsyncValue.data(
        data.copyWith(creditSideLedgerId: LedgerMasterIndex.Cash),
      );
      _creditSideName = await _read(ledgerMasterRepositoryProvider)
          .getLedgerMasterName(state.data!.value.creditSideLedgerId!);
    }

    if (mode == TransactionMode.partialPaymentByBank ||
        mode == TransactionMode.paymentByBank) {
      final data = state.data!.value;
      state = AsyncValue.data(
        data.copyWith(creditSideLedgerId: LedgerMasterIndex.Bank),
      );
      _creditSideName = await _read(ledgerMasterRepositoryProvider)
          .getLedgerMasterName(state.data!.value.creditSideLedgerId!);
    }
    if (mode == TransactionMode.credit) {
      final data = state.data!.value;
      state = AsyncValue.data(
        data.copyWith(creditSideLedgerId: null),
      );
      _creditSideName = '';
    }

    final data = state.data!.value;
    state = AsyncValue.data(
      data.copyWith(mode: mode),
    );
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
      data.copyWith(creditPartialPaymentAmount: partialAmount),
    );
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
