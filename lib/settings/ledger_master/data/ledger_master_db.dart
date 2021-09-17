import 'package:sentezel/settings/ledger_master/data/ledger_master_data.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_config.dart';
import 'package:sqflite_common/sqlite_api.dart';

void injectLedgerMaster(Database db) async {
  //Create structure of Ledger MasterData
  await db.execute(
    '''
      CREATE TABLE 
        ${LedgerMasterConfig.dbName}(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            description TEXT,           
            type TEXT,
            status TEXT
             )''',
  );

  ledgerMasterData.asMap().forEach(
    (key, value) async {
      final mapData = LedgerMaster.withId(
        id: value.id,
        name: value.name,
        description: value.description,
        type: value.type,
        status: value.status,
      ).toMap();

      await db.insert(
        LedgerMasterConfig.dbName,
        mapData,
      );
    },
  );
}
