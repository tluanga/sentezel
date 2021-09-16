import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/books/ledger/ledger_detail/ledger_detail_controller.dart';
import 'package:sentezel/common/helpers/dateHelper/financial_year_helper.dart';
import 'package:sentezel/settings/backup/backup_model.dart';
import 'package:sentezel/settings/backup/operation_status_enum.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';

class BackupController extends StateNotifier<Backup> {
  final Reader _read;
  BackupController(this._read)
      : super(
          Backup(operationstatus: OperationStatus.notStarted),
        );
  backup() {
    //-----------BACKUP OPERATION-----------
    //--clear- delete all files in the backup folder

    //----------BACKUP-Ledger Master----
    //--read
    final ledgerMasterList = _read(ledgerMasterRepositoryProvider).getList(
      startDate: getStartDateOfAccountingYear(),
    );
    //--write

    //----------BACKUP-Transaction Category----
    //--read
    //--write

    //----------BACKUP-Transaction----
    //--read
    //--write
  }
}
