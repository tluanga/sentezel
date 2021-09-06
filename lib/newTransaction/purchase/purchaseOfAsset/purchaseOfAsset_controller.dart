import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/newTransaction/common/helper/getTransactionModeLedger_helper.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/purchase/purchaseOfAsset/model/purchaseOfAsset_model.dart';

final purchaseOfAssetControllerProvider =
    StateNotifierProvider<PurchaseOfAssetController, PurchaseOfAsset>(
        (ref) => PurchaseOfAssetController(ref.read));

class PurchaseOfAssetController extends StateNotifier<PurchaseOfAsset> {
  final Reader _read;

  PurchaseOfAssetController(this._read)
      : super(PurchaseOfAsset(
          date: DateTime.now(),
          particular: '',
        ));
  setState(payload) {
    state = payload;
  }

  setup() async {
    print(state.mode);
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
      // _read(transactionRepositoryProvider).add(payload: state.data!.value);
    } catch (e) {
      print(e);
    }
  }

  reset() async {
    state = PurchaseOfAsset(date: DateTime.now());
  }
}
