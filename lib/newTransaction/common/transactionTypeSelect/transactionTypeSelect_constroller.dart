import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/enums/sumChetvelDanType_enum.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_model.dart';
import 'package:sentezel/settings/transactionType/transactionType_repository.dart';

class TransactionTypeSelectController
    extends StateNotifier<AsyncValue<List<TransactionType>>> {
  final Reader _read;
  TransactionTypeSelectController(this._read) : super(AsyncValue.loading());
  init() async {
    final data = await _read(transactionTypeRepositoryProvider)
        .getTransactionTypeListBySumChetvelDanType(SumChetvelDanType.lakluh);
    state = AsyncValue.data(data);
  }

  search(String searchParam) async {
    final data = await _read(transactionTypeRepositoryProvider)
        .getTransactionTypeListBySumChetvelDanType(SumChetvelDanType.lakluh);
    List<TransactionType> filteredData =
        data.where((element) => element.name.contains(searchParam)).toList();
    state = AsyncValue.data(filteredData);
  }
}
