// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'transactionCategory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionCategory _$TransactionCategoryFromJson(Map<String, dynamic> json) {
  return _TransactionCategory.fromJson(json);
}

/// @nodoc
class _$TransactionCategoryTearOff {
  const _$TransactionCategoryTearOff();

  _TransactionCategory call(
      {int? id,
      required String name,
      required String description,
      required TransactionType transactionType,
      int? debitSideLedger,
      int? creditSideLedger,
      Status status = Status.active}) {
    return _TransactionCategory(
      id: id,
      name: name,
      description: description,
      transactionType: transactionType,
      debitSideLedger: debitSideLedger,
      creditSideLedger: creditSideLedger,
      status: status,
    );
  }

  TransactionCategory fromJson(Map<String, Object> json) {
    return TransactionCategory.fromJson(json);
  }
}

/// @nodoc
const $TransactionCategory = _$TransactionCategoryTearOff();

/// @nodoc
mixin _$TransactionCategory {
  int? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  TransactionType get transactionType =>
      throw _privateConstructorUsedError; // 0--for buy 1-- sell
  int? get debitSideLedger => throw _privateConstructorUsedError;
  int? get creditSideLedger => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCategoryCopyWith<TransactionCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCategoryCopyWith<$Res> {
  factory $TransactionCategoryCopyWith(
          TransactionCategory value, $Res Function(TransactionCategory) then) =
      _$TransactionCategoryCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String name,
      String description,
      TransactionType transactionType,
      int? debitSideLedger,
      int? creditSideLedger,
      Status status});
}

/// @nodoc
class _$TransactionCategoryCopyWithImpl<$Res>
    implements $TransactionCategoryCopyWith<$Res> {
  _$TransactionCategoryCopyWithImpl(this._value, this._then);

  final TransactionCategory _value;
  // ignore: unused_field
  final $Res Function(TransactionCategory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? transactionType = freezed,
    Object? debitSideLedger = freezed,
    Object? creditSideLedger = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: transactionType == freezed
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      debitSideLedger: debitSideLedger == freezed
          ? _value.debitSideLedger
          : debitSideLedger // ignore: cast_nullable_to_non_nullable
              as int?,
      creditSideLedger: creditSideLedger == freezed
          ? _value.creditSideLedger
          : creditSideLedger // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc
abstract class _$TransactionCategoryCopyWith<$Res>
    implements $TransactionCategoryCopyWith<$Res> {
  factory _$TransactionCategoryCopyWith(_TransactionCategory value,
          $Res Function(_TransactionCategory) then) =
      __$TransactionCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String name,
      String description,
      TransactionType transactionType,
      int? debitSideLedger,
      int? creditSideLedger,
      Status status});
}

/// @nodoc
class __$TransactionCategoryCopyWithImpl<$Res>
    extends _$TransactionCategoryCopyWithImpl<$Res>
    implements _$TransactionCategoryCopyWith<$Res> {
  __$TransactionCategoryCopyWithImpl(
      _TransactionCategory _value, $Res Function(_TransactionCategory) _then)
      : super(_value, (v) => _then(v as _TransactionCategory));

  @override
  _TransactionCategory get _value => super._value as _TransactionCategory;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? transactionType = freezed,
    Object? debitSideLedger = freezed,
    Object? creditSideLedger = freezed,
    Object? status = freezed,
  }) {
    return _then(_TransactionCategory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: transactionType == freezed
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      debitSideLedger: debitSideLedger == freezed
          ? _value.debitSideLedger
          : debitSideLedger // ignore: cast_nullable_to_non_nullable
              as int?,
      creditSideLedger: creditSideLedger == freezed
          ? _value.creditSideLedger
          : creditSideLedger // ignore: cast_nullable_to_non_nullable
              as int?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionCategory implements _TransactionCategory {
  _$_TransactionCategory(
      {this.id,
      required this.name,
      required this.description,
      required this.transactionType,
      this.debitSideLedger,
      this.creditSideLedger,
      this.status = Status.active});

  factory _$_TransactionCategory.fromJson(Map<String, dynamic> json) =>
      _$_$_TransactionCategoryFromJson(json);

  @override
  final int? id;
  @override
  final String name;
  @override
  final String description;
  @override
  final TransactionType transactionType;
  @override // 0--for buy 1-- sell
  final int? debitSideLedger;
  @override
  final int? creditSideLedger;
  @JsonKey(defaultValue: Status.active)
  @override
  final Status status;

  @override
  String toString() {
    return 'TransactionCategory(id: $id, name: $name, description: $description, transactionType: $transactionType, debitSideLedger: $debitSideLedger, creditSideLedger: $creditSideLedger, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionCategory &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.transactionType, transactionType) ||
                const DeepCollectionEquality()
                    .equals(other.transactionType, transactionType)) &&
            (identical(other.debitSideLedger, debitSideLedger) ||
                const DeepCollectionEquality()
                    .equals(other.debitSideLedger, debitSideLedger)) &&
            (identical(other.creditSideLedger, creditSideLedger) ||
                const DeepCollectionEquality()
                    .equals(other.creditSideLedger, creditSideLedger)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(transactionType) ^
      const DeepCollectionEquality().hash(debitSideLedger) ^
      const DeepCollectionEquality().hash(creditSideLedger) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$TransactionCategoryCopyWith<_TransactionCategory> get copyWith =>
      __$TransactionCategoryCopyWithImpl<_TransactionCategory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TransactionCategoryToJson(this);
  }
}

abstract class _TransactionCategory implements TransactionCategory {
  factory _TransactionCategory(
      {int? id,
      required String name,
      required String description,
      required TransactionType transactionType,
      int? debitSideLedger,
      int? creditSideLedger,
      Status status}) = _$_TransactionCategory;

  factory _TransactionCategory.fromJson(Map<String, dynamic> json) =
      _$_TransactionCategory.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  TransactionType get transactionType => throw _privateConstructorUsedError;
  @override // 0--for buy 1-- sell
  int? get debitSideLedger => throw _privateConstructorUsedError;
  @override
  int? get creditSideLedger => throw _privateConstructorUsedError;
  @override
  Status get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TransactionCategoryCopyWith<_TransactionCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
