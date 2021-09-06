import 'package:freezed_annotation/freezed_annotation.dart';

part 'journal_model.freezed.dart';

@freezed
class Journal with _$Journal {
  factory Journal({
    required String particular,
    required int amount,
    required DateTime date,
    required String transactionCategory,
    String? creditSideLedgerName,
    String? debitSideLedgerName,
    String? partyLedgerName,
    String? assetLedgerName,
    required String mode,
  }) = _Journal;
}
