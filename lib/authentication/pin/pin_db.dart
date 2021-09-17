import 'package:sentezel/authentication/pin/pin_config.dart';
import 'package:sentezel/authentication/pin/pin_model.dart';
import 'package:sqflite/sqflite.dart';

void injectPin(Database db) async {
  await db.execute(
    '''
      CREATE TABLE 
        ${PinConfig.dbName}(
            id INTEGER PRIMARY KEY AUTOINCREMENT,            
            pin INT,
            passPhrase TEXT                     
             )''',
  );

  final mapData = PIN(pin: 0, passPhrase: '').toMap();

  await db.insert(
    PinConfig.dbName,
    mapData,
  );
}
