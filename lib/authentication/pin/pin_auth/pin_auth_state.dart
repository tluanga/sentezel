import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_auth_state.freezed.dart';

@freezed
class PinAuthState with _$PinAuthState {
  factory PinAuthState({
    required String pin,
    required String error,
  }) = _PinAuthState;
}
