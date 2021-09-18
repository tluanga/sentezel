import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sentezel/analytics/analytics_controller.dart';
import 'package:sentezel/analytics/barchart/barchar_generate_left_titile_helper.dart';
import 'package:sentezel/analytics/barchart/barchart_make_groupdata_helper.dart';
import 'package:sentezel/analytics/barchart/models/barchart_element_model.dart';
import 'package:sentezel/analytics/barchart/models/barchart_model.dart';

import 'package:sentezel/common/enums/transaction_type_enum.dart';
import 'package:sentezel/common/helpers/dateHelper/date_helper.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';

final barChartControllerProvider =
    StateNotifierProvider<BarChartController, AsyncValue<BarChartState>>(
        (ref) => BarChartController(ref.read));

class BarChartController extends StateNotifier<AsyncValue<BarChartState>> {
  final Reader _read;

  BarChartController(this._read) : super(const AsyncLoading());

  //----Loading an processing data---------
  loadData(DateTime startDate, DateTime endDate) async {
    List<BarChartElement> _barChartElementList = [];
    List<String> _bottomTitles = [];

    print('Inside barchart controller start date $startDate endDate $endDate');
    // ----get all transaction----
    final _transactionList = await _read(transactionRepositoryProvider)
        .getList(startDate: startDate, endDate: endDate);

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
      } else if (DateHelper.compareTwoDateWithoutTime(
              _transactionList[i].date, _transactionList[i - 1].date) !=
          DateHelper.equal) {
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
          _bottomTitles.add(DateFormat('dd').format(_transactionList[i].date));
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

          _bottomTitles.add(DateFormat('dd').format(_transactionList[i].date));
        }
      }
    }
    final _max = _barChartElementList.reduce((value, element) =>
        (value.expense > value.income ? value.expense : value.income) >
                (element.expense > element.income
                    ? element.expense
                    : element.income)
            ? value
            : element);
    final _maxAmount = _max.expense > _max.income ? _max.expense : _max.income;

    state = AsyncValue.data(
      BarChartState(
        leftTitle: generateLeftTitle(highestValue: _maxAmount),
        bottomTitle: _bottomTitles,
        barchartElementList: _barChartElementList,
        barGroupList: generateBarchartGroupDataList(_barChartElementList),
      ),
    );
  }
}
