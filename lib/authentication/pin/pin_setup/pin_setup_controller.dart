import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/authentication/pin/pin_model.dart';
import 'package:sentezel/authentication/pin/pin_setup/pin_setup_state.dart';

class PinSetupController extends StateNotifier<PinSetupState> {
  final Reader _read;
  PinSetupController(this._read)
      : super(
          PinSetupState(
            pin: 1,
            passPhrase: '',
            error: '',
          ),
        );
  setState(PinSetupState newState) {
    state = newState;
  }
}
