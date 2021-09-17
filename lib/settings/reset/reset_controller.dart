import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/authentication/pin/pin_repository.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/settings/business_profile/business_profile_repository.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';

final resetControllerProvider = StateNotifierProvider<ResetController, int>(
    (ref) => ResetController(ref.read));

class ResetController extends StateNotifier<int> {
  final Reader _read;
  ResetController(this._read) : super(0);

  reset() async {
    state = 1;
    //--------Reset Ledger Master----------
    await _read(ledgerMasterRepositoryProvider).reset();

    //--------Reset Transaction Type-------------
    await _read(transactionCategoryRepositoryProvider).reset();

    //--------Reset Transaction------------
    await _read(transactionRepositoryProvider).reset();

    //--------Reset Business Profile-----------
    await _read(businessProfileRepository).reset();

    //-------Reset PIN---------
    await _read(pinRepositoryProvider).reset();
    state = 2;
  }

  resetState() {
    state = 0;
  }
}
