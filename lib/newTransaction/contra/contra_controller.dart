import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:sentezel/newTransaction/contra/contraMode_enum.dart';
import 'package:sentezel/newTransaction/contra/model/contra_model.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_index.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';
import 'package:sentezel/settings/transactionCategory/data/transactionCategory_index.dart';
import 'package:sentezel/settings/transactionCategory/transactionCategory_repository.dart';

final contraControllerProvider =
    StateNotifierProvider<ContraController, AsyncValue<Contra>>(
        (ref) => ContraController(ref.read)..loadData());

class ContraController extends StateNotifier<AsyncValue<Contra>> {
  final Reader _read;

  ContraController(this._read) : super(AsyncValue.loading());

  loadData() async {
    state = AsyncData(Contra(
      errorMessages: [],
      date: DateTime.now(),
    ));
    print(state);
  }

  //--------------SET STATE-------------
  setState(payload) {
    Contra _newState = payload;
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
    final _cashToBankCategory =
        await _read(transactionCategoryRepositoryProvider)
            .getItem(id: TransactionCategoryIndex.CashToBank);
    final _bankToCashCategory =
        await _read(transactionCategoryRepositoryProvider)
            .getItem(id: TransactionCategoryIndex.BankToCash);

    final _cashAc = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: LedgerMasterIndex.Cash);
    final _bankAc = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: LedgerMasterIndex.Bank);

    //---------------Updating the state-------
    final stateData = state.data!.value;
    final finalData = stateData.copyWith(
      category: stateData.mode == ContraMode.bankToCash
          ? _bankToCashCategory
          : _cashToBankCategory,
      creditAmount: stateData.amount,
      debitAmount: stateData.amount,
      debitSideLedger:
          stateData.mode == ContraMode.bankToCash ? _cashAc : _bankAc,
      creditSideLedger:
          stateData.mode == ContraMode.cashToBank ? _bankAc : _cashAc,
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
          mode: TransactionMode.contra,
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
