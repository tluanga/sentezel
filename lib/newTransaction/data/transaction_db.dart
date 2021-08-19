import 'package:sentezel/newTransaction/common/transaction_config.dart';
import 'package:sqflite_common/sqlite_api.dart';

class TransactionDb {
  static void execute(Database db) async {
    await db.execute(
      '''
      CREATE TABLE 
        ${TransactionConfig.dbName}(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            amount INT,
            particular TEXT,
            mode String,
            date INT,
            partyId INT,
            assetLedgerId INT,
            sumChetVelDanType String,
            transactionTypeId INT,
            debitSideLedgerId INT,
            creditSideLedgerId INT,
            creditPartialPaymentAmount INT
            
             )''',
    );
    print('Transaction table creation completed');
  }
}
