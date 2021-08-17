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
      if (data.isNotEmpty) {
        data.forEach((element) async {
          String transactionTypeName =
              await _read(transactionTypeRepositoryProvider)
                  .getTransactionTypeName(element.id!);
          String creditSideLedgerName =
              await _read(ledgerMasterRepositoryProvider)
                  .getLedgerMasterName(element.creditSideLedgerId!);
          String debitSideLedgerName =
              await _read(ledgerMasterRepositoryProvider)
                  .getLedgerMasterName(element.debitSideLedgerId!);
          String assetName = await _read(ledgerMasterRepositoryProvider)
              .getLedgerMasterName(element.debitSideLedgerId!);
          String partyName = await _read(ledgerMasterRepositoryProvider)
              .getLedgerMasterName(element.debitSideLedgerId!);
          String mode = convertTransactionModeToString(element.mode);
          result.add(Journal(
            date: element.date,
            amount: element.amount,
            particular: element.particular,
            transactionType: transactionTypeName,
            creditSideLedgerName: creditSideLedgerName,
            debitSideLedgerName: debitSideLedgerName,
            partyLedgerName: partyName,
            assetLedgerName: assetName,
            mode: mode,
          ));
        });
        state = AsyncValue.data(result);
      }

      print(state);
    } catch (e) {
      print(e);
    }
  }
}
