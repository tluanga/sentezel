import 'package:sentezel/authentication/pin/pin_setup/pin_setup_error_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_setup_state.freezed.dart';

@freezed
class PinSetupState with _$PinSetupState {
  factory PinSetupState(
      {required String pin,
      required String pinReEnter,
      required String passPhrase,
      required List<PinSetupError> error}) = _PinSetupState;
}




// class PinSetupState {
//   int pin;
//   int pinReEnter;
//   String passPhrase;
//   List<PinSetupError> error;
//   PinSetupState({
//     required this.pin,
//     required this.pinReEnter,
//     required this.passPhrase,
//     required this.error,
//   });

//   PinSetupState copyWith({
//     int? pin,
//     int? pinReEnter,
//     String? passPhrase,
//     List<PinSetupError>? error,
//   }) {
//     return PinSetupState(
//       pin: pin ?? this.pin,
//       pinReEnter: pinReEnter ?? this.pinReEnter,
//       passPhrase: passPhrase ?? this.passPhrase,
//       error: error ?? this.error,
//     );
//   }
// }
