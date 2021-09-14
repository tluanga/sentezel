import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentezel/settings/ledger_master/data/ledger_master_model.dart';

part 'debtor_model.freezed.dart';

@freezed
class Debtor with _$Debtor {
  factory Debtor({
    @Default(0) int amount,
    LedgerMaster? party,
  }) = _Debtor;
}
