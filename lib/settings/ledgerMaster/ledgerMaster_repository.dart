import 'package:flutter_test/flutter_test.dart';

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

class LedgerMasterRepository extends BaseRepository<LedgerMaster> {
  // ignore: unused_field
  final Reader _read;
  final String dbName = LedgerMasterConfig.ledgerMasterTable;

  LedgerMasterRepository(this._read) : super();

  @override
  void add({required LedgerMaster payload}) async {
    Database db = await DatabaseService.instance.db;
    try {
      await db.insert(dbName, payload.toMap());
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
      }
      throw ('Something went wrong!');
    } catch (e) {
      throw (e);
    }
  }

  //-------Get All item--
  @override
  Future<List<LedgerMaster>> getList({
    String searchString = '',
    LedgerMasterType? type,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      String _type = '';
      if (type != null) _type = getLedgerMasterTypeEnumInString(type);
      Database db = await DatabaseService.instance.db;

      final result = await db.rawQuery('''
      Select * from $dbName
      WHERE name LIKE '$searchString%'
      AND type LIKE '$_type%'
      ''');
      List<LedgerMaster> list = [];
      result.forEach((item) {
        list.add(LedgerMaster.fromMap(item));
        print('name');
        print(item['name']);
      });

      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<String> getLedgerMasterName(int id) async {
    try {
      Database db = await DatabaseService.instance.db;

      final result = await db.query(dbName, where: 'id=?', whereArgs: [id]);

      return LedgerMaster.fromMap(result.first).name;
    } catch (e) {
      print(e);
      return 'Error';
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
