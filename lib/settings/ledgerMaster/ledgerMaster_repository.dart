import 'package:riverpod/riverpod.dart';
import 'package:sentezel/common/baseClasses/base_repository.dart';
import 'package:sentezel/common/database/db_service.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterType_enum.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_config.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';
import 'package:sqflite_common/sqlite_api.dart';

final ledgerMasterRepositoryProvider = Provider<LedgerMasterRepository>(
  (ref) => LedgerMasterRepository(ref.read),
);

class LedgerMasterRepository implements BaseRepository<LedgerMaster> {
  // ignore: unused_field
  final Reader _read;
  final String dbName = LedgerMasterConfig.ledgerMasterTable;

  const LedgerMasterRepository(this._read);

  @override
  void add({required LedgerMaster payload}) async {
    Database db = await DatabaseService.instance.db;
    try {
      var b = await db.insert(dbName, payload.toMap());
    } catch (e) {
      print(e);
    }
    // final userId = _read(authControllerProvider)!.uid;
  }

  @override
  getItem({required int id}) async {
    Database db = await DatabaseService.instance.db;
    try {
      final result = await db.query(dbName, where: 'id=?', whereArgs: [id]);
      if (result.length != 0) {
        return LedgerMaster.fromMap(result.first);
      } else
        return null;
    } catch (e) {
      print(e);
    }
  }

  //-------Get All item--
  @override
  Future<List<LedgerMaster>> getList({
    String searchString = '',
    LedgerMasterType type = LedgerMasterType.party,
  }) async {
    try {
      String _type = getLedgerMasterTypeEnumInString(type);
      Database db = await DatabaseService.instance.db;

      final result = await db.rawQuery('''
      Select * from $dbName
      WHERE name LIKE '$searchString%'
      AND type Like '$_type'
      ''');
      List<LedgerMaster> list = [];
      result.forEach((item) {
        list.add(LedgerMaster.fromMap(item));
      });
      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  void remove({required id}) async {
    Database db = await DatabaseService.instance.db;
    db.delete(
      dbName,
      where: 'id=?',
      whereArgs: [id],
    );
  }

  @override
  void update({required payload}) async {
    try {
      Database db = await DatabaseService.instance.db;
      await db.update(
        dbName,
        payload.toMap(),
        where: 'id=?',
        whereArgs: [payload.id],
      );
    } catch (e) {
      print(e);
    }
  }
}
