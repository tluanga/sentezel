import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/newTransaction/capitalInjection/model/capitalInjection_model.dart';
import 'package:sentezel/newTransaction/common/helper/getTransactionModeLedger_helper.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/newTransaction/payment/model/payment_model.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';
import 'package:sentezel/settings/transactionCategory/data/transactionCategory_index.dart';
import 'package:sentezel/settings/transactionCategory/transactionCategory_repository.dart';

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
    state = AsyncData(
      CapitalInjection(
        errorMessages: [],
        date: DateTime.now(),
        category: _category,
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
      creditSideLedger: await getTransactionModeLedgerHelper(
        stateData.mode!,
        _read,
      ),
      debitSideLedger: _debitSideLedger,
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
