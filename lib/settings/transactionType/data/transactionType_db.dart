import 'package:sentezel/settings/transactionType/data/transactionType_data.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_model.dart';
import 'package:sqflite_common/sqlite_api.dart';

import '../transactionType_config.dart';

void TransactionTypeDb(Database db) async {
  await db.execute('''
    CREATE TABLE
      ${TransactionTypeConfig.dbName},
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       name TEXT,      
       description TEXT,
       sumChetvelDanType TEXT,
       debitSideLedger INT,
       creditSideLedger INT,
       status TEXT
  ''');
  //--Injecting Data---
  transactionTypeData.asMap().forEach((key, value) async {
    final mapData = TransactionType.withId(
      id: value.id,
      name: value.name,
      description: value.description,
      sumChetVelDanType: value.sumChetVelDanType,
      debitSideLedger: value.debitSideLedger,
      creditSideLedger: value.creditSideLedger,
      status: value.status,
    ).toMap();
    print('--The value of json is--');
    await db.insert(
      TransactionTypeConfig.dbName,
      mapData,
    );
  });
}


//  transactionTypeData.asMap().forEach((key, value) async {
//     print('status is ${value.status}');
//     final mapData = TransactionType.withId(
//       id: value.id,
//       name: value.name,
//       description: value.description,
//       sumChetVelDanType: value.sumChetVelDanType,
//       debitSideLedger: value.debitSideLedger,
//       creditSideLedger: value.creditSideLedger,
//       status: value.status,
//     ).toMap();
//     print('--The value of json is--');
//     await db.insert(
//       TransactionTypeConfig.dbName,
//       mapData,
//     );
//   });