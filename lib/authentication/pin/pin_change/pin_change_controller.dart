import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/authentication/pin/pin_change/pin_change_error.dart';
import 'package:sentezel/authentication/pin/pin_change/pin_change_state.dart';
import 'package:sentezel/authentication/pin/pin_model.dart';
import 'package:sentezel/authentication/pin/pin_repository.dart';

final pinChangeStateControllerProvider =
    StateNotifierProvider<PinChangeStateController, PinChangeState>(
        (ref) => PinChangeStateController(ref.read)..loadData());

class PinChangeStateController extends StateNotifier<PinChangeState> {
  final Reader _read;
  PinChangeStateController(this._read)
      : super(
          PinChangeState(
            enteredPin: '',
            reEnteredPin: '',
            enteredPassPhrase: '',
            passPhrase: '',
            error: [],
          ),
        );

  loadData() async {
    final pinData = await _read(pinRepositoryProvider).get();
    state = state.copyWith(passPhrase: pinData.passPhrase);
  }

  setState(newState) {
    state = newState;
  }

  validate() {
    if (state.passPhrase != state.enteredPassPhrase) {
      state.error.removeWhere(
          (element) => element == PinChangeError.inCorrectPassPhrase);
      state.error.add(PinChangeError.inCorrectPassPhrase);
      return;
    } else {
      state.error.removeWhere(
          (element) => element == PinChangeError.inCorrectPassPhrase);
    }

    if (state.enteredPassPhrase.isEmpty) {
      state.error.removeWhere(
          (element) => element == PinChangeError.passPhraseCannotBeEmpty);
      state.error.add(PinChangeError.passPhraseCannotBeEmpty);
      return;
    } else {
      state.error.removeWhere(
          (element) => element == PinChangeError.passPhraseCannotBeEmpty);
    }

    if (state.enteredPin != state.reEnteredPin) {
      state.error
          .removeWhere((element) => element == PinChangeError.pinNotMatched);
      state.error.add(PinChangeError.pinNotMatched);
      return;
    } else {
      state.error
          .removeWhere((element) => element == PinChangeError.pinNotMatched);
    }
    if (state.enteredPin.isNotEmpty && state.enteredPin.isNotEmpty) {
      _read(pinRepositoryProvider).pinChange(
        PIN(
          id: 1,
          pin: int.parse(state.enteredPin),
          passPhrase: state.passPhrase,
        ),
      );
    }
  }
}
