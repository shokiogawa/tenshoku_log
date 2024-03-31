// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_date_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelectionDateModelImpl _$$SelectionDateModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectionDateModelImpl(
      id: json['id'] as int?,
      selectionCompanyId: json['selectionCompanyId'] as int?,
      selectionResultMasterId: json['selectionResultMasterId'] as int?,
      selectionStatusMasterId: json['selectionStatusMasterId'] as int?,
      selectionDate: json['selectionDate'] == null
          ? null
          : DateTime.parse(json['selectionDate'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SelectionDateModelImplToJson(
        _$SelectionDateModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'selectionCompanyId': instance.selectionCompanyId,
      'selectionResultMasterId': instance.selectionResultMasterId,
      'selectionStatusMasterId': instance.selectionStatusMasterId,
      'selectionDate': instance.selectionDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
