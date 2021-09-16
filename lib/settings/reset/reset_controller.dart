import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetController extends StateNotifier<int> {
  final Reader _read;
  ResetController(this._read) : super(0);
}
