import 'package:enum_to_string/enum_to_string.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/baseClasses/base_repository.dart';
import 'package:sentezel/common/database/db_service.dart';
import 'package:sentezel/common/enums/transaction_type_enum.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_config.dart';

import 'package:sqflite_common/sqlite_api.dart';

final transactionCategoryRepositoryProvider =
    Provider((ref) => const TransactionCategoryRepository());

class TransactionCategoryRepository
    implements BaseRepository<TransactionCategory> {
  final String dbName = TransactionCategoryConfig.dbName;

  const TransactionCategoryRepository();

  @override
  void add({required payload}) {}

  @override
  Future<TransactionCategory> getItem({required int id}) async {
    try {
      Database db = await DatabaseService.instance.db;

      final result = await db.query(dbName, where: 'id=?', whereArgs: [id]);
      if (result.isNotEmpty) {
        return TransactionCategory.fromJson(result.first);
      }
      throw Exception('Transaction Type Not Present');
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> getTransactionCategoryName(int id) async {
    try {
      Database db = await DatabaseService.instance.db;

      final result = await db.query(dbName, where: 'id=?', whereArgs: [id]);
      return TransactionCategory.fromJson(result.first).name;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<TransactionCategory>> getTransactionCategoryListByTransactionType(
      TransactionType type) async {
    final _type = EnumToString.convertToString(type);
    try {
      Database db = await DatabaseService.instance.db;

      final result = await db
          .query(dbName, where: 'transactionType=?', whereArgs: [_type]);

      return result.map((e) => TransactionCategory.fromJson(e)).toList();
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  //-------Get All item--
  @override
  Future<List<TransactionCategory>> getList({
    String searchString = '',
    TransactionType? type,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      String _type = type != null ? EnumToString.convertToString(type) : '';
      Database db = await DatabaseService.instance.db;

      final result = await db.rawQuery('''
      Select * from $dbName
      WHERE name LIKE '$searchString%'
      AND transactionType Like '$_type%'
      ''');
      List<TransactionCategory> list = [];
      for (var item in result) {
        list.add(TransactionCategory.fromJson(item));
      }

      return list;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void remove({required id}) {}

  @override
  void update({required payload}) {}
}
