// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_result_master.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelectionResultMasterImpl _$$SelectionResultMasterImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectionResultMasterImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SelectionResultMasterImplToJson(
        _$SelectionResultMasterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
