import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/new_transaction/capital_injection/model/capital_injection_model.dart';
import 'package:sentezel/new_transaction/common/helper/get_transaction_mode_ledger_helper.dart';
import 'package:sentezel/new_transaction/data/transaction_model.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';

import 'package:sentezel/settings/transactionCategory/data/transaction_category_index.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';

final capitalInjectionControllerProvider = StateNotifierProvider<
        CapitalInjectionController, AsyncValue<CapitalInjection>>(
    (ref) => CapitalInjectionController(ref.read)..loadData());

class CapitalInjectionController
    extends StateNotifier<AsyncValue<CapitalInjection>> {
  final Reader _read;

  CapitalInjectionController(this._read) : super(AsyncValue.loading());

  loadData() async {
    final _category = await _read(transactionCategoryRepositoryProvider)
        .getItem(id: TransactionCategoryIndex.CapitalInjection);
    final _creditSideLedger = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: _category.creditSideLedger!);
    state = AsyncData(
      CapitalInjection(
        errorMessages: [],
        date: DateTime.now(),
        category: _category,
        creditSideLedger: _creditSideLedger,
        particular: _category.name,
      ),
    );
    print(state);
  }

  //--------------SET STATE-------------
  setState(payload) {
    CapitalInjection _newState = payload;
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
    final _debitSideLedger = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: state.data!.value.category!.debitSideLedger!);

    //---------------Updating the state-------
    final stateData = state.data!.value;
    final finalData = stateData.copyWith(
      creditAmount: stateData.amount,
      debitAmount: stateData.amount,
      debitSideLedger: await getTransactionModeLedgerHelper(
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
          partialPaymentAmount: 0,
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
