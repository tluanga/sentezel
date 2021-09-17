import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sentezel/authentication/pin/pin_db.dart';
import 'package:sentezel/new_transaction/data/transaction_db.dart';
import 'package:sentezel/settings/business_profile/data/business_profile_db.dart';
import 'package:sentezel/settings/ledger_master/data/Ledger_master_db.dart';

import 'package:sentezel/settings/transactionCategory/data/transaction_category_db.dart';

import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._instance();
  static Database? _db;

  DatabaseService._instance();

  static void resetDatabase() {
    _db = null;
  }

  // ------TABLE -1- PROFILE TABLE------------
  static const String userTable = 'user_table';
  String userId = 'id';
  String userFullName = 'fullName';
  String userEmail = 'email';
  String userPin = 'pin';

  Future<Database> get db async {
    _db ??= await _initDb();

    return _db!;
  }

  Future<Database> _initDb() async {
    //-------Using application-Directory-----------
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + '/sentezel.db';

    final dbManager = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
    return dbManager;
  }

  void _createDb(Database db, int version) async {
    injectBusinessProfile(db);
    injectPin(db);
    injectLedgerMaster(db);
    injectTransactionCategory(db);

    TransactionDb.execute(db);
  }
}
