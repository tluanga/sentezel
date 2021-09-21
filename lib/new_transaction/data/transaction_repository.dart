import 'package:enum_to_string/enum_to_string.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/baseClasses/base_repository.dart';
import 'package:sentezel/common/database/db_service.dart';
import 'package:sentezel/common/helpers/dateHelper/financial_year_helper.dart';
import 'package:sentezel/new_transaction/common/transaction_config.dart';
import 'package:sentezel/new_transaction/data/transaction_mode_enum.dart';
import 'package:sentezel/new_transaction/data/transaction_model.dart' as trans;

import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';
import 'package:sqflite_common/sqlite_api.dart';

final transactionRepositoryProvider = Provider<TransactionRepository>(
  (ref) => TransactionRepository(),
);

class TransactionRepository extends BaseRepository<trans.Transaction> {
  final String dbName = TransactionConfig.dbName;

  TransactionRepository();

  @override
  void add({required trans.Transaction payload}) async {
    Database db = await DatabaseService.instance.db;
    try {
      var b = await db.insert(dbName, payload.toJson());
      // final a = await getItem(id: b);
      await getItem(id: b);
    } catch (e) {
      e.toString();
    }
    // final userId = _read(authControllerProvider)!.uid;
  }

  @override
  getItem({required int id}) async {
    Database db = await DatabaseService.instance.db;
    try {
      final result = await db.query(dbName, where: 'id=?', whereArgs: [id]);
      if (result.isNotEmpty) {
        return trans.Transaction.fromJson(result.first);
      } else {
        throw ('Error');
      }
    } catch (e) {
      rethrow;
    }
  }

  getTransactionCategory({required int id}) async {
    Database db = await DatabaseService.instance.db;
    try {
      final result = await db.query(dbName, where: 'id=?', whereArgs: [id]);
      if (result.isNotEmpty) {
        return trans.Transaction.fromJson(result.first);
      } else {
        throw ('Error');
      }
    } catch (e) {
      rethrow;
    }
  }

  //-------Get All item--
  @override
  Future<List<trans.Transaction>> getList({
    String searchString = '',
    LedgerMasterType? type,
    TransactionMode? mode,
    int? ledgerMasterId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    print('get transaction list');
    //if no date is supplied it will return current date transactions
    startDate ??= getStartDateOfAccountingYear();
    endDate ??= DateTime.now();
    DateTime paramStartDate =
        DateTime(startDate.year, startDate.month, startDate.day);

    DateTime paramEndDate =
        DateTime(endDate.year, endDate.month, endDate.day, 23, 59);

    String _mode = mode != null ? EnumToString.convertToString(mode) : '';
    Database db = await DatabaseService.instance.db;
    try {
      final result = await db.rawQuery('''
      Select * from $dbName
      WHERE particular LIKE '$searchString%'
      AND mode LIKE '$_mode%'
      AND date>=${paramStartDate.microsecondsSinceEpoch}
      AND date<=${paramEndDate.microsecondsSinceEpoch}
      ''');

      List<trans.Transaction> list = [];
      // final result1 = await db.query(dbName);
      for (var item in result) {
        list.add(trans.Transaction.fromJson(item));
      }

      return list;
    } catch (e) {
      return [];
    }
  }

  //-------Get All item by a ledger--

  Future<List<trans.Transaction>> getTransactionByLedgerMaster({
    TransactionMode? mode,
    int? ledgerMasterId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    print(startDate);
    startDate ??= DateTime.now();
    endDate ??= DateTime.now();
    DateTime paramStartDate =
        DateTime(startDate.year, startDate.month, startDate.day);
    // print('StartDate $startDate');

    // print(
    //     'param startDate:$paramStartDate microseconds:${paramStartDate.microsecondsSinceEpoch}');

    DateTime paramEndDate =
        DateTime(endDate.year, endDate.month, endDate.day, 23, 59);
    // print(
    //     'param EndDate:$paramEndDate  microseconds:${paramEndDate.microsecondsSinceEpoch}');
    String _mode = mode != null ? EnumToString.convertToString(mode) : '';
    try {
      Database db = await DatabaseService.instance.db;
      final result = await db.rawQuery('''
      Select * from $dbName
      WHERE 
      mode LIKE '$_mode%'
      AND ${TransactionConfig.assetLedgerId}=$ledgerMasterId
      OR ${TransactionConfig.creditSideLedger}=$ledgerMasterId
      OR ${TransactionConfig.debitSideLedger}=$ledgerMasterId
      OR ${TransactionConfig.partyLedgerId}=$ledgerMasterId
      AND date>=${paramStartDate.microsecondsSinceEpoch}
      AND date <=${paramEndDate.microsecondsSinceEpoch}     
      ''');
      List<trans.Transaction> list = [];

      for (var item in result) {
        list.add(trans.Transaction.fromJson(item));
      }

      return list;
    } catch (e) {
      return [];
    }
  }

  @override
  void remove({required id}) async {
    Database db = await DatabaseService.instance.db;
    db.delete(
      dbName,
      where: 'id=?',
      whereArgs: [id],
    );
  }

  @override
  void update({required payload}) async {
    try {
      Database db = await DatabaseService.instance.db;
      await db.update(
        dbName,
        payload.toJson(),
        where: 'id=?',
        whereArgs: [payload.id],
      );
    } catch (e) {
      e.toString();
    }
  }

  Future<void> reset() async {
    try {
      Database db = await DatabaseService.instance.db;
      await db.delete(dbName);
    } catch (e) {
      e.toString();
    }
  }
}
