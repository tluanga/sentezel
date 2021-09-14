import 'package:freezed_annotation/freezed_annotation.dart';

part 'ledger_master_union.freezed.dart';

@freezed
class LedgerMasterUnion with _$LedgerMasterUnion {
  factory LedgerMasterUnion({required int index, required String name}) =
      _LedgerMasterUnion;
}
