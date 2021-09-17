import 'package:sentezel/settings/business_profile/business_profile_config.db.dart';

import 'package:sqflite/sqflite.dart';

void injectBusinessProfile(Database db) async {
  await db.execute(
    '''
      CREATE TABLE 
        ${BusinessProfileConfig.dbName}(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            address TEXT, 
            contactNo INT,          
            type TEXT,
            status TEXT
             )''',
  );
}
