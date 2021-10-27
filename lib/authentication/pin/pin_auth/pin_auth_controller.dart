import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/authentication/pin/pin_auth/pin_auth_state.dart';
import 'package:sentezel/authentication/pin/pin_repository.dart';

final pinAuthControllerProvider =
    StateNotifierProvider<PinAuthController, PinAuthState>((ref) {
  return PinAuthController(ref.read)..loadData();
});

class PinAuthController extends StateNotifier<PinAuthState> {
  final Reader _read;

  PinAuthController(this._read)
      : super(PinAuthState(
          pin: '',
          error: '',
          enteredPin: '',
        ));

  loadData() async {
    final _pinData = await _read(pinRepositoryProvider).get();
    state = state.copyWith(
      pin: _pinData.pin.toString(),
    );
  }

  setEnterPin(String pin) {
    state = state.copyWith(enteredPin: pin);
    validate();
  }

  validate() {
    if (state.pin == state.enteredPin) {
      state = state.copyWith(authenticate: true);
    } else if (state.enteredPin.length == 4) {
      state = state.copyWith(error: 'Incorrect PIN');
    }
  }
}
