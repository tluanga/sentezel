import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/authentication/pin/pin_repository.dart';
import 'package:sentezel/settings/business_profile/business_profile_repository.dart';

import 'package:sentezel/setup/app_model.dart';

final appControllerProvider = StateNotifierProvider<AppController, App>(
    (ref) => AppController(ref.read)..checkSetup());

class AppController extends StateNotifier<App> {
  final Reader _read;

  AppController(this._read)
      : super(
          App(businessProfileIsSetup: false, pinIsSetup: false),
        );
  //---we need to check the business profile and pin are setup--
  checkSetup() async {
    bool _pinIsSetup = false;
    bool _businessProfileIsSetup = false;

    //-------Check PIN is setup
    final pin = await _read(pinRepositoryProvider).get();
    if (pin.pin != 0) {
      _pinIsSetup = true;
    }

    //------Check Business Profile is Setup----
    final businessProfile = await _read(businessProfileRepository).get();
    if (businessProfile.name.isEmpty) {
      _businessProfileIsSetup = false;
    } else {
      _businessProfileIsSetup = true;
    }

    //----PinSetup Check
    final pinSetup = await _read(pinRepositoryProvider).get();
    if (pinSetup.pin == 0) {
      _pinIsSetup = false;
    } else {
      _pinIsSetup = true;
    }
    state = state.copyWith(
        businessProfileIsSetup: _businessProfileIsSetup,
        pinIsSetup: _pinIsSetup);
  }
}
