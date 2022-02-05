import 'package:sentezel/analytics/constant/analytics_constant.dart';
import 'package:sentezel/analytics/model/transaction_type_with_amount_model.dart';

import 'package:sentezel/common/database/db_service.dart';
import 'package:sentezel/common/enums/transaction_type_enum.dart';

import 'package:sentezel/settings/transactionCategory/data/transaction_category_model.dart';
import 'package:sentezel/new_transaction/data/transaction_model.dart' as trans;

import 'package:sentezel/settings/transactionCategory/transaction_category_config.dart';
import 'package:sqflite/sqflite.dart';

Future<TransactionTypeWithAmount> getIncomeOrExpenseByTransactionCategory(
    trans.Transaction transaction) async {
  //---get the detail of the category by the transaction categoryId

  Database db = await DatabaseService.instance.db;

  final result = await db.query(TransactionCategoryConfig.dbName,
      where: 'id=?', whereArgs: [transaction.transactionCategoryId]);
  final parsed = TransactionCategory.fromJson(result.first);

  switch (parsed.transactionType) {
    case TransactionType.lei:
      return TransactionTypeWithAmount(
        amount: transaction.debitAmount,
        transactionType: AnalyticConstant.expense,
      );

    case TransactionType.hralh:
      return TransactionTypeWithAmount(
        amount: transaction.debitAmount,
        transactionType: AnalyticConstant.expense,
      );

    case TransactionType.lakluh:
      return TransactionTypeWithAmount(
        amount: transaction.debitAmount,
        transactionType: AnalyticConstant.income,
      );
    case TransactionType.pekchhuah:
      return TransactionTypeWithAmount(
        amount: transaction.debitAmount,
        transactionType: AnalyticConstant.expense,
      );
    case TransactionType.debtRepaymentByDebtor:
      return TransactionTypeWithAmount(
        amount: transaction.debitAmount,
        transactionType: AnalyticConstant.income,
      );
    case TransactionType.debtRepaymentToCreditor:
      return TransactionTypeWithAmount(
        amount: transaction.debitAmount,
        transactionType: AnalyticConstant.expense,
      );
    case TransactionType.bankToCash:
      return TransactionTypeWithAmount(
        amount: 0,
        transactionType: AnalyticConstant.contra,
      );
    case TransactionType.cashToBank:
      return TransactionTypeWithAmount(
        amount: 0,
        transactionType: AnalyticConstant.contra,
      );
    case TransactionType.purchaseReturn:
      return TransactionTypeWithAmount(
        amount: transaction.debitAmount,
        transactionType: AnalyticConstant.income,
      );
    case TransactionType.saleReturn:
      return TransactionTypeWithAmount(
        amount: transaction.debitAmount,
        transactionType: AnalyticConstant.expense,
      );
    case TransactionType.capitalInjection:
      return TransactionTypeWithAmount(
        amount: transaction.debitAmount,
        transactionType: AnalyticConstant.income,
      );
    case TransactionType.openingBalanceCash:
      return TransactionTypeWithAmount(
        amount: transaction.debitAmount,
        transactionType: AnalyticConstant.income,
      );
    case TransactionType.openingBalanceBank:
      return TransactionTypeWithAmount(
        amount: transaction.debitAmount,
        transactionType: AnalyticConstant.income,
      );
  }

  //---check the transaction type
}
