import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/newTransaction/common/helper/get_transaction_mode_ledger_helper.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/newTransaction/sales/sales_return/model/sales_return_model.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';

import 'package:sentezel/settings/transactionCategory/data/transaction_category_index.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';

final saleReturnControllerProvider =
    StateNotifierProvider<SalesReturnController, AsyncValue<SalesReturn>>(
        (ref) => SalesReturnController(ref.read)..loadData());

class SalesReturnController extends StateNotifier<AsyncValue<SalesReturn>> {
  final Reader _read;

  SalesReturnController(this._read) : super(AsyncValue.loading());

  loadData() async {
    TransactionCategory _category =
        await _read(transactionCategoryRepositoryProvider)
            .getItem(id: TransactionCategoryIndex.SalesReturn);
    final _debitSideLedger = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: _category.debitSideLedger!);

    state = AsyncData(SalesReturn(
      category: _category,
      errorMessages: [],
      date: DateTime.now(),
      debitSideLedger: _debitSideLedger,
      particular: _category.name,
    ));
    print(state);
  }

  //--------------SET STATE-------------
  setState(payload) {
    SalesReturn _newState = payload;
    state = AsyncData(_newState);
  }

  validate() {
    final stateData = state.data!.value;

    //---------Validation Part-----------
    List<String> _errorMessage = [];

    if (stateData.amount <= 0) {
      _errorMessage.add('Amount can not be less than equalto Zero');
    }

    print('length of error message ${_errorMessage}');
    state = AsyncData(stateData.copyWith(errorMessages: _errorMessage));
  }

  setup() async {
    //---------------Updating the state-------
    final stateData = state.data!.value;
    final finalData = stateData.copyWith(
      creditAmount: (stateData.amount - stateData.partialPaymentAmount),
      debitAmount: stateData.amount,
      creditSideLedger: await getTransactionModeLedgerHelper(
        stateData.mode!,
        _read,
      ),
    );
    state = AsyncData(finalData);
  }

  reset() async {
    state = AsyncLoading();
  }

  submit() async {
    final stateData = state.data!.value;
    try {
      _read(transactionRepositoryProvider).add(
        payload: Transaction(
          debitAmount: stateData.debitAmount,
          creditAmount: stateData.creditAmount,
          partialPaymentAmount: stateData.partialPaymentAmount,
          particular: stateData.particular!,
          mode: stateData.mode!,
          date: stateData.date,
          transactionCategoryId: stateData.category!.id!,
          debitSideLedger: stateData.debitSideLedger!.id,
          creditSideLedger: stateData.creditSideLedger != null
              ? stateData.creditSideLedger!.id
              : null,
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
