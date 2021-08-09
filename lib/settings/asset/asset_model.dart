import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentezel/common/enums/activeInActive_enum.dart';

part 'asset_model.freezed.dart';
part 'asset_model.g.dart';

@freezed
abstract class Asset with _$Asset {
  const Asset._();
  const factory Asset({
    String? id,
    required String name,
    required String description,
    @Default(ActiveInActive.active) ActiveInActive status,
  }) = _Asset;

  String getInitialLetter() {
    return this.name[0].toUpperCase();
  }

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}
