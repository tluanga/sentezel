import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';

final ledgerReportRepository =
    Provider<LedgerReportRepository>((ref) => LedgerReportRepository(ref.read));

class LedgerReportRepository {
  Reader _read;
  LedgerReportRepository(this._read);

  getList({required DateTime startDate, required DateTime endDate}) async {
    // ---Get all LedgerMaster-----------
    List<LedgerMaster> _ledgerMasterList =
        await _read(ledgerMasterRepositoryProvider).getList();

    // ----Get Transaction of that ledger Master
    // _ledgerMasterList
    // ----Create the LedgerReport List
  }
}
