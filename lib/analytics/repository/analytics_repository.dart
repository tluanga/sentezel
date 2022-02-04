import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/common/database/db_service.dart';
import 'package:sentezel/common/helpers/dateHelper/financial_year_helper.dart';
import 'package:sentezel/new_transaction/common/transaction_config.dart';
import 'package:sentezel/new_transaction/data/transaction_mode_enum.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sentezel/new_transaction/data/transaction_model.dart' as trans;

final analyticRepositoryProvider =
    Provider<AnalyticsRepository>((ref) => AnalyticsRepository(ref.read));

class AnalyticsRepository {
  final Reader _read;
  final String dbName = TransactionConfig.dbName;

  AnalyticsRepository(this._read);

  //-------Get All item--
  @override
  Future<List<trans.Transaction>> getList({
    LedgerMasterType? type,
    TransactionMode? mode,
    int? ledgerMasterId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    //if no date is supplied it will return current date transactions
    startDate ??= getStartDateOfAccountingYear();
    endDate ??= DateTime.now();
    DateTime paramStartDate =
        DateTime(startDate.year, startDate.month, startDate.day);

    DateTime paramEndDate =
        DateTime(endDate.year, endDate.month, endDate.day, 23, 59);

    Database db = await DatabaseService.instance.db;
    try {
      final result = await db.rawQuery('''
      Select * from $dbName
      WHERE      
      date>${paramStartDate.microsecondsSinceEpoch}
      AND date<=${paramEndDate.microsecondsSinceEpoch}
      ORDER BY date

      ''');
      // print(result);
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
}
