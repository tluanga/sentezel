import 'package:riverpod/riverpod.dart';
import 'package:sentezel/common/baseClasses/base_repository.dart';
import 'package:sentezel/common/database/db_service.dart';

import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_data.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_config.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';
import 'package:sqflite_common/sqlite_api.dart';

final ledgerMasterRepositoryProvider = Provider<LedgerMasterRepository>(
  (ref) => LedgerMasterRepository(ref.read),
);

class LedgerMasterRepository implements BaseRepository<LedgerMaster> {
  // ignore: unused_field
  final Reader _read;

  const LedgerMasterRepository(this._read);

  @override
  void add({required LedgerMaster payload}) {
    print('adding a new document in firebase');
    print('payload is $payload');
    // final userId = _read(authControllerProvider)!.uid;
  }

  @override
  getItem({required int id}) async {
    return ledgerMasterData.firstWhere((element) => element.id == 0);
  }

  @override
  Future<List<LedgerMaster>> getList({String? searchString}) async {
    Database db = await DatabaseService.instance.db;
    final list = await db.query(LedgerMasterConfig.ledgerMasterTable);
    print(list);
    List<LedgerMaster> result = [];

    list.forEach((element) {
      result.add(LedgerMaster.fromMap(element));
    });
    return result;
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

    print('After update ${ledgerMasterData[index]}');
  }
}
