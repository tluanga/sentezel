import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/new_transaction/common/helper/get_transaction_mode_ledger_helper.dart';

import 'package:sentezel/new_transaction/creditSettlement/model/creditor_model.dart';
import 'package:sentezel/new_transaction/creditSettlement/settlement/credit_settlement_model.dart';
import 'package:sentezel/new_transaction/data/transaction_mode_enum.dart';
import 'package:sentezel/new_transaction/data/transaction_model.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';

import 'package:sentezel/settings/transactionCategory/data/transaction_category_index.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';

final creditSettlementControllerProvider = StateNotifierProvider<
    DebtSettlementController,
    AsyncValue<CreditSettlement>>((ref) => DebtSettlementController(ref.read));

class DebtSettlementController
    extends StateNotifier<AsyncValue<CreditSettlement>> {
  final Reader _read;

  DebtSettlementController(this._read) : super(const AsyncValue.loading());

  loadData({required Creditor creditor}) async {
    TransactionCategory _category =
        await _read(transactionCategoryRepositoryProvider)
            .getItem(id: TransactionCategoryIndex.businessDebtSettlement);
    final _debitSideLedger = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: creditor.party!.id);

    state = AsyncData(CreditSettlement(
      category: _category,
      errorMessages: [],
      date: DateTime.now(),
      debitSideLedger: _debitSideLedger,
      particular: _category.name + '-' + creditor.party!.name,
      creditor: creditor,
    ));
  }

  //--------------SET STATE-------------
  setState(payload) {
    CreditSettlement _newState = payload;
    state = AsyncData(_newState);
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
    state = AsyncData(stateData.copyWith(errorMessages: _errorMessage));
  }

//  credit side is bank/cash in credit settlement
  setup() async {
    //---------------Updating the state-------
    final stateData = state.data!.value;
    final finalData = stateData.copyWith(
      creditAmount: stateData.amount,
      debitAmount: stateData.amount,
      creditSideLedger: stateData.mode != TransactionMode.credit
          ? await getTransactionModeLedgerHelper(
              stateData.mode!,
              _read,
            )
          : null,
    );
    state = AsyncData(finalData);
  }

  reset() async {
    state = const AsyncLoading();
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
      e.toString();
    }
  }
}
