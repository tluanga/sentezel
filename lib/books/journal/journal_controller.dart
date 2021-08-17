import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/journal/journal_model.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';

import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';
import 'package:sentezel/settings/transactionType/transactionType_repository.dart';

final journalControllerProvider =
    StateNotifierProvider<JournalController, AsyncValue<List<Journal>>>(
        (ref) => JournalController(ref.read)..loadData());

class JournalController extends StateNotifier<AsyncValue<List<Journal>>> {
  Reader _read;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String transactionTypeName = '';
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
        Journal journal = new Journal(
          date: element.date,
          amount: element.amount,
          particular: element.particular,
          transactionType: await _read(transactionTypeRepositoryProvider)
              .getTransactionTypeName(element.id!),
          creditSideLedgerName: element.creditSideLedgerId != null
              ? await _read(ledgerMasterRepositoryProvider)
                  .getLedgerMasterName(element.creditSideLedgerId!)
              : '',
          debitSideLedgerName: element.debitSideLedgerId != null
              ? await _read(ledgerMasterRepositoryProvider)
                  .getLedgerMasterName(element.debitSideLedgerId!)
              : '',
          partyLedgerName: element.partyId != null
              ? await _read(ledgerMasterRepositoryProvider)
                  .getLedgerMasterName(element.debitSideLedgerId!)
              : '',
          assetLedgerName: element.assetLedgerId != null
              ? await _read(ledgerMasterRepositoryProvider)
                  .getLedgerMasterName(element.assetLedgerId!)
              : '',
          mode: convertTransactionModeToString(element.mode),
        );
        result.add(journal);
      }

      data.length > 0 && result.length > 0
          ? state = AsyncValue.data(result)
          : state = AsyncValue.data([]);

      print(state);
    } catch (e) {
      print(e);
    }
  }
}
