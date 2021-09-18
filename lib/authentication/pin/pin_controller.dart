import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/authentication/pin/pin_model.dart';
import 'package:sentezel/authentication/pin/pin_repository.dart';

final pinControllerProvider =
    StateNotifierProvider<PinController, PIN>((ref) => PinController(ref.read));

class PinController extends StateNotifier<PIN> {
  final Reader _read;

  PinController(this._read)
      : super(
          PIN(pin: 0, passPhrase: ''),
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

  set passPhrase(String passphrase) {
    state = state.copyWith(passPhrase: passphrase);
  }
}
