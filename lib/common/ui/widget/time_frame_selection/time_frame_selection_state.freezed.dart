// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'time_frame_selection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimeFrameSelectionStateTearOff {
  const _$TimeFrameSelectionStateTearOff();

  _TimeFrameSelectionState call(
      {dynamic mode = TimeFrameSelectionMode.days,
      required DateTime startDate,
      required DateTime endDate}) {
    return _TimeFrameSelectionState(
      mode: mode,
      startDate: startDate,
      endDate: endDate,
    );
  }
}

/// @nodoc
const $TimeFrameSelectionState = _$TimeFrameSelectionStateTearOff();

/// @nodoc
mixin _$TimeFrameSelectionState {
  dynamic get mode => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimeFrameSelectionStateCopyWith<TimeFrameSelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeFrameSelectionStateCopyWith<$Res> {
  factory $TimeFrameSelectionStateCopyWith(TimeFrameSelectionState value,
          $Res Function(TimeFrameSelectionState) then) =
      _$TimeFrameSelectionStateCopyWithImpl<$Res>;
  $Res call({dynamic mode, DateTime startDate, DateTime endDate});
}

/// @nodoc
class _$TimeFrameSelectionStateCopyWithImpl<$Res>
    implements $TimeFrameSelectionStateCopyWith<$Res> {
  _$TimeFrameSelectionStateCopyWithImpl(this._value, this._then);

  final TimeFrameSelectionState _value;
  // ignore: unused_field
  final $Res Function(TimeFrameSelectionState) _then;

  @override
  $Res call({
    Object? mode = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$TimeFrameSelectionStateCopyWith<$Res>
    implements $TimeFrameSelectionStateCopyWith<$Res> {
  factory _$TimeFrameSelectionStateCopyWith(_TimeFrameSelectionState value,
          $Res Function(_TimeFrameSelectionState) then) =
      __$TimeFrameSelectionStateCopyWithImpl<$Res>;
  @override
  $Res call({dynamic mode, DateTime startDate, DateTime endDate});
}

/// @nodoc
class __$TimeFrameSelectionStateCopyWithImpl<$Res>
    extends _$TimeFrameSelectionStateCopyWithImpl<$Res>
    implements _$TimeFrameSelectionStateCopyWith<$Res> {
  __$TimeFrameSelectionStateCopyWithImpl(_TimeFrameSelectionState _value,
      $Res Function(_TimeFrameSelectionState) _then)
      : super(_value, (v) => _then(v as _TimeFrameSelectionState));

  @override
  _TimeFrameSelectionState get _value =>
      super._value as _TimeFrameSelectionState;

  @override
  $Res call({
    Object? mode = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_TimeFrameSelectionState(
      mode: mode == freezed ? _value.mode : mode,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_TimeFrameSelectionState implements _TimeFrameSelectionState {
  _$_TimeFrameSelectionState(
      {this.mode = TimeFrameSelectionMode.days,
      required this.startDate,
      required this.endDate});

  @JsonKey(defaultValue: TimeFrameSelectionMode.days)
  @override
  final dynamic mode;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'TimeFrameSelectionState(mode: $mode, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TimeFrameSelectionState &&
            (identical(other.mode, mode) ||
                const DeepCollectionEquality().equals(other.mode, mode)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality().equals(other.endDate, endDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(mode) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate);

  @JsonKey(ignore: true)
  @override
  _$TimeFrameSelectionStateCopyWith<_TimeFrameSelectionState> get copyWith =>
      __$TimeFrameSelectionStateCopyWithImpl<_TimeFrameSelectionState>(
          this, _$identity);
}

abstract class _TimeFrameSelectionState implements TimeFrameSelectionState {
  factory _TimeFrameSelectionState(
      {dynamic mode,
      required DateTime startDate,
      required DateTime endDate}) = _$_TimeFrameSelectionState;

  @override
  dynamic get mode => throw _privateConstructorUsedError;
  @override
  DateTime get startDate => throw _privateConstructorUsedError;
  @override
  DateTime get endDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TimeFrameSelectionStateCopyWith<_TimeFrameSelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}
