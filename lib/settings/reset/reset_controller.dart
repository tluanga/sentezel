import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';

class ResetController extends StateNotifier<int> {
  final Reader _read;
  ResetController(this._read) : super(0);

  reset() {
    //--------Reset Ledger Master----------

    //--------Reset Transaction Type-------------

    //--------Reset Transaction------------

    //--------Reset Setup-----------
  }
}
