import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/common/database/db_service.dart';
import 'package:sentezel/settings/business_profile/business_profile_config.db.dart';
import 'package:sentezel/settings/business_profile/business_profile_model.dart';
import 'package:sqflite/sqlite_api.dart';

final businessProfileRepository =
    Provider((ref) => const BusinessProfileRepository());

class BusinessProfileRepository {
  final String dbName = BusinessProfileConfig.dbName;

  const BusinessProfileRepository();

  void add(BusinessProfile payload) async {
    Database db = await DatabaseService.instance.db;
    //check there is any entry
    final result = await db.query(dbName);
    if (result.isEmpty) {
      db.insert(dbName, payload.toMap());
    } else {
      try {
        await db.update(
          dbName,
          payload.toMap(),
          where: 'id=?',
          whereArgs: [payload.id],
        );
      } catch (e) {
        e.toString();
      }
    }
    //if there is no entry add
    //if there is entry update
  }

  Future<BusinessProfile> get() async {
    Database db = await DatabaseService.instance.db;
    final result = await db.query(dbName);
    return BusinessProfile.fromMap(result.first);
  }
}
