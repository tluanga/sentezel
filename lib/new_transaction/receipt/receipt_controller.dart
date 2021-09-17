import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/new_transaction/common/helper/get_transaction_mode_ledger_helper.dart';
import 'package:sentezel/new_transaction/data/transaction_model.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/new_transaction/receipt/model/receipt_model.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';

final receiptControllerProvider =
    StateNotifierProvider<ReceiptController, AsyncValue<Receipt>>(
        (ref) => ReceiptController(ref.read)..loadData());

class ReceiptController extends StateNotifier<AsyncValue<Receipt>> {
  final Reader _read;

  ReceiptController(this._read) : super(const AsyncValue.loading());

  loadData() async {
    state = AsyncData(Receipt(
      errorMessages: [],
      date: DateTime.now(),
    ));
  }

  //--------------SET STATE-------------
  setState(payload) {
    Receipt _newState = payload;
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
    final _creditSideLedger = await _read(ledgerMasterRepositoryProvider)
        .getItem(id: state.data!.value.category!.creditSideLedger!);

    //---------------Updating the state-------
    final stateData = state.data!.value;
    final finalData = stateData.copyWith(
      creditAmount: (stateData.amount - stateData.partialPaymentAmount),
      debitAmount: stateData.amount,
      creditSideLedger: _creditSideLedger,
      debitSideLedger: await getTransactionModeLedgerHelper(
        stateData.mode!,
        _read,
      ),
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
