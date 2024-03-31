// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelectionCompanyModelImpl _$$SelectionCompanyModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectionCompanyModelImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      memo: json['memo'] as String?,
      url: json['url'] as String?,
      nextScheduledDate: json['nextScheduledDate'] == null
          ? null
          : DateTime.parse(json['nextScheduledDate'] as String),
      agentId: json['agentId'] as int?,
      selectionStatusMasterId: json['selectionStatusMasterId'] as int?,
      selectionResultMasterId: json['selectionResultMasterId'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SelectionCompanyModelImplToJson(
        _$SelectionCompanyModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'memo': instance.memo,
      'url': instance.url,
      'nextScheduledDate': instance.nextScheduledDate?.toIso8601String(),
      'agentId': instance.agentId,
      'selectionStatusMasterId': instance.selectionStatusMasterId,
      'selectionResultMasterId': instance.selectionResultMasterId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
