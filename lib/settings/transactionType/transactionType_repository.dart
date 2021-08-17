import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/baseClasses/base_repository.dart';
import 'package:sentezel/common/database/db_service.dart';
import 'package:sentezel/newTransaction/common/transaction_config.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_model.dart';
import 'package:sqflite_common/sqlite_api.dart';

final transactionTypeRepositoryProvider =
    Provider((ref) => TransactionTypeRepository(ref.read));

class TransactionTypeRepository implements BaseRepository<TransactionType> {
  final String dbName = TransactionConfig.dbName;
  final Reader _read;

  const TransactionTypeRepository(this._read);

  @override
  void add({required payload}) {
    // TODO: implement add
  }

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

  //  Future<Note> readNote(int id) async {
  //   final db = await instance.database;

  //   final maps = await db.query(
  //     tableNotes,
  //     columns: NoteFields.values,
  //     where: '${NoteFields.id} = ?',
  //     whereArgs: [id],
  //   );

  //   if (maps.isNotEmpty) {
  //     return Note.fromJson(maps.first);
  //   } else {
  //     throw Exception('ID $id not found');
  //   }
  // }

  @override
  Future<List<TransactionType>> getList(
      {String searchString = '', DateTime? startDate, DateTime? endDate}) {
    // TODO: implement getList
    throw UnimplementedError();
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
