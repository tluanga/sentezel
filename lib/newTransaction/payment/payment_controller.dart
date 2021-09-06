import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/payment/payment_model.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterId_index.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';

final paymentControllerProvider =
    StateNotifierProvider<PaymentController, Payment>(
        (ref) => PaymentController(ref.read)..init());

class PaymentController extends StateNotifier<Payment> {
  final Reader _read;

  PaymentController(this._read)
      : super(
          Payment(
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

  setPaymentTransactionCategory(TransactionCategory type) async {
    final debitSideLedger = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: type.debitSideLedger);
    state = state.copyWith(
      receiptTransactionCategory: type,
      debitSideLedger: debitSideLedger,
      particular: debitSideLedger!.name,
    );
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
      // _read(transactionRepositoryProvider).add(
      //     payload: Transaction(
      //   amount: state.amount,
      //   particular: state.particular,
      //   date: state.date,
      //   mode: state.mode,
      //   transactionType: TransactionType.lakluh,
      //   transactionCategoryId: state.paymentTransactionCategory!.id,
      //   debitSideLedgerId: state.debitSideLedger!.id,
      //   creditSideLedgerId: state.creditSideLedger!.id,
      // ));
    } catch (e) {
      print(e);
    }
  }
}
