import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/settings/party/party_repository.dart';

import 'data/party_model.dart';

final partyListControllerProvider =
    StateNotifierProvider<PartyListController, List<Party>>(
        (ref) => PartyListController(ref.read)..loadData());

class PartyListController extends StateNotifier<List<Party>> {
  final Reader _read;
  PartyListController(this._read) : super([]);

  loadData() async {
    print('Loading Party List');
    state = await _read(partyRepositoryProvider).getList();
  }

  addParty(Party payload) {
    try {
      _read(partyRepositoryProvider).add(payload: payload);
      loadData();
    } catch (e) {
      print(e);
    }
  }

  getParty(int id) {
    try {
      _read(partyRepositoryProvider).getItem(id: id);
    } catch (e) {
      print(e);
    }
  }

  deleteParty(int id) {
    try {
      _read(partyRepositoryProvider).remove(id: id);
    } catch (e) {
      print(e);
    }
  }

  updateParty(Party payload) {
    try {
      _read(partyRepositoryProvider).update(payload: payload);
    } catch (e) {
      print(e);
    }
  }
}
