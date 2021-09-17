import 'package:sentezel/common/baseClasses/base_repository.dart';
import 'package:sentezel/common/database/db_service.dart';
import 'package:sentezel/settings/pin/pin_config.dart';
import 'package:sentezel/settings/pin/pin_model.dart';
import 'package:sqflite/sqflite.dart';

class PinRepository {
  //-------------Pin Setup-------------
  void pinSetup(PIN payload) async {
    Database db = await DatabaseService.instance.db;
    await db.insert(PinConfig.dbName, payload.toMap());
  }

  //-----------Pin Change---------
  void pinChange(PIN payload) async {
    try {
      Database db = await DatabaseService.instance.db;
      await db.update(
        PinConfig.dbName,
        payload.toMap(),
        where: 'id=?',
        whereArgs: [payload.id],
      );
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
