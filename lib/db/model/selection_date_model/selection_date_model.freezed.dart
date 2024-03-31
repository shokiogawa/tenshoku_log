// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selection_date_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SelectionDateModel _$SelectionDateModelFromJson(Map<String, dynamic> json) {
  return _SelectionDateModel.fromJson(json);
}

/// @nodoc
mixin _$SelectionDateModel {
  int? get id => throw _privateConstructorUsedError;
  int? get selectionCompanyId => throw _privateConstructorUsedError;
  int? get selectionResultMasterId => throw _privateConstructorUsedError;
  int? get selectionStatusMasterId => throw _privateConstructorUsedError;
  DateTime? get selectionDate => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelectionDateModelCopyWith<SelectionDateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectionDateModelCopyWith<$Res> {
  factory $SelectionDateModelCopyWith(
          SelectionDateModel value, $Res Function(SelectionDateModel) then) =
      _$SelectionDateModelCopyWithImpl<$Res, SelectionDateModel>;
  @useResult
  $Res call(
      {int? id,
      int? selectionCompanyId,
      int? selectionResultMasterId,
      int? selectionStatusMasterId,
      DateTime? selectionDate,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$SelectionDateModelCopyWithImpl<$Res, $Val extends SelectionDateModel>
    implements $SelectionDateModelCopyWith<$Res> {
  _$SelectionDateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? selectionCompanyId = freezed,
    Object? selectionResultMasterId = freezed,
    Object? selectionStatusMasterId = freezed,
    Object? selectionDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      selectionCompanyId: freezed == selectionCompanyId
          ? _value.selectionCompanyId
          : selectionCompanyId // ignore: cast_nullable_to_non_nullable
              as int?,
      selectionResultMasterId: freezed == selectionResultMasterId
          ? _value.selectionResultMasterId
          : selectionResultMasterId // ignore: cast_nullable_to_non_nullable
              as int?,
      selectionStatusMasterId: freezed == selectionStatusMasterId
          ? _value.selectionStatusMasterId
          : selectionStatusMasterId // ignore: cast_nullable_to_non_nullable
              as int?,
      selectionDate: freezed == selectionDate
          ? _value.selectionDate
          : selectionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$SelectionDateModelImplCopyWith<$Res>
    implements $SelectionDateModelCopyWith<$Res> {
  factory _$$SelectionDateModelImplCopyWith(_$SelectionDateModelImpl value,
          $Res Function(_$SelectionDateModelImpl) then) =
      __$$SelectionDateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? selectionCompanyId,
      int? selectionResultMasterId,
      int? selectionStatusMasterId,
      DateTime? selectionDate,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$SelectionDateModelImplCopyWithImpl<$Res>
    extends _$SelectionDateModelCopyWithImpl<$Res, _$SelectionDateModelImpl>
    implements _$$SelectionDateModelImplCopyWith<$Res> {
  __$$SelectionDateModelImplCopyWithImpl(_$SelectionDateModelImpl _value,
      $Res Function(_$SelectionDateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? selectionCompanyId = freezed,
    Object? selectionResultMasterId = freezed,
    Object? selectionStatusMasterId = freezed,
    Object? selectionDate = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$SelectionDateModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      selectionCompanyId: freezed == selectionCompanyId
          ? _value.selectionCompanyId
          : selectionCompanyId // ignore: cast_nullable_to_non_nullable
              as int?,
      selectionResultMasterId: freezed == selectionResultMasterId
          ? _value.selectionResultMasterId
          : selectionResultMasterId // ignore: cast_nullable_to_non_nullable
              as int?,
      selectionStatusMasterId: freezed == selectionStatusMasterId
          ? _value.selectionStatusMasterId
          : selectionStatusMasterId // ignore: cast_nullable_to_non_nullable
              as int?,
      selectionDate: freezed == selectionDate
          ? _value.selectionDate
          : selectionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$SelectionDateModelImpl implements _SelectionDateModel {
  _$SelectionDateModelImpl(
      {this.id,
      this.selectionCompanyId,
      this.selectionResultMasterId,
      this.selectionStatusMasterId,
      this.selectionDate,
      this.createdAt,
      this.updatedAt});

  factory _$SelectionDateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelectionDateModelImplFromJson(json);

  @override
  final int? id;
  @override
  final int? selectionCompanyId;
  @override
  final int? selectionResultMasterId;
  @override
  final int? selectionStatusMasterId;
  @override
  final DateTime? selectionDate;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'SelectionDateModel(id: $id, selectionCompanyId: $selectionCompanyId, selectionResultMasterId: $selectionResultMasterId, selectionStatusMasterId: $selectionStatusMasterId, selectionDate: $selectionDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectionDateModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.selectionCompanyId, selectionCompanyId) ||
                other.selectionCompanyId == selectionCompanyId) &&
            (identical(
                    other.selectionResultMasterId, selectionResultMasterId) ||
                other.selectionResultMasterId == selectionResultMasterId) &&
            (identical(
                    other.selectionStatusMasterId, selectionStatusMasterId) ||
                other.selectionStatusMasterId == selectionStatusMasterId) &&
            (identical(other.selectionDate, selectionDate) ||
                other.selectionDate == selectionDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      selectionCompanyId,
      selectionResultMasterId,
      selectionStatusMasterId,
      selectionDate,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectionDateModelImplCopyWith<_$SelectionDateModelImpl> get copyWith =>
      __$$SelectionDateModelImplCopyWithImpl<_$SelectionDateModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelectionDateModelImplToJson(
      this,
    );
  }
}

abstract class _SelectionDateModel implements SelectionDateModel {
  factory _SelectionDateModel(
      {final int? id,
      final int? selectionCompanyId,
      final int? selectionResultMasterId,
      final int? selectionStatusMasterId,
      final DateTime? selectionDate,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$SelectionDateModelImpl;

  factory _SelectionDateModel.fromJson(Map<String, dynamic> json) =
      _$SelectionDateModelImpl.fromJson;

  @override
  int? get id;
  @override
  int? get selectionCompanyId;
  @override
  int? get selectionResultMasterId;
  @override
  int? get selectionStatusMasterId;
  @override
  DateTime? get selectionDate;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$SelectionDateModelImplCopyWith<_$SelectionDateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
