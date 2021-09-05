import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/enums/sumChetvelDanType_enum.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterId_index.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_index.dart';

import 'debtRepayment_model.dart';

final debtRepaymentControllerProvider =
    StateNotifierProvider<DebtRepaymentController, DebtRepayment>(
        (ref) => DebtRepaymentController(ref.read)..init());

class DebtRepaymentController extends StateNotifier<DebtRepayment> {
  final Reader _read;

  DebtRepaymentController(this._read)
      : super(
          DebtRepayment(
            amount: 0,
            particular: '',
            date: DateTime.now(),
            mode: TransactionMode.paymentByCash,
          ),
        );
  init() async {
    final _paymentSide = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: LedgerMasterIndex.Cash);
    state = state.copyWith(creditSideLedger: _paymentSide);
  }

  setMode(TransactionMode mode) async {
    int _paymentSideid;
    mode == TransactionMode.paymentByCash
        ? _paymentSideid = LedgerMasterIndex.Cash
        : _paymentSideid = LedgerMasterIndex.Bank;
    final _paymentSide =
        await _read(ledgerMasterRepositoryProvider).getItem(id: _paymentSideid);
    state = state.copyWith(
      creditSideLedger: _paymentSide,
      mode: mode,
    );
  }

  submit() async {
    try {
      // _read(transactionRepositoryProvider).add(payload: Transaction());
    } catch (e) {
      print(e);
    }
  }
}
