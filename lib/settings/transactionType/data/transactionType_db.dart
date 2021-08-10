import 'package:sqflite_common/sqlite_api.dart';

import '../transactionType_config.dart';

void injectTransactionType(Database db) async {
  await db.execute('''
    CREATE TABLE
      ${TransactionTypeConfig.transactionTypeTable},
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       name TEXT,      
       description TEXT,
       sumChetvelDanType TEXT,
       debitSideLedger INT,
       creditSideLedger INT,
       status TEXT
  ''');
}
