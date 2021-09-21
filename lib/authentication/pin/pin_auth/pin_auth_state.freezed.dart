// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pin_auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PinAuthStateTearOff {
  const _$PinAuthStateTearOff();

  _PinAuthState call({required String pin, required String error}) {
    return _PinAuthState(
      pin: pin,
      error: error,
    );
  }
}

/// @nodoc
const $PinAuthState = _$PinAuthStateTearOff();

/// @nodoc
mixin _$PinAuthState {
  String get pin => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PinAuthStateCopyWith<PinAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PinAuthStateCopyWith<$Res> {
  factory $PinAuthStateCopyWith(
          PinAuthState value, $Res Function(PinAuthState) then) =
      _$PinAuthStateCopyWithImpl<$Res>;
  $Res call({String pin, String error});
}

/// @nodoc
class _$PinAuthStateCopyWithImpl<$Res> implements $PinAuthStateCopyWith<$Res> {
  _$PinAuthStateCopyWithImpl(this._value, this._then);

  final PinAuthState _value;
  // ignore: unused_field
  final $Res Function(PinAuthState) _then;

  @override
  $Res call({
    Object? pin = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      pin: pin == freezed
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PinAuthStateCopyWith<$Res>
    implements $PinAuthStateCopyWith<$Res> {
  factory _$PinAuthStateCopyWith(
          _PinAuthState value, $Res Function(_PinAuthState) then) =
      __$PinAuthStateCopyWithImpl<$Res>;
  @override
  $Res call({String pin, String error});
}

/// @nodoc
class __$PinAuthStateCopyWithImpl<$Res> extends _$PinAuthStateCopyWithImpl<$Res>
    implements _$PinAuthStateCopyWith<$Res> {
  __$PinAuthStateCopyWithImpl(
      _PinAuthState _value, $Res Function(_PinAuthState) _then)
      : super(_value, (v) => _then(v as _PinAuthState));

  @override
  _PinAuthState get _value => super._value as _PinAuthState;

  @override
  $Res call({
    Object? pin = freezed,
    Object? error = freezed,
  }) {
    return _then(_PinAuthState(
      pin: pin == freezed
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PinAuthState implements _PinAuthState {
  _$_PinAuthState({required this.pin, required this.error});

  @override
  final String pin;
  @override
  final String error;

  @override
  String toString() {
    return 'PinAuthState(pin: $pin, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PinAuthState &&
            (identical(other.pin, pin) ||
                const DeepCollectionEquality().equals(other.pin, pin)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pin) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$PinAuthStateCopyWith<_PinAuthState> get copyWith =>
      __$PinAuthStateCopyWithImpl<_PinAuthState>(this, _$identity);
}

abstract class _PinAuthState implements PinAuthState {
  factory _PinAuthState({required String pin, required String error}) =
      _$_PinAuthState;

  @override
  String get pin => throw _privateConstructorUsedError;
  @override
  String get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PinAuthStateCopyWith<_PinAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
