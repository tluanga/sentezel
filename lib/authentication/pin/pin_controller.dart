import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/authentication/pin/pin_model.dart';
import 'package:sentezel/authentication/pin/pin_repository.dart';

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
}
