import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentezel/settings/ledgerMaster/data/ledgerMaster_model.dart';

part 'creditor_model.freezed.dart';

@freezed
class Creditor with _$Creditor {
  factory Creditor({
    @Default(0) int amount,
    LedgerMaster? party,
  }) = _Creditor;
}
