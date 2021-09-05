import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/newTransaction/purchase/purchaseOfAsset/model/purchaseOfAsset_model.dart';

final purchaseOfAssetControllerProvider =
    StateNotifierProvider<PurchaseOfAssetController, PurchaseOfAsset>(
        (ref) => PurchaseOfAssetController(ref.read));

class PurchaseOfAssetController extends StateNotifier<PurchaseOfAsset> {
  final Reader _read;

  PurchaseOfAssetController(this._read)
      : super(PurchaseOfAsset(
          date: DateTime.now(),
        ));
  setState(payload) {
    state = payload;
  }

  setup() {
    state = state.copyWith(
      creditAmount: state.amount - state.partialPaymentAmount,
    );
  }

  submit() async {
    try {
      // _read(transactionRepositoryProvider).add(payload: state.data!.value);
    } catch (e) {
      print(e);
    }
  }
}
