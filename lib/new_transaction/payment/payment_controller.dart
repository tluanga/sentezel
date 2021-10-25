import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/new_transaction/common/helper/get_transaction_mode_ledger_helper.dart';
import 'package:sentezel/new_transaction/data/transaction_model.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/new_transaction/payment/model/payment_model.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';

final paymentControllerProvider =
    StateNotifierProvider<PaymentController, AsyncValue<Payment>>(
        (ref) => PaymentController(ref.read)..loadData());

class PaymentController extends StateNotifier<AsyncValue<Payment>> {
  final Reader _read;

  PaymentController(this._read) : super(const AsyncValue.loading());

  loadData() async {
    state = AsyncData(Payment(
      errorMessages: [],
      date: DateTime.now(),
    ));
  }

  //--------------SET STATE-------------
  setState(payload) {
    Payment _newState = payload;
    state = AsyncData(_newState);
  }

  validate() {
    final stateData = state.data!.value;

    //---------Validation Part-----------
    List<String> _errorMessage = [];

    if (stateData.amount <= 0) {
      _errorMessage.add('Amount can not be less than equalto Zero');
    }
    state = AsyncData(stateData.copyWith(errorMessages: _errorMessage));
  }

  setup() async {
    final _debitSideLedger = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: state.data!.value.category!.debitSideLedger!);
    //---------------Updating the state-------
    final stateData = state.data!.value;
    final finalData = stateData.copyWith(
      creditAmount: (stateData.amount - stateData.partialPaymentAmount),
      debitAmount: stateData.amount,
      creditSideLedger: await getTransactionModeLedgerHelper(
        stateData.mode!,
        _read,
      ),
      debitSideLedger: _debitSideLedger,
    );
    state = AsyncData(finalData);
  }

  reset() async {
    state = const AsyncLoading();
  }

  submit() async {
    final stateData = state.data!.value;
    try {
      _read(transactionRepositoryProvider).add(
        payload: Transaction(
          debitAmount: stateData.debitAmount,
          creditAmount: stateData.creditAmount,
          partialPaymentAmount: stateData.partialPaymentAmount,
          particular: stateData.particular!,
          mode: stateData.mode!,
          date: stateData.date,
          transactionCategoryId: stateData.category!.id!,
          debitSideLedger: stateData.debitSideLedger!.id,
          creditSideLedger: stateData.creditSideLedger != null
              ? stateData.creditSideLedger!.id
              : null,
        ),
      );
    } catch (e) {
      throw (e.toString());
    }
  }
}
