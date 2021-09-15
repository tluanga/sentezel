import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledger_controller.dart';
import 'package:sentezel/books/ledger/ledger_model.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';

final ledgerDetailControllerProvider =
    StateNotifierProvider<LedgerDetailController, LedgerReport>(
        (ref) => LedgerDetailController(ref.read));

class LedgerDetailController extends StateNotifier<LedgerReport> {
  Reader _read;
  LedgerDetailController(this._read)
      : super(
          LedgerReport(
              ledgerId: 0,
              name: '',
              description: '',
              creditAmount: 0,
              debitAmount: 0),
        );

  loadData({required int id}) async {
    print('load Data');
    state = await _read(ledgerControllerProvider.notifier).getLedgerDetail(id);
    print(state);
  }

  removeItem({required int transactionId}) async {
    _read(transactionRepositoryProvider).remove(id: transactionId);
    _read(ledgerControllerProvider.notifier).loadData();
    final _ledgerTransaction = state.ledgerTransaction;
    _ledgerTransaction!
        .removeWhere((element) => element.transaction!.id! == transactionId);
    state = state.copyWith(ledgerTransaction: _ledgerTransaction);
  }
}
