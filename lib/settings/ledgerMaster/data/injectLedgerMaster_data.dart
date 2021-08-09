import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_data.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_config.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_model.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:uuid/uuid.dart';

void injectLedgerMaster(Database db) async {
  //Create structure of Ledger MasterData
  await db.execute(
      '''
      CREATE TABLE 
        ${LedgerMasterConfig.ledgerMasterTable}(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            description TEXT,           
            type INT,
            status INT
             )''',
    );
  print('Inject Transaction Type');
  ledgerMasterData.asMap().forEach(
    (key, value) async {
      await db.insert(
          LedgerMasterConfig.ledgerMasterTable,
          LedgerMaster(
            id: Uuid().v4(),
            name: value.name,
            type: value.type,
            status: value.status,
          ).toJson(),);
    },
  );
  print('Injetion of ledgerMaster completed');
}
