import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/analytics/analytics_model.dart';
import 'package:sentezel/analytics/enum.dart';
import 'package:sentezel/common/enums/transaction_type_enum.dart';
import 'package:sentezel/new_transaction/data/transaction_mode_enum.dart';
import 'package:sentezel/new_transaction/data/transaction_repository.dart';
import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/settings/transactionCategory/transaction_category_repository.dart';

final analyticsControllerProvider =
    StateNotifierProvider<AnalyticsController, AsyncValue<Analytics>>(
        (ref) => AnalyticsController(ref.read)..loadData());

class AnalyticsController extends StateNotifier<AsyncValue<Analytics>> {
  final Reader _read;
  AnalyticsController(this._read) : super(const AsyncValue.loading());

  // setState(Analytics data) {
  //   state = state.copyWith(
  //       startDate: data.startDate,
  //       endDate: data.endDate,
  //       chartMode: data.chartMode);
  //   print(state);
  // }

  setState(payload) {
    Analytics _newState = payload;
    state = AsyncData(_newState);
  }

  loadData() async {
    try {
      // daily Transactions
      List<double> salesPerDayList = [];
      List<double> expensePerDayList = [];
      List<double> salesPerMonthList = [];
      List<double> expensePerMonthList = [];
      for (int i = 1; i < 8; i++) {
        double totalSalesPerDay = 0;
        double totalExpensePerDay = 0;
        final startDate = DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day - i);
        final endDate = DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day - (i - 1));
        final _transactionList = await _read(transactionRepositoryProvider)
            .getList(startDate: startDate, endDate: endDate);
        print('------------');
        print(startDate);
        print(endDate);
        print('the value of i is $i');
        print('transaction length ${_transactionList.length}');
        for (int j = 0; j < _transactionList.length; j++) {
          print('transaction date ${_transactionList[j].date}');
          print('------------');
          final TransactionCategory _transactionCategory =
              await _read(transactionCategoryRepositoryProvider)
                  .getItem(id: _transactionList[j].transactionCategoryId);
          // check for sales
          if (_transactionCategory.transactionType == TransactionType.lakluh ||
              _transactionCategory.transactionType == TransactionType.hralh ||
              _transactionCategory.transactionType ==
                  TransactionType.debtRepaymentByDebtor) {
            // check for payment type
            if (_transactionList[j].mode ==
                    TransactionMode.partialPaymentByBank ||
                _transactionList[j].mode ==
                    TransactionMode.partialPaymentByCash) {
              totalSalesPerDay +=
                  _transactionList[j].partialPaymentAmount.toDouble();
            } else {
              totalSalesPerDay += _transactionList[j].creditAmount.toDouble();
            }
          } else if (_transactionCategory.transactionType ==
                  TransactionType.lei ||
              _transactionCategory.transactionType ==
                  TransactionType.pekchhuah ||
              _transactionCategory.transactionType ==
                  TransactionType.debtRepaymentToCreditor) {
            if (_transactionList[j].mode ==
                    TransactionMode.partialPaymentByBank ||
                _transactionList[j].mode ==
                    TransactionMode.partialPaymentByCash) {
              totalExpensePerDay +=
                  _transactionList[j].partialPaymentAmount.toDouble();
            } else {
              totalExpensePerDay += _transactionList[j].debitAmount.toDouble();
            }
          }
        }
        salesPerDayList.add(totalSalesPerDay);
        expensePerDayList.add(totalExpensePerDay);
      }
      // monthly Transactions
      for (int i = 0; i < 6; i++) {
        double totalSalesPerMonth = 0;
        double totalExpensePerMonth = 0;
        final startDate =
            DateTime(DateTime.now().year, DateTime.now().month - i);
        final endDate =
            DateTime(DateTime.now().year, DateTime.now().month - (i - 1));
        final _transactionList = await _read(transactionRepositoryProvider)
            .getList(startDate: startDate, endDate: endDate);
        for (int j = 0; j < _transactionList.length; j++) {
          final TransactionCategory _transactionCategory =
              await _read(transactionCategoryRepositoryProvider)
                  .getItem(id: _transactionList[j].transactionCategoryId);
          // check for sales
          if (_transactionCategory.transactionType == TransactionType.lakluh ||
              _transactionCategory.transactionType == TransactionType.hralh ||
              _transactionCategory.transactionType ==
                  TransactionType.debtRepaymentByDebtor) {
            // check for payment type
            if (_transactionList[j].mode ==
                    TransactionMode.partialPaymentByBank ||
                _transactionList[j].mode ==
                    TransactionMode.partialPaymentByCash) {
              totalSalesPerMonth +=
                  _transactionList[j].partialPaymentAmount.toDouble();
            } else {
              totalSalesPerMonth += _transactionList[j].creditAmount.toDouble();
            }
          } else if (_transactionCategory.transactionType ==
                  TransactionType.lei ||
              _transactionCategory.transactionType ==
                  TransactionType.pekchhuah ||
              _transactionCategory.transactionType ==
                  TransactionType.debtRepaymentToCreditor) {
            if (_transactionList[j].mode ==
                    TransactionMode.partialPaymentByBank ||
                _transactionList[j].mode ==
                    TransactionMode.partialPaymentByCash) {
              totalExpensePerMonth +=
                  _transactionList[j].partialPaymentAmount.toDouble();
            } else {
              totalExpensePerMonth +=
                  _transactionList[j].debitAmount.toDouble();
            }
          }
        }
        salesPerMonthList.add(totalSalesPerMonth);
        expensePerMonthList.add(totalExpensePerMonth);
      }
      Analytics _analytics = Analytics(
          startDate: DateTime.now(),
          endDate: DateTime.now(),
          chartMode: ChartMode.barChart,
          timePeriod: TimePeriod.daily,
          salesPerDay: salesPerDayList,
          expensePerDay: expensePerDayList,
          salesPerMonth: salesPerMonthList,
          expensePerMonth: expensePerMonthList);
      state = AsyncData(_analytics);
    } catch (e) {
      throw e.toString();
    }
  }
}
