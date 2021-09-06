import 'package:enum_to_string/enum_to_string.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/journal/journal_model.dart';

import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';
import 'package:sentezel/settings/transactionCategory/transactionCategory_repository.dart';

final journalControllerProvider =
    StateNotifierProvider<JournalController, AsyncValue<List<Journal>>>(
        (ref) => JournalController(ref.read)..loadData());

class JournalController extends StateNotifier<AsyncValue<List<Journal>>> {
  Reader _read;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  //-----------Get Transcation List-----
  JournalController(this._read) : super(AsyncValue.loading());

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

        Journal journal = new Journal(
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

      print(state);
    } catch (e) {
      print(e);
    }
  }

  clear() {
    // state = AsyncLoading();
  }
}
