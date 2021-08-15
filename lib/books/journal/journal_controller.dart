import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';

final journalControllerProvider =
    StateNotifierProvider<JournalController, List<Transaction>>(
        (ref) => JournalController(ref.read)..loadData());

class JournalController extends StateNotifier<List<Transaction>> {
  Reader _read;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  //-----------Get Transcation List-----
  JournalController(this._read) : super([]);

  loadData() async {
    try {
      state = await _read(transactionRepositoryProvider).getList(
        startDate: startDate,
        endDate: endDate,
      );
      print(state);
    } catch (e) {
      print(e);
    }
  }
}
