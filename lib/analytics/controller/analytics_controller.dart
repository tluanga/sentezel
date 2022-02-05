import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/analytics/constant/analytics_constant.dart';
import 'package:sentezel/analytics/model/transaction_analytic_model.dart';

import 'package:sentezel/analytics/repository/analytics_repository.dart';
import 'package:sentezel/analytics/state/analytics_state.dart';
import 'package:sentezel/analytics/utils/get_income_expense_by_mode_helper.dart';

final analyticsControllerProvider = StateNotifierProvider.autoDispose<
        AnalyticsController, AsyncValue<AnalyticsState>>(
    (ref) => AnalyticsController(ref.read)..loadData());

class AnalyticsController extends StateNotifier<AsyncValue<AnalyticsState>> {
  final Reader _read;
  AnalyticsController(this._read) : super(const AsyncValue.loading());

  loadData({DateTime? startDate, DateTime? endDate}) async {
    state = const AsyncLoading();
    startDate ??= DateTime.now().subtract(const Duration(days: 7));
    _read(analyticRepositoryProvider).getList();

    endDate ??= DateTime.now();

    final _transactionList = await _read(analyticRepositoryProvider).getList(
      startDate: startDate,
      endDate: endDate,
    );

    List<TransactionAnalytics> _transactionAnalyticList = [];
    int _max = 0;
    //--------Process transaction list--------------
    if (_transactionList.isNotEmpty) {
      for (int i = 0; i < _transactionList.length; i++) {
        final _data =
            await getIncomeOrExpenseByTransactionCategory(_transactionList[i]);
        //---Calculate Max--

        final _transactiondata = TransactionAnalytics(
          date: _transactionList[i].date,
          expenditureAmount: _data.transactionType == AnalyticConstant.expense
              ? _data.amount
              : 0,
          incomeAmount: _data.transactionType == AnalyticConstant.income
              ? _data.amount
              : 0,
        );
        //Check the date for changes--
        if (i == 0) {
          _transactionAnalyticList.add(_transactiondata);
          _max = _data.amount;
          continue;
        }
        //--check if the date are same --
        if (_transactionList[i - 1].date.month ==
            _transactionList[i].date.month) {
          if (_transactionList[i - 1].date.day ==
              _transactionList[i].date.day) {
            //same day
            _transactionAnalyticList.last = TransactionAnalytics(
              date: _transactiondata.date,
              expenditureAmount: _transactiondata.expenditureAmount +
                  _transactionAnalyticList.last.expenditureAmount,
              incomeAmount: _transactiondata.incomeAmount +
                  _transactionAnalyticList.last.incomeAmount,
            );

            int _maxInaDay = 0;
            if (_transactiondata.expenditureAmount >
                _transactiondata.incomeAmount) {
              _maxInaDay = _transactiondata.expenditureAmount;
            } else {
              _maxInaDay = _transactiondata.incomeAmount;
            }
            _max = _maxInaDay > _max ? _maxInaDay : _max;
            
            continue;
          }
        }
        int _maxInaDay = 0;
        if (_transactiondata.expenditureAmount >
            _transactiondata.incomeAmount) {
          _maxInaDay = _transactiondata.expenditureAmount;
        } else {
          _maxInaDay = _transactiondata.incomeAmount;
        }
        _max = _maxInaDay > _max ? _maxInaDay : _max;
        _transactionAnalyticList.add(_transactiondata);
      }

      //--------Scale the transaction Data for display in the chart--------

      //--------Scale the value accoring to that value-----------
      //---------Max Y is 20

      state = AsyncData(
        AnalyticsState(
          startDate: startDate,
          endDate: endDate,
          transactionList: _transactionAnalyticList,
        ),
      );
    }
  }
}
