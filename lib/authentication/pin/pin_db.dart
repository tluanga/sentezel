import 'package:sentezel/settings/pin/pin_config.dart';

import 'package:sqflite/sqflite.dart';

void injectPin(Database db) async {
  await db.execute(
    '''
      CREATE TABLE 
        ${PinConfig.dbName}(
            id INTEGER PRIMARY KEY AUTOINCREMENT,            
            pin INT,
            passPhrase STRING,                     
             )''',
  );
}
