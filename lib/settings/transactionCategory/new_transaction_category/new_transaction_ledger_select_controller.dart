import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';

final newTransactionLedgerSelectControllerProvider = StateNotifierProvider<
        NewTransactionLedgerSelectController, AsyncValue<List<LedgerMaster>>>(
    (ref) => NewTransactionLedgerSelectController(ref.read));

class NewTransactionLedgerSelectController
    extends StateNotifier<AsyncValue<List<LedgerMaster>>> {
  final Reader _read;
  NewTransactionLedgerSelectController(this._read)
      : super(
          const AsyncLoading(),
        );

  loadData({String? searchParam = ''}) async {
    final data = await _read(ledgerMasterRepositoryProvider)
        .getList(searchString: searchParam!);
    if (data.isEmpty) {
      state = const AsyncData([]);
      return;
    }
    state = AsyncData(data);
  }
}
