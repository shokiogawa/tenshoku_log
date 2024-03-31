import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_model.freezed.dart';
part 'agent_model.g.dart';

@freezed
class AgentModel with _$AgentModel {
  factory AgentModel({
    int? id,
    String? name,
    String? memo,
    String? url,
    DateTime? createdAt,
    DateTime? updatedAt
  }) = _AgentModel;

  factory AgentModel.fromJson(Map<String, dynamic> json) =>
      _$AgentModelFromJson(json);
}