import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/newTransaction/common/helper/get_transaction_mode_ledger_helper.dart';
import 'package:sentezel/newTransaction/creditSettlement/model/creditor_model.dart';
import 'package:sentezel/newTransaction/creditSettlement/settlement/credit_settlement_model.dart';
import 'package:sentezel/newTransaction/data/transaction_mode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';

import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';
import 'package:sentezel/settings/transactionCategory/data/transactionCategory_index.dart';
import 'package:sentezel/settings/transactionCategory/data/transactionCategory_model.dart';
import 'package:sentezel/settings/transactionCategory/transactionCategory_repository.dart';

final creditSettlementControllerProvider = StateNotifierProvider<
    DebtSettlementController,
    AsyncValue<CreditSettlement>>((ref) => DebtSettlementController(ref.read));

class DebtSettlementController
    extends StateNotifier<AsyncValue<CreditSettlement>> {
  final Reader _read;

  DebtSettlementController(this._read) : super(AsyncValue.loading());

  loadData({required Creditor creditor}) async {
    TransactionCategory _category =
        await _read(transactionCategoryRepositoryProvider)
            .getItem(id: TransactionCategoryIndex.CustomerDebtSettlement);
    final _creditSideLedger = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: creditor.party!.id);

    state = AsyncData(CreditSettlement(
      category: _category,
      errorMessages: [],
      date: DateTime.now(),
      creditSideLedger: _creditSideLedger,
      particular: _category.name + '-' + creditor.party!.name,
      creditor: creditor,
    ));
    print(state);
  }

  //--------------SET STATE-------------
  setState(payload) {
    CreditSettlement _newState = payload;
    state = AsyncData(_newState);
    print(state.data!.value);
  }

  validate() {
    final stateData = state.data!.value;

    //---------Validation Part-----------
    List<String> _errorMessage = [];

    if (stateData.amount <= 0) {
      _errorMessage.add('Amount can not be less than equalto Zero');
    }
    if (stateData.amount > state.data!.value.creditor!.amount) {
      _errorMessage.add('Amount can not larger than the debt amount');
    }

    if (stateData.mode == TransactionMode.credit &&
        stateData.partyLedger == null) {
      _errorMessage.add('Please Select Party');
    }

    print('length of error message ${_errorMessage}');
    state = AsyncData(stateData.copyWith(errorMessages: _errorMessage));
  }

  setup() async {
    //---------------Updating the state-------
    final stateData = state.data!.value;
    final finalData = stateData.copyWith(
      creditAmount: stateData.amount,
      debitAmount: stateData.amount,
      debitSideLedger: stateData.mode != TransactionMode.credit
          ? await getTransactionModeLedgerHelper(
              stateData.mode!,
              _read,
            )
          : null,
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
          debitSideLedger: stateData.debitSideLedger != null
              ? stateData.debitSideLedger!.id
              : null,
          creditSideLedger: stateData.creditSideLedger != null
              ? stateData.creditSideLedger!.id
              : null,
          partyLedgerId:
              stateData.partyLedger != null ? stateData.partyLedger!.id : null,
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
