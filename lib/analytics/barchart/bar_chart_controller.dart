import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/analytics/barchart/models/barchart_element_model.dart';
import 'package:sentezel/analytics/barchart/models/barchart_model.dart';

import 'package:sentezel/common/enums/transaction_type_enum.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';

final barChartControllerProvider =
    StateNotifierProvider<BarChartController, AsyncValue<BarChart>>(
        (ref) => BarChartController(ref.read)..loadData());

class BarChartController extends StateNotifier<AsyncValue<BarChart>> {
  final Reader _read;

  BarChartController(this._read) : super(const AsyncLoading());

  //----Loading an processing data---------
  loadData() async {
    List<BarChartElement> _barChartElementList = [];
    // ----get all transaction----
    final _transactionList = await _read(transactionRepositoryProvider)
        .getList(startDate: DateTime.now().subtract(const Duration(days: 7)));
    //-----Sort that transaction by date---
    _transactionList.sort((x, y) => x.date.compareTo(y.date));

    //-----create daily transaction----
    for (int i = 0; i < _transactionList.length; i++) {
      final TransactionCategory _transactionCategory =
          await _read(transactionCategoryRepositoryProvider)
              .getItem(id: _transactionList[i].transactionCategoryId);

      // -----------Setting the date---------
      bool _sameDay = false;
      if (i == 0) {
        _sameDay = false;
      } else if (_transactionList[i].date != _transactionList[i - 1].date) {
        _sameDay = false;
      } else {
        _sameDay = true;
      }

      if (_transactionCategory.transactionType == TransactionType.lakluh ||
          _transactionCategory.transactionType == TransactionType.hralh ||
          _transactionCategory.transactionType ==
              TransactionType.debtRepaymentByDebtor) {
        if (_sameDay == true) {
          _barChartElementList.last.income += _transactionList[i].debitAmount;
          _barChartElementList.last.total += _transactionList[i].debitAmount;
        } else {
          _barChartElementList.add(
            BarChartElement(
              date: _transactionList[i].date,
              expense: 0,
              income: _transactionList[i].debitAmount,
              total: _transactionList[i].debitAmount,
            ),
          );
        }
        // * check if the transaction is expense
      } else if (_transactionCategory.transactionType == TransactionType.lei ||
          _transactionCategory.transactionType == TransactionType.pekchhuah) {
        if (_sameDay == true) {
          _barChartElementList.last.expense += _transactionList[i].creditAmount;
          _barChartElementList.last.total += _transactionList[i].creditAmount;
        } else {
          _barChartElementList.add(
            BarChartElement(
              date: _transactionList[i].date,
              expense: _transactionList[i].creditAmount,
              income: 0,
              total: _transactionList[i].creditAmount,
            ),
          );
        }
      }
    }
    // for (var element in _barChartElementList) {
    //   // ignore: avoid_print
    //   print('--------------------------');
    //   print(element.date);
    //   print(element.expense);
    //   print(element.income);
    //   print(element.total);
    //   print('#############################');
    // }
    state = AsyncValue.data(BarChart(
        leftTitle: [], bottomTitle: [], barchartElement: _barChartElementList));
  }
}
