
import 'package:riverpod/riverpod.dart';
import 'package:sentezel/common/baseClasses/base_repository.dart';

import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_data.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_model.dart';

final ledgerMasterRepositoryProvider = Provider<LedgerMasterRepository>(
  (ref) => LedgerMasterRepository(ref.read),
);

class LedgerMasterRepository implements BaseRepository<LedgerMaster> {
  final Reader _read;

  const LedgerMasterRepository(this._read);

  @override
  void add({required LedgerMaster payload}) {
    print('adding a new document in firebase');
    print('payload is $payload');
    // final userId = _read(authControllerProvider)!.uid;
    
  }

  @override
  getItem({required int id}) {
    return ledgerMasterData.firstWhere((element) => element.id == 0);
  }

  @override
  List<LedgerMaster> getList() {
    return ledgerMasterData.toList();
  }

  @override
  void remove({required id}) {
    ledgerMasterData.remove(id);
  }

  @override
  void update({required payload}) {
    int index =
        ledgerMasterData.indexWhere((element) => element.name == payload.name);
    print('index $index');
    ledgerMasterData[index] = payload.copyWith(status: payload.status);

    print('After update ${ledgerMasterData[index]}');
  }
}
