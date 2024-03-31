// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selection_status_master.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SelectionStatusMaster _$SelectionStatusMasterFromJson(
    Map<String, dynamic> json) {
  return _SelectionStatusMaster.fromJson(json);
}

/// @nodoc
mixin _$SelectionStatusMaster {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectionStatusMasterCopyWith<SelectionStatusMaster> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectionStatusMasterCopyWith<$Res> {
  factory $SelectionStatusMasterCopyWith(SelectionStatusMaster value,
          $Res Function(SelectionStatusMaster) then) =
      _$SelectionStatusMasterCopyWithImpl<$Res, SelectionStatusMaster>;
  @useResult
  $Res call({int? id, String? name, DateTime? createdAt, DateTime? updatedAt});
}

/// @nodoc
class _$SelectionStatusMasterCopyWithImpl<$Res,
        $Val extends SelectionStatusMaster>
    implements $SelectionStatusMasterCopyWith<$Res> {
  _$SelectionStatusMasterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectionStatusMasterImplCopyWith<$Res>
    implements $SelectionStatusMasterCopyWith<$Res> {
  factory _$$SelectionStatusMasterImplCopyWith(
          _$SelectionStatusMasterImpl value,
          $Res Function(_$SelectionStatusMasterImpl) then) =
      __$$SelectionStatusMasterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, DateTime? createdAt, DateTime? updatedAt});
}

/// @nodoc
class __$$SelectionStatusMasterImplCopyWithImpl<$Res>
    extends _$SelectionStatusMasterCopyWithImpl<$Res,
        _$SelectionStatusMasterImpl>
    implements _$$SelectionStatusMasterImplCopyWith<$Res> {
  __$$SelectionStatusMasterImplCopyWithImpl(_$SelectionStatusMasterImpl _value,
      $Res Function(_$SelectionStatusMasterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$SelectionStatusMasterImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelectionStatusMasterImpl implements _SelectionStatusMaster {
  _$SelectionStatusMasterImpl(
      {this.id, this.name, this.createdAt, this.updatedAt});

  factory _$SelectionStatusMasterImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectionStatusMasterImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'SelectionStatusMaster(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectionStatusMasterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectionStatusMasterImplCopyWith<_$SelectionStatusMasterImpl>
      get copyWith => __$$SelectionStatusMasterImplCopyWithImpl<
          _$SelectionStatusMasterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectionStatusMasterImplToJson(
      this,
    );
  }
}

abstract class _SelectionStatusMaster implements SelectionStatusMaster {
  factory _SelectionStatusMaster(
      {final int? id,
      final String? name,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$SelectionStatusMasterImpl;

  factory _SelectionStatusMaster.fromJson(Map<String, dynamic> json) =
      _$SelectionStatusMasterImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$SelectionStatusMasterImplCopyWith<_$SelectionStatusMasterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
