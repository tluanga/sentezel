import 'package:sentezel/newTransaction/common/transaction_config.dart';
import 'package:sqflite_common/sqlite_api.dart';

class TransactionDb {
  static void execute(Database db) async {
    await db.execute(
      '''
      CREATE TABLE 
        ${TransactionConfig.dbName}(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            ${TransactionConfig.debitAmount} INT,
            ${TransactionConfig.creditAmount} INT,
            ${TransactionConfig.partialPaymentAmount} INT,
            ${TransactionConfig.particular} TEXT,
            ${TransactionConfig.mode} TEXT,
            ${TransactionConfig.date} INT,
            ${TransactionConfig.partyLedgerId} INT,
            ${TransactionConfig.assetLedgerId} INT,          
            ${TransactionConfig.transactionCategoryId} INT,
            ${TransactionConfig.debitSideLedger} INT,
            ${TransactionConfig.creditSideLedger} INT            
             )''',
    );
    print('Transaction table creation completed');
  }
}
