import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/authentication/pin/pin_config.dart';
import 'package:sentezel/authentication/pin/pin_model.dart';

import 'package:sentezel/common/database/db_service.dart';

import 'package:sqflite/sqflite.dart';

final pinRepositoryProvider = Provider<PinRepository>(
  (ref) => PinRepository(),
);

class PinRepository {
  final String dbName = PinConfig.dbName;

  PinRepository() : super();
  //-----------Get Pin-------------
  Future<PIN> get() async {
    Database db = await DatabaseService.instance.db;

    final result = await db.query(dbName);

    return PIN.fromMap(result.first);
  }

  //-------------Pin Setup-------------
  void pinSetup(PIN payload) async {
    Database db = await DatabaseService.instance.db;
    await db.insert(dbName, payload.toMap());
  }

  //-----------Pin Change---------
  void pinChange(PIN payload) async {
    try {
      Database db = await DatabaseService.instance.db;
      await db.update(
        dbName,
        payload.toMap(),
        where: 'id=?',
        whereArgs: [1],
      );
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> reset() async {
    try {
      Database db = await DatabaseService.instance.db;
      await db.delete(dbName);
      final mapData = PIN(pin: 0, passPhrase: '').toMap();

      await db.insert(
        PinConfig.dbName,
        mapData,
      );
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
