// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';
// import 'package:sentezel/settings/ledger_master/data/ledger_master_type_enum.dart';

// import 'ledger_master_repository.dart';

// final newLedgerMasterControllerProvider =
//     StateNotifierProvider<NewLedgerMasterController, LedgerMaster>(
//         (ref) => NewLedgerMasterController(ref.read));

// class NewLedgerMasterController extends StateNotifier<LedgerMaster> {
//   final Reader _read;

//   NewLedgerMasterController(this._read)
//       : super(LedgerMaster(
//             name: '', description: '', type: LedgerMasterType.direct));

//   //--------------SET STATE-------------
//   setState(payload) {
//     LedgerMaster _newState = payload;
//     state = _newState;
//   }

//   validate() {
//     List<String> _errorMessage = [];
//     if (state.name.isEmpty) {
//       _errorMessage.add('Khawngaihin Ledger hming pe rawh');
//     }
//     if (state.description.isEmpty) {
//       _errorMessage.add('Khawngaihin description dah rawh');
//     }

//     return _errorMessage;
//   }

//   addLedgerMaster() async {
//     try {
//       _read(ledgerMasterRepositoryProvider).add(
//           payload: LedgerMaster(
//               name: state.name,
//               description: state.description,
//               type: state.type));
//     } on Exception catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   updateLedgerMaster({required int id}) async {
//     try {
//       _read(ledgerMasterRepositoryProvider).update(
//           payload: LedgerMaster.withId(
//               id: id,
//               name: state.name,
//               description: state.description,
//               type: state.type,
//               status: state.status));
//     } on Exception catch (e) {
//       throw Exception(e.toString());
//     }
//   }
// }
