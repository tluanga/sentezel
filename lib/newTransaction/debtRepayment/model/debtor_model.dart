import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';

part 'debtor_model.freezed.dart';

@freezed
class Debtor with _$Debtor {
  factory Debtor({
    @Default(0) int amount,
    LedgerMaster? party,
  }) = _Debtor;
}
