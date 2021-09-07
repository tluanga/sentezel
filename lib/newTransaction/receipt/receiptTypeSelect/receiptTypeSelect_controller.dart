import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:sentezel/settings/transactionCategory/data/transactionCategory_model.dart';
import 'package:sentezel/settings/transactionCategory/transactionCategory_repository.dart';

final receiptTypeSelectControllerProvider = StateNotifierProvider<
    ReceiptTypeSelectController, AsyncValue<List<TransactionCategory>>>(
  (ref) => ReceiptTypeSelectController(ref.read)..loadData(ledgerName: ''),
);

class ReceiptTypeSelectController
    extends StateNotifier<AsyncValue<List<TransactionCategory>>> {
  Reader _read;

  ReceiptTypeSelectController(this._read) : super(AsyncValue.loading());

  loadData({String ledgerName = ''}) async {
    print('Load data');
    try {
      final ledgerMasterDataList =
          await _read(transactionCategoryRepositoryProvider)
              .getList(searchString: ledgerName);

      state = AsyncData(ledgerMasterDataList);
    } catch (e) {
      print(e.toString());
    }
  }
}
