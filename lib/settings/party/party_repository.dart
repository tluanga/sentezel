import 'package:riverpod/riverpod.dart';
import 'package:sentezel/common/baseClasses/base_repository.dart';
import 'package:sentezel/common/database/db_service.dart';
import 'package:sentezel/settings/party/party_config.dart';
import 'package:sqflite_common/sqlite_api.dart';

import 'data/party_model.dart';

final partyRepositoryProvider = Provider((ref) => PartyRepository(ref.read));

class PartyRepository implements BaseRepository<Party> {
  final Reader _read;

  const PartyRepository(this._read);
  //---Add new Party----
  @override
  void add({required payload}) async {
    Database db = await DatabaseService.instance.db;
    try {
      db.insert(PartyConfig.partyTable, payload.toMap());
    } catch (e) {
      print(e);
    }
  }

  ///----Get Single Item
  @override
  Future<Party?> getItem({required int id}) async {
    Database db = await DatabaseService.instance.db;
    try {
      final result = await db
          .query(PartyConfig.partyTable, where: 'id=?', whereArgs: [id]);
      if (result.length != 0) {
        return Party.fromMap(result.first);
      } else
        return null;
    } catch (e) {
      print(e);
    }
  }

  //-------Get All item--
  @override
  Future<List<Party>> getList() async {
    try {
      Database db = await DatabaseService.instance.db;
      final result = await db.query(PartyConfig.partyTable);
      List<Party> partyList = [];
      result.forEach((party) {
        partyList.add(Party.fromMap(party));
      });
      return partyList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  void remove({required id}) async {
    Database db = await DatabaseService.instance.db;
    db.delete(
      PartyConfig.partyTable,
      where: 'id=?',
      whereArgs: [id],
    );
  }

  @override
  void update({required Party payload}) async {
    try {
      Database db = await DatabaseService.instance.db;
      await db.update(
        PartyConfig.partyTable,
        payload.toMap(),
        where: 'id=?',
        whereArgs: [payload.id],
      );
    } catch (e) {
      print(e);
    }
  }
}
