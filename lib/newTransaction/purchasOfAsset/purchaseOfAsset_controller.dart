import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';

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
      debitSideLedgerId: asset.id,
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
          date: DateTime.now(),
        ));

  setMode(TransactionMode mode) {
    state = state.copyWith(mode: mode);
  }
}
