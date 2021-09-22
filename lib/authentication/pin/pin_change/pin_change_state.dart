import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentezel/authentication/pin/pin_change/pin_change_error.dart';

part 'pin_change_state.freezed.dart';

@freezed
class PinChangeState with _$PinChangeState {
  factory PinChangeState({
    required String enteredPin,
    required String reEnteredPin,
    required String enteredPassPhrase,
    required String passPhrase,
    required List<PinChangeError> error,
  }) = _PinChangeState;
}
