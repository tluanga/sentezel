import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';

class TransactionCategoryController
    extends StateNotifier<AsyncValue<List<TransactionCategory>>> {
  final Reader _read;

  TransactionCategoryController(this._read) : super(const AsyncLoading());

  loadData() async {
    final data = await _read(transactionCategoryRepositoryProvider).getList();
    if (data.isEmpty) {
      state = const AsyncData([]);
      return;
    }
    state = AsyncData(data);
  }

  newTransactionCategory(TransactionCategory payload) async {
    _read(transactionCategoryRepositoryProvider).add(payload: payload);
    loadData();
  }

  updateTransactionCategory(TransactionCategory payload) async {
    _read(transactionCategoryRepositoryProvider).update(payload: payload);
    loadData();
  }

  deleteTransactionCategory(int id) {
    _read(transactionCategoryRepositoryProvider).remove(id: id);
    loadData();
  }
}
