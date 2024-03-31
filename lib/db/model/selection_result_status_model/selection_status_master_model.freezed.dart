// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selection_status_master_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SelectionStatusMasterModel _$SelectionStatusMasterModelFromJson(
    Map<String, dynamic> json) {
  return _SelectionStatusMasterModel.fromJson(json);
}

/// @nodoc
mixin _$SelectionStatusMasterModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectionStatusMasterModelCopyWith<SelectionStatusMasterModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectionStatusMasterModelCopyWith<$Res> {
  factory $SelectionStatusMasterModelCopyWith(SelectionStatusMasterModel value,
          $Res Function(SelectionStatusMasterModel) then) =
      _$SelectionStatusMasterModelCopyWithImpl<$Res,
          SelectionStatusMasterModel>;
  @useResult
  $Res call({int? id, String? name, DateTime? createdAt, DateTime? updatedAt});
}

/// @nodoc
class _$SelectionStatusMasterModelCopyWithImpl<$Res,
        $Val extends SelectionStatusMasterModel>
    implements $SelectionStatusMasterModelCopyWith<$Res> {
  _$SelectionStatusMasterModelCopyWithImpl(this._value, this._then);

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
abstract class _$$SelectionStatusMasterModelImplCopyWith<$Res>
    implements $SelectionStatusMasterModelCopyWith<$Res> {
  factory _$$SelectionStatusMasterModelImplCopyWith(
          _$SelectionStatusMasterModelImpl value,
          $Res Function(_$SelectionStatusMasterModelImpl) then) =
      __$$SelectionStatusMasterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, DateTime? createdAt, DateTime? updatedAt});
}

/// @nodoc
class __$$SelectionStatusMasterModelImplCopyWithImpl<$Res>
    extends _$SelectionStatusMasterModelCopyWithImpl<$Res,
        _$SelectionStatusMasterModelImpl>
    implements _$$SelectionStatusMasterModelImplCopyWith<$Res> {
  __$$SelectionStatusMasterModelImplCopyWithImpl(
      _$SelectionStatusMasterModelImpl _value,
      $Res Function(_$SelectionStatusMasterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$SelectionStatusMasterModelImpl(
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
class _$SelectionStatusMasterModelImpl implements _SelectionStatusMasterModel {
  _$SelectionStatusMasterModelImpl(
      {this.id, this.name, this.createdAt, this.updatedAt});

  factory _$SelectionStatusMasterModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SelectionStatusMasterModelImplFromJson(json);

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
    return 'SelectionStatusMasterModel(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectionStatusMasterModelImpl &&
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
  _$$SelectionStatusMasterModelImplCopyWith<_$SelectionStatusMasterModelImpl>
      get copyWith => __$$SelectionStatusMasterModelImplCopyWithImpl<
          _$SelectionStatusMasterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectionStatusMasterModelImplToJson(
      this,
    );
  }
}

abstract class _SelectionStatusMasterModel
    implements SelectionStatusMasterModel {
  factory _SelectionStatusMasterModel(
      {final int? id,
      final String? name,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$SelectionStatusMasterModelImpl;

  factory _SelectionStatusMasterModel.fromJson(Map<String, dynamic> json) =
      _$SelectionStatusMasterModelImpl.fromJson;

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
  _$$SelectionStatusMasterModelImplCopyWith<_$SelectionStatusMasterModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
