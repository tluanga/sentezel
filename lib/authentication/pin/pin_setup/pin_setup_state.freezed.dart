// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pin_setup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PinSetupStateTearOff {
  const _$PinSetupStateTearOff();

  _PinSetupState call(
      {required String pin,
      required String pinReEnter,
      required String passPhrase,
      required List<PinSetupError> error}) {
    return _PinSetupState(
      pin: pin,
      pinReEnter: pinReEnter,
      passPhrase: passPhrase,
      error: error,
    );
  }
}

/// @nodoc
const $PinSetupState = _$PinSetupStateTearOff();

/// @nodoc
mixin _$PinSetupState {
  String get pin => throw _privateConstructorUsedError;
  String get pinReEnter => throw _privateConstructorUsedError;
  String get passPhrase => throw _privateConstructorUsedError;
  List<PinSetupError> get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PinSetupStateCopyWith<PinSetupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PinSetupStateCopyWith<$Res> {
  factory $PinSetupStateCopyWith(
          PinSetupState value, $Res Function(PinSetupState) then) =
      _$PinSetupStateCopyWithImpl<$Res>;
  $Res call(
      {String pin,
      String pinReEnter,
      String passPhrase,
      List<PinSetupError> error});
}

/// @nodoc
class _$PinSetupStateCopyWithImpl<$Res>
    implements $PinSetupStateCopyWith<$Res> {
  _$PinSetupStateCopyWithImpl(this._value, this._then);

  final PinSetupState _value;
  // ignore: unused_field
  final $Res Function(PinSetupState) _then;

  @override
  $Res call({
    Object? pin = freezed,
    Object? pinReEnter = freezed,
    Object? passPhrase = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      pin: pin == freezed
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
      pinReEnter: pinReEnter == freezed
          ? _value.pinReEnter
          : pinReEnter // ignore: cast_nullable_to_non_nullable
              as String,
      passPhrase: passPhrase == freezed
          ? _value.passPhrase
          : passPhrase // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as List<PinSetupError>,
    ));
  }
}

/// @nodoc
abstract class _$PinSetupStateCopyWith<$Res>
    implements $PinSetupStateCopyWith<$Res> {
  factory _$PinSetupStateCopyWith(
          _PinSetupState value, $Res Function(_PinSetupState) then) =
      __$PinSetupStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String pin,
      String pinReEnter,
      String passPhrase,
      List<PinSetupError> error});
}

/// @nodoc
class __$PinSetupStateCopyWithImpl<$Res>
    extends _$PinSetupStateCopyWithImpl<$Res>
    implements _$PinSetupStateCopyWith<$Res> {
  __$PinSetupStateCopyWithImpl(
      _PinSetupState _value, $Res Function(_PinSetupState) _then)
      : super(_value, (v) => _then(v as _PinSetupState));

  @override
  _PinSetupState get _value => super._value as _PinSetupState;

  @override
  $Res call({
    Object? pin = freezed,
    Object? pinReEnter = freezed,
    Object? passPhrase = freezed,
    Object? error = freezed,
  }) {
    return _then(_PinSetupState(
      pin: pin == freezed
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
      pinReEnter: pinReEnter == freezed
          ? _value.pinReEnter
          : pinReEnter // ignore: cast_nullable_to_non_nullable
              as String,
      passPhrase: passPhrase == freezed
          ? _value.passPhrase
          : passPhrase // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as List<PinSetupError>,
    ));
  }
}

/// @nodoc

class _$_PinSetupState implements _PinSetupState {
  _$_PinSetupState(
      {required this.pin,
      required this.pinReEnter,
      required this.passPhrase,
      required this.error});

  @override
  final String pin;
  @override
  final String pinReEnter;
  @override
  final String passPhrase;
  @override
  final List<PinSetupError> error;

  @override
  String toString() {
    return 'PinSetupState(pin: $pin, pinReEnter: $pinReEnter, passPhrase: $passPhrase, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PinSetupState &&
            (identical(other.pin, pin) ||
                const DeepCollectionEquality().equals(other.pin, pin)) &&
            (identical(other.pinReEnter, pinReEnter) ||
                const DeepCollectionEquality()
                    .equals(other.pinReEnter, pinReEnter)) &&
            (identical(other.passPhrase, passPhrase) ||
                const DeepCollectionEquality()
                    .equals(other.passPhrase, passPhrase)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pin) ^
      const DeepCollectionEquality().hash(pinReEnter) ^
      const DeepCollectionEquality().hash(passPhrase) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$PinSetupStateCopyWith<_PinSetupState> get copyWith =>
      __$PinSetupStateCopyWithImpl<_PinSetupState>(this, _$identity);
}

abstract class _PinSetupState implements PinSetupState {
  factory _PinSetupState(
      {required String pin,
      required String pinReEnter,
      required String passPhrase,
      required List<PinSetupError> error}) = _$_PinSetupState;

  @override
  String get pin => throw _privateConstructorUsedError;
  @override
  String get pinReEnter => throw _privateConstructorUsedError;
  @override
  String get passPhrase => throw _privateConstructorUsedError;
  @override
  List<PinSetupError> get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PinSetupStateCopyWith<_PinSetupState> get copyWith =>
      throw _privateConstructorUsedError;
}
