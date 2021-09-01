import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/enums/sumChetvelDanType_enum.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_model.dart';
import 'package:sentezel/settings/transactionType/transactionType_repository.dart';

final transactionTypeOfReceiptControllerProvider = StateNotifierProvider<
        TransactionTypeSelectController, AsyncValue<List<TransactionType>>>(
    (ref) => TransactionTypeSelectController(ref.read)..init());

class TransactionTypeSelectController
    extends StateNotifier<AsyncValue<List<TransactionType>>> {
  final Reader _read;
  TransactionTypeSelectController(this._read) : super(AsyncValue.loading());
  init() async {
    final data = await _read(transactionTypeRepositoryProvider)
        .getTransactionTypeListBySumChetvelDanType(SumChetvelDanType.lakluh);
    state = AsyncValue.data(data);
  }

  loadData({String searchString = ''}) async {
    print('Loading Receipt Type List');
    try {
      final result = await _read(transactionTypeRepositoryProvider).getList(
        searchString: searchString,
        type: SumChetvelDanType.lakluh,
      );
      if (mounted) state = AsyncValue.data(result);
    } on Exception catch (e) {
      return e;
    }
  }

  search({String searchParam = ''}) async {
    final data = state.data!.value;
    print(data);
    List<TransactionType> filteredData = state.data!.value
        .where((element) => element.name.contains(searchParam))
        .toList();
    state = AsyncValue.data(filteredData);
  }
}
