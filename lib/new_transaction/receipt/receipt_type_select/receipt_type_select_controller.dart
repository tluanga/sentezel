import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/enums/transactionType_enum.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';

final receiptTypeSelectControllerProvider = StateNotifierProvider<
    ReceiptTypeSelectController, AsyncValue<List<TransactionCategory>>>(
  (ref) => ReceiptTypeSelectController(ref.read)..loadData(categoryName: ''),
);

class ReceiptTypeSelectController
    extends StateNotifier<AsyncValue<List<TransactionCategory>>> {
  final Reader _read;
  ReceiptTypeSelectController(this._read) : super(const AsyncValue.loading());
  loadData({String categoryName = ''}) async {
    try {
      final result = await _read(transactionCategoryRepositoryProvider).getList(
        searchString: categoryName,
        type: TransactionType.lakluh,
      );
      state = AsyncData(result);
    } catch (e) {
      throw(e.toString());
    }
  }
}
