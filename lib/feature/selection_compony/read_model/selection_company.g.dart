// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SelectionCompanyImpl _$$SelectionCompanyImplFromJson(
        Map<String, dynamic> json) =>
    _$SelectionCompanyImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      memo: json['memo'] as String?,
      url: json['url'] as String?,
      nextScheduledDate: json['nextScheduledDate'] == null
          ? null
          : DateTime.parse(json['nextScheduledDate'] as String),
      agentId: json['agentId'] as int?,
      selectionStatusMasterId: json['selectionStatusMasterId'] as int?,
      selectionStatusName: json['selectionStatusName'] as String?,
      selectionResultMasterId: json['selectionResultMasterId'] as int?,
      selectionResultName: json['selectionResultName'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SelectionCompanyImplToJson(
        _$SelectionCompanyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'memo': instance.memo,
      'url': instance.url,
      'nextScheduledDate': instance.nextScheduledDate?.toIso8601String(),
      'agentId': instance.agentId,
      'selectionStatusMasterId': instance.selectionStatusMasterId,
      'selectionStatusName': instance.selectionStatusName,
      'selectionResultMasterId': instance.selectionResultMasterId,
      'selectionResultName': instance.selectionResultName,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
