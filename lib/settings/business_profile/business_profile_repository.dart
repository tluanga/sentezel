import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/common/database/db_service.dart';
import 'package:sentezel/settings/business_profile/business_profile_config.db.dart';
import 'package:sentezel/settings/business_profile/business_profile_model.dart';
import 'package:sentezel/settings/business_profile/data/business_type_enum.dart';
import 'package:sqflite/sqlite_api.dart';

final businessProfileRepository =
    Provider((ref) => const BusinessProfileRepository());

class BusinessProfileRepository {
  final String dbName = BusinessProfileConfig.dbName;

  const BusinessProfileRepository();

  Future<void> add(BusinessProfile payload) async {
    Database db = await DatabaseService.instance.db;
    //check there is any entry
    final result = await db.query(dbName);
    if (result.isEmpty) {
      final result = await db.insert(dbName, payload.toMap());
      print(result);
    } else {
      try {
        final a = await db.query(dbName);
        print(a);
        await db.update(
          dbName,
          payload.toMap(),
          where: 'id=?',
          whereArgs: [payload.id],
        );
        final result1 = await db.query(dbName);
        print(result1);
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

  Future<void> reset() async {
    Database db = await DatabaseService.instance.db;
    await db.delete(dbName);
    final mapData = BusinessProfile(
        name: '', description: '', type: BusinessType.mahniSiamZuar);

    await db.insert(
      BusinessProfileConfig.dbName,
      mapData.toMap(),
    );
  }
}
