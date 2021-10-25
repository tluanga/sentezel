// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'pin_change_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PinChangeStateTearOff {
  const _$PinChangeStateTearOff();

  _PinChangeState call(
      {required String enteredPin,
      required String reEnteredPin,
      required String enteredPassPhrase,
      required String passPhrase,
      required List<PinChangeError> error}) {
    return _PinChangeState(
      enteredPin: enteredPin,
      reEnteredPin: reEnteredPin,
      enteredPassPhrase: enteredPassPhrase,
      passPhrase: passPhrase,
      error: error,
    );
  }
}

/// @nodoc
const $PinChangeState = _$PinChangeStateTearOff();

/// @nodoc
mixin _$PinChangeState {
  String get enteredPin => throw _privateConstructorUsedError;
  String get reEnteredPin => throw _privateConstructorUsedError;
  String get enteredPassPhrase => throw _privateConstructorUsedError;
  String get passPhrase => throw _privateConstructorUsedError;
  List<PinChangeError> get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PinChangeStateCopyWith<PinChangeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PinChangeStateCopyWith<$Res> {
  factory $PinChangeStateCopyWith(
          PinChangeState value, $Res Function(PinChangeState) then) =
      _$PinChangeStateCopyWithImpl<$Res>;
  $Res call(
      {String enteredPin,
      String reEnteredPin,
      String enteredPassPhrase,
      String passPhrase,
      List<PinChangeError> error});
}

/// @nodoc
class _$PinChangeStateCopyWithImpl<$Res>
    implements $PinChangeStateCopyWith<$Res> {
  _$PinChangeStateCopyWithImpl(this._value, this._then);

  final PinChangeState _value;
  // ignore: unused_field
  final $Res Function(PinChangeState) _then;

  @override
  $Res call({
    Object? enteredPin = freezed,
    Object? reEnteredPin = freezed,
    Object? enteredPassPhrase = freezed,
    Object? passPhrase = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      enteredPin: enteredPin == freezed
          ? _value.enteredPin
          : enteredPin // ignore: cast_nullable_to_non_nullable
              as String,
      reEnteredPin: reEnteredPin == freezed
          ? _value.reEnteredPin
          : reEnteredPin // ignore: cast_nullable_to_non_nullable
              as String,
      enteredPassPhrase: enteredPassPhrase == freezed
          ? _value.enteredPassPhrase
          : enteredPassPhrase // ignore: cast_nullable_to_non_nullable
              as String,
      passPhrase: passPhrase == freezed
          ? _value.passPhrase
          : passPhrase // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as List<PinChangeError>,
    ));
  }
}

/// @nodoc
abstract class _$PinChangeStateCopyWith<$Res>
    implements $PinChangeStateCopyWith<$Res> {
  factory _$PinChangeStateCopyWith(
          _PinChangeState value, $Res Function(_PinChangeState) then) =
      __$PinChangeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String enteredPin,
      String reEnteredPin,
      String enteredPassPhrase,
      String passPhrase,
      List<PinChangeError> error});
}

/// @nodoc
class __$PinChangeStateCopyWithImpl<$Res>
    extends _$PinChangeStateCopyWithImpl<$Res>
    implements _$PinChangeStateCopyWith<$Res> {
  __$PinChangeStateCopyWithImpl(
      _PinChangeState _value, $Res Function(_PinChangeState) _then)
      : super(_value, (v) => _then(v as _PinChangeState));

  @override
  _PinChangeState get _value => super._value as _PinChangeState;

  @override
  $Res call({
    Object? enteredPin = freezed,
    Object? reEnteredPin = freezed,
    Object? enteredPassPhrase = freezed,
    Object? passPhrase = freezed,
    Object? error = freezed,
  }) {
    return _then(_PinChangeState(
      enteredPin: enteredPin == freezed
          ? _value.enteredPin
          : enteredPin // ignore: cast_nullable_to_non_nullable
              as String,
      reEnteredPin: reEnteredPin == freezed
          ? _value.reEnteredPin
          : reEnteredPin // ignore: cast_nullable_to_non_nullable
              as String,
      enteredPassPhrase: enteredPassPhrase == freezed
          ? _value.enteredPassPhrase
          : enteredPassPhrase // ignore: cast_nullable_to_non_nullable
              as String,
      passPhrase: passPhrase == freezed
          ? _value.passPhrase
          : passPhrase // ignore: cast_nullable_to_non_nullable
              as String,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as List<PinChangeError>,
    ));
  }
}

/// @nodoc

class _$_PinChangeState implements _PinChangeState {
  _$_PinChangeState(
      {required this.enteredPin,
      required this.reEnteredPin,
      required this.enteredPassPhrase,
      required this.passPhrase,
      required this.error});

  @override
  final String enteredPin;
  @override
  final String reEnteredPin;
  @override
  final String enteredPassPhrase;
  @override
  final String passPhrase;
  @override
  final List<PinChangeError> error;

  @override
  String toString() {
    return 'PinChangeState(enteredPin: $enteredPin, reEnteredPin: $reEnteredPin, enteredPassPhrase: $enteredPassPhrase, passPhrase: $passPhrase, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PinChangeState &&
            (identical(other.enteredPin, enteredPin) ||
                const DeepCollectionEquality()
                    .equals(other.enteredPin, enteredPin)) &&
            (identical(other.reEnteredPin, reEnteredPin) ||
                const DeepCollectionEquality()
                    .equals(other.reEnteredPin, reEnteredPin)) &&
            (identical(other.enteredPassPhrase, enteredPassPhrase) ||
                const DeepCollectionEquality()
                    .equals(other.enteredPassPhrase, enteredPassPhrase)) &&
            (identical(other.passPhrase, passPhrase) ||
                const DeepCollectionEquality()
                    .equals(other.passPhrase, passPhrase)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(enteredPin) ^
      const DeepCollectionEquality().hash(reEnteredPin) ^
      const DeepCollectionEquality().hash(enteredPassPhrase) ^
      const DeepCollectionEquality().hash(passPhrase) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$PinChangeStateCopyWith<_PinChangeState> get copyWith =>
      __$PinChangeStateCopyWithImpl<_PinChangeState>(this, _$identity);
}

abstract class _PinChangeState implements PinChangeState {
  factory _PinChangeState(
      {required String enteredPin,
      required String reEnteredPin,
      required String enteredPassPhrase,
      required String passPhrase,
      required List<PinChangeError> error}) = _$_PinChangeState;

  @override
  String get enteredPin => throw _privateConstructorUsedError;
  @override
  String get reEnteredPin => throw _privateConstructorUsedError;
  @override
  String get enteredPassPhrase => throw _privateConstructorUsedError;
  @override
  String get passPhrase => throw _privateConstructorUsedError;
  @override
  List<PinChangeError> get error => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PinChangeStateCopyWith<_PinChangeState> get copyWith =>
      throw _privateConstructorUsedError;
}
