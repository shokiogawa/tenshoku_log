import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection_company.freezed.dart';
part 'selection_company.g.dart';

@freezed
class SelectionCompany with _$SelectionCompany {
  factory SelectionCompany({
    int? id,
    String? name,
    String? memo,
    String? url,
    DateTime? nextScheduledDate,
    int? agentId,
    int? selectionStatusMasterId,
    String? selectionStatusName,
    int? selectionResultMasterId,
    String? selectionResultName,
    int? orderNumber,
    DateTime? createdAt,
    DateTime? updatedAt
  }) = _SelectionCompany;

  factory SelectionCompany.fromJson(Map<String, dynamic> json) =>
      _$SelectionCompanyFromJson(json);
}