import 'package:hooks_riverpod/hooks_riverpod.dart';

class PinSetupState {
  int pin;
  String passPhrase;
  String error;
  PinSetupState({
    required this.pin,
    required this.passPhrase,
    required this.error,
  });
}
