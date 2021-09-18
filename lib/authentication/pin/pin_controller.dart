import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/authentication/pin/pin_model.dart';
import 'package:sentezel/authentication/pin/pin_repository.dart';

final pinControllerProvider =
    StateNotifierProvider<PinController, PIN>((ref) => PinController(ref.read));

class PinController extends StateNotifier<PIN> {
  final Reader _read;

  PinController(this._read)
      : super(
          PIN(pin: 0, passPhrase: '', error: ''),
        );

  setup(PIN payload) async {
    _read(pinRepositoryProvider).pinSetup(payload);
  }

  pinChange(PIN payload) {
    _read(pinRepositoryProvider).pinChange(payload);
  }

  set pin(int pin) {
    state = state.copyWith(pin: pin);
  }

  checkPassPhrase(String passphrase) async {
    final data = await _read(pinRepositoryProvider).get();
    if (passphrase != data.passPhrase) {
      state = state.copyWith(error: 'passphrase is not correct');
    }
  }
}
