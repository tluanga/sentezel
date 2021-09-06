import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sentezel/newTransaction/data/transaction_db.dart';
import 'package:sentezel/settings/ledgerMaster/data/LedgerMaster_db.dart';
import 'package:sentezel/settings/party/data/party_db.dart';
import 'package:sentezel/settings/transactionCategory/data/transactionCategory_db.dart';

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

  //-------TABLE -2---BUSINESS PROFILE--
  static const String businessProfileTable = 'businessProfile_table';
  String businessProfileId = 'id';
  String businessName = 'name';
  String businessAddress = 'address';
  String businessContactNo = 'contactNo';
  String businessType = 'type';

  //-------TABLE -3---LEDGER MASTER TABLE--
  static const String ledgerMasterTable = 'ledgerMaster_table';
  String ledgerMasterId = 'id';
  String ledgerMasterName = 'name';
  String ledgerMasterDescription = 'description';
  String ledgerMasterType = 'type';
  String ledgerMasterStatus = 'status';

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }

    return _db!;
  }

  Future<Database> _initDb() async {
    print('Initializing database');

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
    // Table 1- PROFILE TABLE

    await db.execute(
      '''
      CREATE TABLE 
        $userTable(
            $userId INTEGER PRIMARY KEY AUTOINCREMENT,
            $userFullName TEXT,
            $userEmail TEXT,           
            $userPin INT
             )''',
    );
    // Table 2- BUSINESS PROFILE TABLE
    await db.execute(
      '''
      CREATE TABLE 
        $businessProfileTable(
            $businessProfileId INTEGER PRIMARY KEY AUTOINCREMENT,
            $businessName TEXT,
            $businessAddress TEXT,           
            $businessContactNo INT,
            $businessType String
             )''',
    );

    // Table 3- Ledger Master Table

    injectLedgerMaster(db);
    injectTransactionCategory(db);
    PartyDb.execute(db);
    TransactionDb.execute(db);

    print('completed');
  }
}
