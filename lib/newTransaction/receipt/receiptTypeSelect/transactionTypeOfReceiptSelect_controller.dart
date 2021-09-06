import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/enums/sumChetvelDanType_enum.dart';
import 'package:sentezel/settings/transactionCategory/data/transactionCategory_model.dart';
import 'package:sentezel/settings/transactionCategory/transactionCategory_repository.dart';

final transactionTypeOfReceiptControllerProvider = StateNotifierProvider<
        TransactionCategorySelectController,
        AsyncValue<List<TransactionCategory>>>(
    (ref) => TransactionCategorySelectController(ref.read)..init());

class TransactionCategorySelectController
    extends StateNotifier<AsyncValue<List<TransactionCategory>>> {
  final Reader _read;
  TransactionCategorySelectController(this._read) : super(AsyncValue.loading());
  init() async {
    final data = await _read(transactionCategoryRepositoryProvider)
        .getTransactionCategoryListByTransactionType(TransactionType.lakluh);
    state = AsyncValue.data(data);
  }

  loadData({String searchString = ''}) async {
    print('Loading Receipt Type List');
    try {
      final result = await _read(transactionCategoryRepositoryProvider).getList(
        searchString: searchString,
        type: TransactionType.lakluh,
      );
      if (mounted) state = AsyncValue.data(result);
    } on Exception catch (e) {
      return e;
    }
  }

  search({String searchParam = ''}) async {
    final data = state.data!.value;
    print(data);
    List<TransactionCategory> filteredData = state.data!.value
        .where((element) => element.name.contains(searchParam))
        .toList();
    state = AsyncValue.data(filteredData);
  }
}
