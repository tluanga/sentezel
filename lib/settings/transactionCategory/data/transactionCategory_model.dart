import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentezel/common/enums/status_enum.dart';
import 'package:sentezel/common/enums/transactionType_enum.dart';

part 'transactionCategory_model.freezed.dart';
part 'transactionCategory_model.g.dart';

@freezed
class TransactionCategory with _$TransactionCategory {
  factory TransactionCategory({
    int? id,
    required String name,
    required String description,
    required TransactionType transactionType, // 0--for buy 1-- sell
    int? debitSideLedger,
    int? creditSideLedger,
    @Default(Status.active) Status status,
  }) = _TransactionCategory;
  factory TransactionCategory.fromJson(Map<String, dynamic> json) =>
      _$TransactionCategoryFromJson(json);
}
