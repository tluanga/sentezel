import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentezel/settings/pin/pin_repository.dart';

import 'package:sentezel/setup/app_model.dart';

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
  }
}
