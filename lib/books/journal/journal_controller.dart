import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/journal/journal_model.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';

import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_model.dart';
import 'package:sentezel/settings/transactionType/transactionType_repository.dart';

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
        TransactionType transactionType =
            await _read(transactionTypeRepositoryProvider)
                .getItem(id: element.transactionTypeId);
        String _creditSideLedgerName;
        if (element.mode != TransactionMode.credit) {
          _creditSideLedgerName =  await _read(ledgerMasterRepositoryProvider)
                  .getLedgerMasterName(element.creditSideLedgerId!)
              : '';
        }
        String _transactionType = await _read(transactionTypeRepositoryProvider)
            .getTransactionTypeName(element.id!);

        String _debitSideLedgerName = element.debitSideLedgerId != null
            ? await _read(ledgerMasterRepositoryProvider)
                .getLedgerMasterName(element.debitSideLedgerId!)
            : '';
        String _partyLedgerName = element.partyId != null
            ? await _read(ledgerMasterRepositoryProvider)
                .getLedgerMasterName(element.partyId!)
            : '';
        String _assetLedgerName = element.assetLedgerId != null
            ? await _read(ledgerMasterRepositoryProvider)
                .getLedgerMasterName(element.assetLedgerId!)
            : '';

        Journal journal = new Journal(
          date: element.date,
          amount: element.amount,
          particular: element.particular,
          transactionType: _transactionType,
          creditSideLedgerName: _creditSideLedgerName,
          debitSideLedgerName: _debitSideLedgerName,
          partyLedgerName: _partyLedgerName,
          assetLedgerName: _assetLedgerName,
          mode: convertTransactionModeToString(element.mode),
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
    state = AsyncLoading();
  }
}
