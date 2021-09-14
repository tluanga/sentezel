import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterType_enum.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';

//-------------Provider for ledger master list controller----
final assetListControllerProvider =
    StateNotifierProvider<AssetListController, AsyncValue<List<LedgerMaster>>>(
        (ref) => AssetListController(ref.read)..loadData());

class AssetListController
    extends StateNotifier<AsyncValue<List<LedgerMaster>>> {
  final Reader _read;

  LedgerMasterType _type = LedgerMasterType.asset;

  AssetListController(this._read) : super(AsyncValue.loading());

  loadData({String searchString = ''}) async {
    print('load data');
    try {
      final result = await _read(ledgerMasterRepositoryProvider).getList(
        searchString: searchString,
        type: _type,
      );
      if (mounted) {
        state = AsyncValue.data(result);
      }
    } on Exception catch (e) {
      return e;
    }
  }

  //

  addAsset(LedgerMaster payload) {
    try {
      _read(ledgerMasterRepositoryProvider).add(payload: payload);
      loadData();
    } catch (e) {
      print(e);
    }
  }

  updateAsset(LedgerMaster payload) {
    try {
      _read(ledgerMasterRepositoryProvider).update(payload: payload);
    } catch (e) {
      print(e);
    }
  }
}
