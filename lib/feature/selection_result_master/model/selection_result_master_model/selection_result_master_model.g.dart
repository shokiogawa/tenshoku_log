// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_result_master_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelectionResultMasterModelImpl _$$SelectionResultMasterModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectionResultMasterModelImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SelectionResultMasterModelImplToJson(
        _$SelectionResultMasterModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
