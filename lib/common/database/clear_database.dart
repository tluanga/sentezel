import 'package:sentezel/common/database/db_service.dart';
import 'package:sentezel/new_transaction/common/transaction_config.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_config.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_config.dart';
import 'package:sqflite/sqflite.dart';

clearDatabase() async {
  Database db = await DatabaseService.instance.db;
  //---Clear the database
  db.delete(TransactionCategoryConfig.dbName);
  db.delete(LedgerMasterConfig.dbName);
  db.delete(TransactionConfig.dbName);
}
