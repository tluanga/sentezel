import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/common/enums/sumChetvelDanType_enum.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/newTransaction/payment/payment_model.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMasterId_index.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';
import 'package:sentezel/settings/transactionType/data/transactionType_model.dart';

final paymentControllerProvider =
    StateNotifierProvider<PaymentController, Payment>(
        (ref) => PaymentController(ref.read));

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

  setPaymentTransactionType(TransactionType type) async {
    final creditSideLedger = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: type.creditSideLedger);
    state = state.copyWith(
      receiptTransactionType: type,
      creditSideLedger: creditSideLedger,
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
      debitSideLedger: _paymentSide,
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
        transactionTypeId: state.paymentTransactionType!.id,
        debitSideLedgerId: state.debitSideLedger!.id,
        creditSideLedgerId: state.creditSideLedger!.id,
      ));
    } catch (e) {
      print(e);
    }
  }
}
