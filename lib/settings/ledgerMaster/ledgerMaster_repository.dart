import 'package:riverpod/riverpod.dart';
import 'package:sentezel/common/baseClasses/base_repository.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_data.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_model.dart';

final ledgerMasterRepositoryProvider =
    Provider<LedgerMasterRepository>((ref) => LedgerMasterRepository());

class LedgerMasterRepository implements BaseRepository<LedgerMaster> {
  @override
  void add({required LedgerMaster payload}) {
    ledgerMasterData.add(payload);
  }

  @override
  getItem({required int id}) {
    return ledgerMasterData.firstWhere((element) => element.id == id);
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
