import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/newTransaction/common/helper/getTransactionModeLedger_helper.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_model.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/newTransaction/purchase/purchaseOfAsset/model/purchaseOfAsset_model.dart';
import 'package:sentezel/settings/transactionCategory/data/transactionCategory_index.dart';

final purchaseOfAssetControllerProvider =
    StateNotifierProvider<PurchaseOfAssetController, PurchaseOfAsset>(
        (ref) => PurchaseOfAssetController(ref.read));

class PurchaseOfAssetController extends StateNotifier<PurchaseOfAsset> {
  final Reader _read;

  PurchaseOfAssetController(this._read)
      : super(
          PurchaseOfAsset(
            date: DateTime.now(),
            particular: 'Purchase of Asset',
            errorMessages: [],
          ),
        );

  //--------------SET STATE-------------
  setState(payload) {
    PurchaseOfAsset _newState = payload;
    state = _newState;
  }

  setup() async {
    print(state.mode);
    //---------Validation Part-----------
    List<String> _errorMessage = [];
    if (state.amount <= state.partialPaymentAmount)
      _errorMessage.add('Partial Payment Amount cannot be Larger  than Amount');
    if (state.amount <= 0) {
      _errorMessage.add('Amount can not be less than equalto Zero');
    }
    if (state.assetLedger == null) {
      _errorMessage.add('Please select asset');
    }
    print('length of error message ${_errorMessage}');

    //---------------Updating the state-------
    state = state.copyWith(
      creditAmount: state.amount - state.partialPaymentAmount,
      debitAmount: state.amount,
      creditSideLedger: state.mode != TransactionMode.credit
          ? await getTransactionModeLedgerHelper(
              state.mode!,
              _read,
            )
          : null,
      errorMessages: _errorMessage,
    );
  }

  submit() async {
    try {
      _read(transactionRepositoryProvider).add(
        payload: Transaction(
          debitAmount: state.debitAmount,
          creditAmount: state.creditAmount,
          partialPaymentAmount: state.partialPaymentAmount,
          particular: state.particular!,
          mode: state.mode!,
          date: state.date,
          transactionCategoryId: TransactionCategoryIndex.PurchaseOfAssets,
          assetLedgerId: state.assetLedger!.id,
          creditSideLedger: state.creditSideLedger != null
              ? state.creditSideLedger!.id
              : null,
          partyLedgerId:
              state.partyLedger != null ? state.partyLedger!.id : null,
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  reset() async {
    state = PurchaseOfAsset(
      date: DateTime.now(),
      errorMessages: [],
    );
  }
}
