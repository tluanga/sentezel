import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/common/enums/transaction_type_enum.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';

final newTransactionCategoryControllerProvider = StateNotifierProvider<
    NewTransactionCategoryController,
    TransactionCategory>((ref) => NewTransactionCategoryController(ref.read));

class NewTransactionCategoryController
    extends StateNotifier<TransactionCategory> {
  final Reader _read;
  NewTransactionCategoryController(this._read)
      : super(
          TransactionCategory(
              name: '', description: '', transactionType: TransactionType.lei),
        );

  setState(TransactionCategory transactionCategory) {
    state = transactionCategory;
  }

  set name(String value) {
    state = state.copyWith(name: value);
  }

  set description(String value) {
    state = state.copyWith(description: value);
  }

  set debitSideLedger(int ledgerMasterId) {
    state = state.copyWith(debitSideLedger: ledgerMasterId);
  }

  set creditSideLedger(int ledgerMasterId) {
    state = state.copyWith(creditSideLedger: ledgerMasterId);
  }

  set transactionType(TransactionType type) {
    state = state.copyWith(transactionType: type);
  }

  save() {
    _read(transactionCategoryRepositoryProvider).add(payload: state);
  }
}
