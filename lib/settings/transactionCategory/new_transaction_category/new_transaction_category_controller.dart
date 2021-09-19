import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/common/enums/transaction_type_enum.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_index.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';

final newTransactionCategoryControllerProvider = StateNotifierProvider<
    NewTransactionCategoryController,
    TransactionCategory>((ref) => NewTransactionCategoryController(ref.read));

class NewTransactionCategoryController
    extends StateNotifier<TransactionCategory> {
  final Reader _read;
  String ledgerName = 'Please Select Ledger';
  NewTransactionCategoryController(this._read)
      : super(
          TransactionCategory(
            name: '',
            description: '',
            transactionType: TransactionType.lei,
          ),
        );

  setState(TransactionCategory transactionCategory) {
    state = transactionCategory;
    setledgerName();
  }

  set name(String value) {
    state = state.copyWith(name: value);
  }

  set description(String value) {
    state = state.copyWith(description: value);
  }

  set ledger(ledgerMasterId) {
    if (state.transactionType == TransactionType.lei) {
      state = state.copyWith(
        debitSideLedger: ledgerMasterId,
        creditSideLedger: LedgerMasterIndex.cash,
      );
      setledgerName();
      return;
    }
    if (state.transactionType == TransactionType.lakluh) {
      state = state.copyWith(
        debitSideLedger: LedgerMasterIndex.cash,
        creditSideLedger: ledgerMasterId,
      );
      setledgerName();
      return;
    }
    if (state.transactionType == TransactionType.hralh) {
      state = state.copyWith(
        debitSideLedger: LedgerMasterIndex.cash,
        creditSideLedger: ledgerMasterId,
      );
      setledgerName();
      return;
    }
    if (state.transactionType == TransactionType.pekchhuah) {
      state = state.copyWith(
        debitSideLedger: ledgerMasterId,
        creditSideLedger: LedgerMasterIndex.cash,
      );
      setledgerName();
      return;
    }
  }

  String getLedgerName() {
    return ledgerName;
  }

  setledgerName() async {
    if (state.transactionType == TransactionType.lei ||
        state.transactionType == TransactionType.pekchhuah) {
      ledgerName = await _read(ledgerMasterRepositoryProvider)
          .getLedgerMasterName(state.debitSideLedger!);
      return;
    }
    if (state.transactionType == TransactionType.lakluh ||
        state.transactionType == TransactionType.hralh) {
      ledgerName = await _read(ledgerMasterRepositoryProvider)
          .getLedgerMasterName(state.creditSideLedger!);
      return;
    }
  }

  set transactionType(TransactionType type) {
    state = state.copyWith(transactionType: type);
  }

  save() {
    _read(transactionCategoryRepositoryProvider).add(payload: state);
  }
}
