import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/authentication/pin/pin_model.dart';
import 'package:sentezel/authentication/pin/pin_repository.dart';
import 'package:sentezel/authentication/pin/pin_setup/pin_setup_error_enum.dart';
import 'package:sentezel/authentication/pin/pin_setup/pin_setup_state.dart';

final pinSetupControllerProvider =
    StateNotifierProvider<PinSetupController, PinSetupState>(
  (ref) => PinSetupController(ref.read),
);

class PinSetupController extends StateNotifier<PinSetupState> {
  final Reader _read;
  PinSetupController(this._read)
      : super(
          PinSetupState(
            pin: '',
            pinReEnter: '',
            passPhrase: '',
            error: [],
          ),
        );
  setState(PinSetupState newState) {
    state = newState;
  }

  validate() {
    if (state.passPhrase.isEmpty) {
      state.error.add(PinSetupError.passPhraseCannotBeEmpty);
    } else {
      state.error.removeWhere(
          (element) => element == PinSetupError.passPhraseCannotBeEmpty);
      state.error.removeWhere(
          (element) => element == PinSetupError.passPhraseCannotBeEmpty);
    }

    if (state.pin != state.pinReEnter || state.pinReEnter.isEmpty) {
      state.error
          .removeWhere((element) => element == PinSetupError.pinNotMatched);
      state.error.add(PinSetupError.pinNotMatched);
    } else {
      state.error
          .removeWhere((element) => element == PinSetupError.pinNotMatched);
    }
  }

  save() {
    _read(pinRepositoryProvider).pinChange(
      PIN(
        id: 1,
        pin: int.parse(state.pin),
        passPhrase: state.passPhrase,
      ),
    );
  }
}
