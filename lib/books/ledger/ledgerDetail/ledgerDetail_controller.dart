import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledger_controller.dart';
import 'package:sentezel/books/ledger/ledger_model.dart';

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
    state = _read(ledgerControllerProvider.notifier).getLedgerDetail(id);
  }
}
