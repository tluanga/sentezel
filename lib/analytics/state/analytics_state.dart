import 'package:sentezel/analytics/model/transaction_analytic_model.dart';
import 'package:sentezel/new_transaction/data/transaction_model.dart';

class AnalyticsState {
  DateTime startDate;
  DateTime endDate;
  List<TransactionAnalytics> transactionList;
  AnalyticsState({
    required this.startDate,
    required this.endDate,
    required this.transactionList,
  });
}
