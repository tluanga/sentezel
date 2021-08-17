import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_data.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_config.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';
import 'package:sqflite_common/sqlite_api.dart';

void injectLedgerMaster(Database db) async {
  //Create structure of Ledger MasterData
  await db.execute(
    '''
      CREATE TABLE 
        ${LedgerMasterConfig.ledgerMasterTable}(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            description TEXT,           
            type TEXT,
            status TEXT
             )''',
  );
  print('Inject Transaction Type');
  ledgerMasterData.asMap().forEach(
    (key, value) async {
      print('status is ${value.status}');
      final mapData = LedgerMaster.withId(
        id: value.id,
        name: value.name,
        description: value.description,
        type: value.type,
        status: value.status,
      ).toMap();
      print('--The value of json is--');
      await db.insert(
        LedgerMasterConfig.ledgerMasterTable,
        mapData,
      );
    },
  );
  print('Injetion of ledgerMaster completed');
}
