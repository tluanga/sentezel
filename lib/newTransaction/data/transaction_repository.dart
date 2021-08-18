import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/baseClasses/base_repository.dart';
import 'package:sentezel/common/database/db_service.dart';
import 'package:sentezel/newTransaction/common/transaction_config.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart' as trans;
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterType_enum.dart';
import 'package:sqflite_common/sqlite_api.dart';

final transactionRepositoryProvider = Provider<TransactionRepository>(
  (ref) => TransactionRepository(ref.read),
);

class TransactionRepository extends BaseRepository<trans.Transaction> {
  final String dbName = TransactionConfig.dbName;
  final Reader _read;

  TransactionRepository(this._read);

  @override
  void add({required trans.Transaction payload}) async {
    Database db = await DatabaseService.instance.db;
    try {
      var b = await db.insert(dbName, payload.toMap());
      print('the value return is $b');
    } catch (e) {
      print(e);
    }
    // final userId = _read(authControllerProvider)!.uid;
  }

  @override
  getItem({required int id}) async {
    Database db = await DatabaseService.instance.db;
    try {
      final result = await db.query(dbName, where: 'id=?', whereArgs: [id]);
      if (result.length != 0) {
        return trans.Transaction.fromMap(result.first);
      } else
        throw ('Error');
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  //-------Get All item--
  @override
  Future<List<trans.Transaction>> getList({
    String searchString = '',
    LedgerMasterType? type,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    //if no date is supplied it will return current date transactions
    if (startDate == null) startDate = DateTime.now();
    if (endDate == null) endDate = DateTime.now();
    DateTime paramStartDate =
        DateTime(startDate.year, startDate.month, startDate.day);
    print('StartDate $startDate');

    print(
        'param startDate:$paramStartDate microseconds:${paramStartDate.microsecondsSinceEpoch}');

    DateTime paramEndDate =
        DateTime(endDate.year, endDate.month, endDate.day, 23, 59);
    print(
        'param EndDate:$paramEndDate  microseconds:${paramEndDate.microsecondsSinceEpoch}');

    try {
      Database db = await DatabaseService.instance.db;
      final result = await db.rawQuery('''
      Select * from $dbName
      WHERE particular LIKE '$searchString%'
      AND date>=${paramStartDate.microsecondsSinceEpoch}
      AND date <=${paramEndDate.microsecondsSinceEpoch}     
      ''');
      List<trans.Transaction> list = [];
      print('length of result is ${result.length}');
      result.forEach((item) {
        list.add(trans.Transaction.fromMap(item));
        print('name');
        print(item['name']);

        print(item['date']);
      });

      return list;
    } catch (e) {
      print(e);
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
        payload.toMap(),
        where: 'id=?',
        whereArgs: [payload.id],
      );
    } catch (e) {
      print(e);
    }
  }
}
