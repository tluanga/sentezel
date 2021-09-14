import 'package:sentezel/newTransaction/common/transaction_config.dart';
import 'package:sqflite_common/sqlite_api.dart';

class TransactionDb {
  static void execute(Database db) async {
    await db.execute(
      '''
      CREATE TABLE 
        ${TransactionConfig.dbName}(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            debitAmount INT,
            creditAmount INT,
            partialPaymentAmount INT,
            particular TEXT,
            mode TEXT,
            date INT,
            partyId INT,
            assetLedgerId INT,
            transactionType TEXT,
            transactionCategoryId INT,
            debitSideLedgerId INT,
            creditSideLedgerId INT            
             )''',
    );
    print('Transaction table creation completed');
  }
}
