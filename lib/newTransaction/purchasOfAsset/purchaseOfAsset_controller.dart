import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/settings/party/data/party_model.dart';

final purchaseOfAssetControllerProvider =
    StateNotifierProvider<PurchaseOfAssetController, Transaction>(
        (ref) => PurchaseOfAssetController(ref.read));

class PurchaseOfAssetController extends StateNotifier<Transaction> {
  final Reader _read;
  String _partyName = '';
  PurchaseOfAssetController(this._read)
      : super(Transaction(
          amount: 0,
          particular: '',
          mode: TransactionMode.paymentByCash,
          date: DateTime.now(),
        ));
  setParty(Party party) {
    _partyName = party.name;
    state = state.copyWith(partyId: party.id);
    print(state);
  }

  String getPartyName() => _partyName;
}
