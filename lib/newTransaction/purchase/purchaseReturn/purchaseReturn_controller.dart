import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/newTransaction/common/helper/getTransactionModeLedger_helper.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/newTransaction/purchase/purchaseReturn/model/purchaseReturn_model.dart';
import 'package:sentezel/settings/ledgerMaster/ledgerMaster_repository.dart';
import 'package:sentezel/settings/transactionCategory/data/transactionCategory_index.dart';
import 'package:sentezel/settings/transactionCategory/transactionCategory_repository.dart';

final purchaseReturnControllerProvider =
    StateNotifierProvider<PurchaseReturnController, PurchaseReturn>(
        (ref) => PurchaseReturnController(ref.read));

class PurchaseReturnController extends StateNotifier<PurchaseReturn> {
  final Reader _read;

  PurchaseReturnController(this._read)
      : super(
          PurchaseReturn(
            date: DateTime.now(),
            particular: 'Purchase Return',
            errorMessages: [],
            amount: 0,
          ),
        );

  //--------------SET STATE-------------
  setState(payload) {
    PurchaseReturn _newState = payload;
    state = _newState;
  }

  validate() {
    print(state.mode);
    //---------Validation Part-----------
    List<String> _errorMessage = [];

    if (state.amount <= 0) {
      _errorMessage.add('Amount can not be less than equalto Zero');
    }

    state = state.copyWith(errorMessages: _errorMessage);
  }

  setup() async {
    //---------------Updating the state-------
    final _category = await _read(transactionCategoryRepositoryProvider)
        .getItem(id: TransactionCategoryIndex.PurchaseReturn);
    state = state.copyWith(
      category: _category,
      creditAmount: state.amount,
      debitAmount: state.amount,
      debitSideLedger: await getTransactionModeLedgerHelper(
        state.mode!,
        _read,
      ),
      creditSideLedger: await _read(ledgerMasterRepositoryProvider)
          .getItem(id: _category.creditSideLedger),
    );
    print(state);
  }

  reset() async {
    state = PurchaseReturn(
      date: DateTime.now(),
      particular: 'Purchase of Material',
      errorMessages: [],
    );
  }

  submit() async {
    try {
      _read(transactionRepositoryProvider).add(
        payload: Transaction(
          debitAmount: state.debitAmount,
          creditAmount: state.creditAmount,
          partialPaymentAmount: 0,
          particular: state.particular!,
          mode: state.mode!,
          date: state.date,
          transactionCategoryId: state.category!.id,
          debitSideLedger: state.debitSideLedger!.id,
          creditSideLedger: state.creditSideLedger != null
              ? state.creditSideLedger!.id
              : null,
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
