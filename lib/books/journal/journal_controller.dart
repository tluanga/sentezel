import 'package:enum_to_string/enum_to_string.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/journal/journal_model.dart';

import 'package:sentezel/new_transaction/data/transaction_repository.dart';

import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';

final journalControllerProvider =
    StateNotifierProvider<JournalController, AsyncValue<List<Journal>>>(
        (ref) => JournalController(ref.read)..loadData());

class JournalController extends StateNotifier<AsyncValue<List<Journal>>> {
  final Reader _read;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  //-----------Get Transcation List-----
  JournalController(this._read) : super(const AsyncValue.loading());

  loadData() async {
    try {
      final data = await _read(transactionRepositoryProvider).getList(
        startDate: startDate,
        endDate: endDate,
      );

      List<Journal> result = [];

      for (int i = 0; i < data.length; i++) {
        final element = data[i];
        String _creditSideLedgerName = '';
        String _debitSideLedgerName = '';

        String _transactionType =
            await _read(transactionCategoryRepositoryProvider)
                .getTransactionCategoryName(element.transactionCategoryId);

        String _partyLedgerName = element.partyLedgerId != null
            ? await _read(ledgerMasterRepositoryProvider)
                .getLedgerMasterName(element.partyLedgerId!)
            : '';
        String _assetLedgerName = element.assetLedgerId != null
            ? await _read(ledgerMasterRepositoryProvider)
                .getLedgerMasterName(element.assetLedgerId!)
            : '';

        Journal journal = Journal(
          date: element.date,
          amount: element.debitAmount,
          particular: element.particular,
          transactionCategory: _transactionType,
          creditSideLedgerName: _creditSideLedgerName,
          debitSideLedgerName: _debitSideLedgerName,
          partyLedgerName: _partyLedgerName,
          assetLedgerName: _assetLedgerName,
          mode: EnumToString.convertToString(element.mode, camelCase: true),
        );
        result.add(journal);
      }
      state = AsyncValue.data(result);
    } catch (e) {}
  }

  clear() {
    // state = AsyncLoading();
  }
}
