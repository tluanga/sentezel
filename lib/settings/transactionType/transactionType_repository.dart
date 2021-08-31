import 'package:enum_to_string/enum_to_string.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/baseClasses/base_repository.dart';
import 'package:sentezel/common/database/db_service.dart';
import 'package:sentezel/common/enums/sumChetvelDanType_enum.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_model.dart';
import 'package:sentezel/settings/transactionType/transactionType_config.dart';
import 'package:sqflite_common/sqlite_api.dart';

final transactionTypeRepositoryProvider =
    Provider((ref) => TransactionTypeRepository(ref.read));

class TransactionTypeRepository implements BaseRepository<TransactionType> {
  final String dbName = TransactionTypeConfig.dbName;
  final Reader _read;

  const TransactionTypeRepository(this._read);

  @override
  void add({required payload}) {}

  @override
  Future<TransactionType> getItem({required int id}) async {
    try {
      Database db = await DatabaseService.instance.db;

      final result = await db.query(dbName, where: 'id=?', whereArgs: [id]);
      if (result.isNotEmpty) {
        return TransactionType.fromMap(result.first);
      }
      throw Exception('Transaction Type Not Present');
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<String> getTransactionTypeName(int id) async {
    try {
      Database db = await DatabaseService.instance.db;

      final result = await db.query(dbName, where: 'id=?', whereArgs: [id]);
      return TransactionType.fromMap(result.first).name;
    } catch (e) {
      print(e);
      return 'Error';
    }
  }

  Future<List<TransactionType>> getTransactionTypeListBySumChetvelDanType(
      SumChetvelDanType type) async {
    final _type = EnumToString.convertToString(type);
    try {
      Database db = await DatabaseService.instance.db;

      final result = await db
          .query(dbName, where: 'sumChetVelDanType=?', whereArgs: [_type]);

      return result.map((e) => TransactionType.fromMap(e)).toList();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  //-------Get All item--
  @override
  Future<List<TransactionType>> getList({
    String searchString = '',
    SumChetvelDanType? type,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      String _type = EnumToString.convertToString(type);
      Database db = await DatabaseService.instance.db;

      final result = await db.rawQuery('''
      Select * from $dbName
      WHERE name LIKE '$searchString%'
      AND sumChetvelDanType Like '$_type'
      ''');
      List<TransactionType> list = [];
      result.forEach((item) {
        list.add(TransactionType.fromMap(item));
        print('name');
        print(item['name']);
      });

      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  void remove({required id}) {
    // TODO: implement remove
  }

  @override
  void update({required payload}) {
    // TODO: implement update
  }
}
