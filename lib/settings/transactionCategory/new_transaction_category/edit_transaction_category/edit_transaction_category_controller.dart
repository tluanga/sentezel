import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/common/enums/transaction_type_enum.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';

import 'edit_transaction_category_state.dart';

final editTransactionCategoryControllerProvider = StateNotifierProvider<
        EditTransactionCategoryController,
        AsyncValue<EditTransactionCategoryState>>(
    (ref) => EditTransactionCategoryController(ref.read));

class EditTransactionCategoryController
    extends StateNotifier<AsyncValue<EditTransactionCategoryState>> {
  final Reader _read;
  String ledgerName = '';
  EditTransactionCategoryController(this._read) : super(const AsyncLoading());

  loadData(TransactionCategory transactionCategory) async {
    if (transactionCategory.creditSideLedger != 0 &&
        transactionCategory.debitSideLedger != 0) {
      state = AsyncData(
        EditTransactionCategoryState(
          id: transactionCategory.id!,
          name: transactionCategory.name,
          description: transactionCategory.description,
          status: transactionCategory.status,
          transactionType: transactionCategory.transactionType,
          ledger: await setLedger(transactionCategory),
        ),
      );
    } else {
      state = AsyncData(
        EditTransactionCategoryState(
            id: transactionCategory.id!,
            name: transactionCategory.name,
            description: transactionCategory.description,
            status: transactionCategory.status,
            transactionType: transactionCategory.transactionType,
            ledger: LedgerMaster(
              name: '',
              description: '',
              type: LedgerMasterType.asset,
            )),
      );
    }
  }

  setState(EditTransactionCategoryState editTransactionCategoryState) {
    state = AsyncData(editTransactionCategoryState);
  }

  Future<LedgerMaster> setLedger(
      TransactionCategory transactionCategory) async {
    if (transactionCategory.transactionType == TransactionType.lei ||
        transactionCategory.transactionType == TransactionType.pekchhuah) {
      final result = await _read(ledgerMasterRepositoryProvider)
          .getItem(id: transactionCategory.debitSideLedger!);
      return result!;
      // state = AsyncData(state.data!.value.copyWith(ledger: result));

    }
    if (transactionCategory.transactionType == TransactionType.lakluh ||
        transactionCategory.transactionType == TransactionType.hralh) {
      final result = await _read(ledgerMasterRepositoryProvider)
          .getItem(id: transactionCategory.creditSideLedger!);

      return result!;
    }
    final result = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: transactionCategory.creditSideLedger!);

    return result!;
  }

  reset() {
    state = const AsyncLoading();
  }

  save() {
    // if (state.transactionType == TransactionType.lei) {
    //   state = state.copyWith(
    //     debitSideLedger: ledgerMasterId,
    //     creditSideLedger: LedgerMasterIndex.cash,
    //   );
    //   setledgerName();
    //   return;
    // }
    // if (state.transactionType == TransactionType.lakluh) {
    //   state = state.copyWith(
    //     debitSideLedger: LedgerMasterIndex.cash,
    //     creditSideLedger: ledgerMasterId,
    //   );
    //   setledgerName();
    //   return;
    // }
    // if (state.transactionType == TransactionType.hralh) {
    //   state = state.copyWith(
    //     debitSideLedger: LedgerMasterIndex.cash,
    //     creditSideLedger: ledgerMasterId,
    //   );
    //   setledgerName();
    //   return;
    // }
    // if (state.transactionType == TransactionType.pekchhuah) {
    //   state = state.copyWith(
    //     debitSideLedger: ledgerMasterId,
    //     creditSideLedger: LedgerMasterIndex.cash,
    //   );
    //   setledgerName();
    //   return;
    // }
    // _read(transactionCategoryRepositoryProvider).add(payload: state);
  }
}
