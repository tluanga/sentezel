// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:sentezel/books/balanceSheet/balance_sheet_model.dart';
// import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';
// import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';

// class BalanceSheetController
//     extends StateNotifier<AsyncValue<List<BalanceSheet>>> {
//   Reader _read;
//   BalanceSheetController(this._read) : super(const AsyncValue.loading());

//   loadData() async {
//     try {
//       final _partyLedgerMasterList =
//           await _read(ledgerMasterRepositoryProvider).getList(type: LedgerMasterType.party);
//     } catch (e) {
//       throw (e.toString());
//     }
//   }
// }
