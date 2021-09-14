import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterType_enum.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';

final partyListControllerProvider =
    StateNotifierProvider<PartyListController, AsyncValue<List<LedgerMaster>>>(
        (ref) => PartyListController(ref.read)..loadData());

class PartyListController
    extends StateNotifier<AsyncValue<List<LedgerMaster>>> {
  final Reader _read;
  LedgerMasterType _type = LedgerMasterType.party;

  PartyListController(this._read) : super(AsyncValue.loading());

  loadData({String searchString = ''}) async {
    print('Loading Party List');
    try {
      final result = await _read(ledgerMasterRepositoryProvider).getList(
        searchString: searchString,
        type: _type,
      );
      if (mounted) state = AsyncValue.data(result);
    } on Exception catch (e) {
      return e;
    }
  }

  addParty(LedgerMaster payload) {
    try {
      _read(ledgerMasterRepositoryProvider).add(payload: payload);
      loadData();
    } catch (e) {
      print(e);
    }
  }

  getParty(int id) {
    try {
      _read(ledgerMasterRepositoryProvider).getItem(id: id);
    } catch (e) {
      print(e);
    }
  }

  deleteParty(int id) {
    try {
      _read(ledgerMasterRepositoryProvider).remove(id: id);
      loadData();
    } catch (e) {
      print(e);
    }
  }

  updateParty(LedgerMaster payload) {
    try {
      _read(ledgerMasterRepositoryProvider).update(payload: payload);
      loadData();
    } catch (e) {
      print(e);
    }
  }
}
