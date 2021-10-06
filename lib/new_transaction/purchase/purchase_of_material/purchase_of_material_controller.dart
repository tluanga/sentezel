import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/new_transaction/common/helper/get_transaction_mode_ledger_helper.dart';
import 'package:sentezel/new_transaction/data/transaction_mode_enum.dart';
import 'package:sentezel/new_transaction/data/transaction_model.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/new_transaction/purchase/purchase_of_material/model/purchase_of_material_model.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_id_index.dart';
import 'package:sentezel/settings/ledger_master/ledger_master_repository.dart';

import 'package:sentezel/settings/transactionCategory/data/transaction_category_index.dart';

final purchaseOfMaterialControllerProvider =
    StateNotifierProvider<PurchaseOfMaterialController, PurchaseOfMaterial>(
        (ref) => PurchaseOfMaterialController(ref.read));

class PurchaseOfMaterialController extends StateNotifier<PurchaseOfMaterial> {
  final Reader _read;

  PurchaseOfMaterialController(this._read)
      : super(
          PurchaseOfMaterial(
            date: DateTime.now(),
            particular: 'Purchase of Material',
            errorMessages: [],
            amount: 0,
          ),
        );

  //--------------SET STATE-------------
  setState(payload) {
    PurchaseOfMaterial _newState = payload;
    state = _newState;
  }

  validate() {
    //---------Validation Part-----------
    List<String> _errorMessage = [];

    if (state.amount <= 0) {
      _errorMessage.add('Amount cannot be less than or equal to zero');
    }

    if (state.particular!.isEmpty) {
      _errorMessage.add('Please Enter Particular');
    }

    if (state.mode == TransactionMode.partialPaymentByBank ||
        state.mode == TransactionMode.partialPaymentByCash) {
      if (state.partyLedger == null) {
        _errorMessage.add('Please Select Party');
      }
      if (state.amount <= state.partialPaymentAmount) {
        _errorMessage
            .add('Partial Payment Amount cannot be larger than Amount');
      }
      if (state.partialPaymentAmount <= 0) {
        _errorMessage.add('Partial Amount cannot be zero');
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
      debitSideLedger: await _read(ledgerMasterRepositoryProvider)
          .getItem(id: LedgerMasterIndex.purchase),
    );
  }

  reset() async {
    state = PurchaseOfMaterial(
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
          partialPaymentAmount: state.partialPaymentAmount,
          particular: state.particular!,
          mode: state.mode!,
          date: state.date,
          transactionCategoryId: TransactionCategoryIndex.purchaseOfRawMaterial,
          debitSideLedger: state.debitSideLedger!.id,
          creditSideLedger: state.creditSideLedger != null
              ? state.creditSideLedger!.id
              : null,
          partyLedgerId:
              state.partyLedger != null ? state.partyLedger!.id : null,
        ),
      );
    } catch (e) {
      throw (e.toString());
    }
  }
}
