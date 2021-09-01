import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/enums/sumChetvelDanType_enum.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/newTransaction/receipt/receipt_model.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterId_index.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_model.dart';

final receiptControllerProvider =
    StateNotifierProvider<ReceiptController, Receipt>(
        (ref) => ReceiptController(ref.read));

class ReceiptController extends StateNotifier<Receipt> {
  final Reader _read;

  ReceiptController(this._read)
      : super(
          Receipt(
            amount: 0,
            particular: '',
            date: DateTime.now(),
            mode: TransactionMode.paymentByCash,
          ),
        );

  setReceiptTransactionType(TransactionType type) async {
    final debitSideLedger = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: type.debitSideLedger);
    state = state.copyWith(
      receiptTransactionType: type,
      debitSideLedger: debitSideLedger,
    );
  }

  setMode(TransactionMode mode) async {
    int _creditSideid;
    mode == TransactionMode.paymentByCash
        ? _creditSideid = LedgerMasterIndex.Cash
        : _creditSideid = LedgerMasterIndex.Bank;
    final _creditSide =
        await _read(ledgerMasterRepositoryProvider).getItem(id: _creditSideid);
    state = state.copyWith(
      creditSideLedger: _creditSide,
      mode: mode,
    );
  }

  submit() async {
    try {
      _read(transactionRepositoryProvider).add(
          payload: Transaction(
        amount: state.amount,
        particular: state.particular,
        date: state.date,
        mode: state.mode,
        sumChetVelDanType: SumChetvelDanType.lakluh,
        transactionTypeId: state.receiptTransactionType!.id,
        debitSideLedgerId: state.debitSideLedger!.id,
        creditSideLedgerId: state.creditSideLedger!.id,
      ));
    } catch (e) {
      print(e);
    }
  }
}
