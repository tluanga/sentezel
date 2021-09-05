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

  init() async {
    final debitSide = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: LedgerMasterIndex.Cash);
    state = state.copyWith(debitSideLedger: debitSide);
  }

  setReceiptTransactionCategory(TransactionCategory type) async {
    final creditSideLedger = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: type.creditSideLedger);
    state = state.copyWith(
      receiptTransactionCategory: type,
      creditSideLedger: creditSideLedger,
    );
  }

  setMode(TransactionMode mode) async {
    int _debitSideid;
    mode == TransactionMode.paymentByCash
        ? _debitSideid = LedgerMasterIndex.Cash
        : _debitSideid = LedgerMasterIndex.Bank;
    final _debitSide =
        await _read(ledgerMasterRepositoryProvider).getItem(id: _debitSideid);
    state = state.copyWith(
      debitSideLedger: _debitSide,
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
        transactionType: TransactionType.lakluh,
        transactionCategoryId: state.receiptTransactionCategory!.id,
        debitSideLedgerId: state.debitSideLedger!.id,
        creditSideLedgerId: state.creditSideLedger!.id,
      ));
    } catch (e) {
      print(e);
    }
  }
}
