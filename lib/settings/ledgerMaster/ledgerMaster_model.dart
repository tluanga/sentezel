import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentezel/common/enums/activeInActive_enum.dart';
import 'package:sentezel/common/enums/ledgerMasterType_enum.dart';

// part 'ledgerMaster_model.g.dart';
part 'ledgerMaster_model.freezed.dart';
part 'ledgerMaster_model.g.dart';

@freezed
abstract class LedgerMaster with _$LedgerMaster {
  //we have to define a single private constructor
  // "extending" the class and instead "implements" it.
  const LedgerMaster._();
  const factory LedgerMaster({
    String? id,
    required String name,
    String? description,
    required LedgerMasterType type,
    @Default(ActiveInActive.active) ActiveInActive status,
  }) = _LedgerMaster;

  String getInitialLetter() {
    return this.name[0].toUpperCase();
  }

  factory LedgerMaster.fromJson(Map<String, dynamic> json) =>
      _$LedgerMasterFromJson(json);
}
