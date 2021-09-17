import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/new_transaction/common/helper/get_transaction_mode_ledger_helper.dart';
import 'package:sentezel/new_transaction/data/transaction_mode_enum.dart';
import 'package:sentezel/new_transaction/data/transaction_model.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/new_transaction/purchase/purchase_of_asset/model/purchase_of_asset_model.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_index.dart';

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
            amount: 0,
          ),
        );

  //--------------SET STATE-------------
  setState(payload) {
    PurchaseOfAsset _newState = payload;
    state = _newState;
  }

  validate() {
    //---------Validation Part-----------
    List<String> _errorMessage = [];

    if (state.amount <= 0) {
      _errorMessage.add('Amount can not be less than equalto Zero');
    }

    if (state.assetLedger == null) {
      _errorMessage.add('Please select asset');
    }

    if (state.mode == TransactionMode.partialPaymentByBank ||
        state.mode == TransactionMode.partialPaymentByCash) {
      if (state.partyLedger == null) {
        _errorMessage.add('Please Select Party');
      }
      if (state.amount <= state.partialPaymentAmount) {
        _errorMessage
            .add('Partial Payment Amount cannot be Larger  than Amount');
      }
      if (state.partialPaymentAmount <= 0) {
        _errorMessage.add('Partial Amount cannot be Zero');
      }
      if (state.particular!.isEmpty) {
        _errorMessage.add('Please Enter Particular');
      }
    }
    if (state.mode == TransactionMode.credit && state.partyLedger == null) {
      _errorMessage.add('Please Select Party');
    }
    state = state.copyWith(errorMessages: _errorMessage);
  }

  setup() async {
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
          transactionCategoryId: TransactionCategoryIndex.purchaseOfAssets,
          assetLedgerId: state.assetLedger!.id,
          creditSideLedger: state.creditSideLedger != null
              ? state.creditSideLedger!.id
              : null,
          partyLedgerId:
              state.partyLedger != null ? state.partyLedger!.id : null,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  reset() async {
    state = PurchaseOfAsset(
      date: DateTime.now(),
      particular: 'Purchase of Asset',
      errorMessages: [],
    );
  }
}
