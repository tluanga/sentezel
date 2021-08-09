import 'package:sqflite_common/sqlite_api.dart';

void injectLedgerMasterData(Database db) async {
  const String ledgerMasterTypeTable = 'transactionType_table';
  print('Inject Transaction Type');
  await db.insert(transactionTypeTable, {
    'name': 'Purchase of Material',
    'description': 'Purchase of Material for Resell or for Production',
    'sumChetVelDanType': TransactionConstant.lei,
    'debitSideLedger': LedgerID.PURCHASEAC,
    'creditSideLedger': LedgerID.CASHAC,
    'active': TransactionTypeConstant.active,
  });
}
