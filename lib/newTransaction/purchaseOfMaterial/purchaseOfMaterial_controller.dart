import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/enums/sumChetvelDanType_enum.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterId_index.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_index.dart';

final purchaseOfAssetControllerProvider =
    StateNotifierProvider<PurchaseOfAssetController, Transaction>(
        (ref) => PurchaseOfAssetController(ref.read));

class PurchaseOfAssetController extends StateNotifier<Transaction> {
  final Reader _read;

  String _partyName = '';
  String getPartyName() => _partyName;
  setParty(LedgerMaster party) {
    _partyName = party.name;
    state = state.copyWith(partyId: party.id);
    print(state);
  }

  String _assetName = '';
  String getAssetName() => _assetName;
  setAsset(LedgerMaster asset) {
    _assetName = asset.name;
    state = state.copyWith(
      assetLedgerId: asset.id,
    );
    print(state);
  }

  setDate(DateTime date) {
    state = state.copyWith(date: date);
    print('new Date is ${state.date}');
  }

  PurchaseOfAssetController(this._read)
      : super(Transaction(
          amount: 0,
          particular: '',
          mode: TransactionMode.paymentByCash,
          sumChetVelDanType: SumChetvelDanType.lei,
          creditSideLedgerId: LedgerMasterIndex.Cash,
          transactionTypeId: TransactionTypeIndex.PurchaseOfAssets,
          date: DateTime.now(),
        ));

  setMode(TransactionMode mode) {
    if (mode == TransactionMode.paymentByCash ||
        mode == TransactionMode.partialPaymentByCash) {
      state = state.copyWith(
          mode: mode, creditSideLedgerId: LedgerMasterIndex.Cash);
    }

    if (mode == TransactionMode.partialPaymentByBank ||
        mode == TransactionMode.partialPaymentByBank)
      state = state.copyWith(
          mode: mode, creditSideLedgerId: LedgerMasterIndex.Bank);

    state = state.copyWith(mode: mode);
  }

  setParticular(String particular) {
    state = state.copyWith(particular: particular);
  }

  setState(Transaction transaction) {
    state = transaction;
  }

  submit() async {
    try {
      _read(transactionRepositoryProvider).add(payload: state);
    } catch (e) {
      print(e);
    }
  }

  reset() {
    state = new Transaction(
      amount: 0,
      particular: '',
      mode: TransactionMode.paymentByCash,
      sumChetVelDanType: SumChetvelDanType.lei,
      transactionTypeId: TransactionTypeIndex.PurchaseOfAssets,
      date: DateTime.now(),
    );
    _partyName = '';
    _assetName = '';
  }
}
