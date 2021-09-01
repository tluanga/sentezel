import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/enums/sumChetvelDanType_enum.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_model.dart';
import 'package:sentezel/settings/transactionType/transactionType_repository.dart';

final transactionTypeOfPaymentSelectControllerProvider = StateNotifierProvider<
        TransactionTypeOfPaymentSelectController,
        AsyncValue<List<TransactionType>>>(
    (ref) => TransactionTypeOfPaymentSelectController(ref.read)..init());

class TransactionTypeOfPaymentSelectController
    extends StateNotifier<AsyncValue<List<TransactionType>>> {
  final Reader _read;
  TransactionTypeOfPaymentSelectController(this._read)
      : super(AsyncValue.loading());
  init() async {
    final data = await _read(transactionTypeRepositoryProvider)
        .getTransactionTypeListBySumChetvelDanType(SumChetvelDanType.pekchhuah);
    state = AsyncValue.data(data);
  }

  loadData({String searchString = ''}) async {
    print('Loading Payment Type List');
    try {
      final result = await _read(transactionTypeRepositoryProvider).getList(
        searchString: searchString,
        type: SumChetvelDanType.pekchhuah,
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
