import 'package:sentezel/settings/business_profile/business_profile_config.db.dart';
import 'package:sentezel/settings/business_profile/business_profile_model.dart';
import 'package:sentezel/settings/business_profile/data/business_type_enum.dart';

import 'package:sqflite/sqflite.dart';

void injectBusinessProfile(Database db) async {
  await db.execute(
    '''
      CREATE TABLE 
        ${BusinessProfileConfig.dbName}(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            description TEXT, 
            type TEXT
            
             )''',
  );

  final mapData = BusinessProfile(
      name: '', description: '', type: BusinessType.mahniSiamZuar);

  await db.insert(
    BusinessProfileConfig.dbName,
    mapData.toMap(),
  );
}
