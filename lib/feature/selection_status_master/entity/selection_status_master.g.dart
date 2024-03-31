// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_status_master.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelectionStatusMasterImpl _$$SelectionStatusMasterImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectionStatusMasterImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SelectionStatusMasterImplToJson(
        _$SelectionStatusMasterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
