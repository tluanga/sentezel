import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_model.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';

//-------------Provider for ledger master list controller----
final ledgerMasterListControllerProvider =
    StateNotifierProvider<LedgerMasterListController, List<LedgerMaster>>(
        (ref) => LedgerMasterListController(ref.read)..loadData());

class LedgerMasterListController extends StateNotifier<List<LedgerMaster>> {
  final Reader _read;

  LedgerMasterListController(this._read) : super([]);

  loadData()async {
    print('load data');
    state =await  _read(ledgerMasterRepositoryProvider).getList();
  }

  addLedgerMaster(LedgerMaster payload) {
    try {
      _read(ledgerMasterRepositoryProvider).add(payload: payload);
    } catch (e) {
      print(e);
    }
  }

  updateLedgerMaster(LedgerMaster payload) {
    try {
      _read(ledgerMasterRepositoryProvider).update(payload: payload);
    } catch (e) {
      print(e);
    }
  }
}
