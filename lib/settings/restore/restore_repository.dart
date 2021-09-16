import 'package:sentezel/common/database/db_service.dart';
import 'package:sentezel/new_transaction/common/transaction_config.dart';
import 'package:sentezel/new_transaction/data/transaction_model.dart' as trans;
import 'package:sentezel/settings/business_profile/business_profile_model.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_config.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_config.dart';

import 'package:sqflite/sqflite.dart';

class RestoreRepository {}

class BackupRestoreService {
  Future<int> restoreDatabase({
    required user,
    required List<LedgerMaster> ledgerMasterList,
    required List<TransactionCategory> transactionCategoryList,
    required List<trans.Transaction> transactionList,
    required BusinessProfile businessProfile,
  }) async {
    Database db = await DatabaseService.instance.db;

    //---Clear the database
    db.delete(TransactionCategoryConfig.dbName);
    db.delete(LedgerMasterConfig.dbName);
    db.delete(TransactionConfig.dbName);

    //--Restore database-

    // try {
    //   db.insert(DatabaseService.userTable, user);
    // } catch (e) {
    //   print(e);
    // }

    //LedgerMaster data restore
    ledgerMasterList.forEach(
      (element) {
        try {
          db.insert(LedgerMasterConfig.dbName, element.toMap());
        } catch (e) {
          print(e);
        }
      },
    );
    //Transaction category data restore
    for (var element in transactionCategoryList) {
      try {
        db.insert(TransactionCategoryConfig.dbName, element.toJson());
      } catch (e) {
        print(e);
      }
    }
    //Shift data restore

    //Transaction category data restore
    for (var element in transactionList) {
      try {
        db.insert(TransactionConfig.dbName, element.toJson());
      } catch (e) {
        print(e);
      }
    }

    return 0;
  }
}
