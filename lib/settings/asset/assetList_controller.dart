import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterType_enum.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';

//-------------Provider for ledger master list controller----
final assetListControllerProvider =
    StateNotifierProvider<AssetListController, List<LedgerMaster>>(
        (ref) => AssetListController(ref.read)..loadData());

class AssetListController extends StateNotifier<List<LedgerMaster>> {
  final Reader _read;
  bool _isLoading = true;
  LedgerMasterType _type = LedgerMasterType.asset;
  bool getIsLoading() {
    return _isLoading;
  }

  AssetListController(this._read) : super([]);

  loadData({String searchString = ''}) async {
    print('load data');
    state = await _read(ledgerMasterRepositoryProvider).getList(
      searchString: searchString,
      type: _type,
    );
    if (state != null) _isLoading = false;
  }

  //

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
