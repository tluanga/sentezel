import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/newTransaction/data/transactionMode_enum.dart';
import 'package:sentezel/newTransaction/data/transaction_repository.dart';
import 'package:sentezel/newTransaction/debtRepayment/debtor_model.dart';

final debtorListControllerProvider =
    StateNotifierProvider<DebtorListController, AsyncValue<List<Debtor>>>(
        (ref) => DebtorListController(ref.read)..getList());

class DebtorListController extends StateNotifier<AsyncValue<List<Debtor>>> {
  Reader _read;
  DebtorListController(this._read) : super(AsyncValue.loading());

  getList() async {
    //---transaction---debtor calculator--
    //
    final list = await _read(transactionRepositoryProvider).getList(
      searchString: '',
      mode: TransactionMode.credit,
    );
    print(list);

    List<Debtor> _deborList = [];
    list.forEach((element) {
      _deborList.add(
        Debtor(
          amount: element.amount,
          debtorName: element.partyId.toString(),
        ),
      );
    });
    state = AsyncData(_deborList);
    //from transaction
  }
}
