import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent.freezed.dart';
part 'agent.g.dart';

@freezed
class Agent with _$Agent {
  factory Agent({
    int? id,
    String? name,
    String? memo,
    String? url,
    DateTime? createdAt,
    DateTime? updatedAt
  }) = _Agent;

  factory Agent.fromJson(Map<String, dynamic> json) =>
      _$AgentFromJson(json);
}