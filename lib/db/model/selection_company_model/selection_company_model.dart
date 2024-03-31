import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection_company_model.freezed.dart';
part 'selection_company_model.g.dart';

@freezed
class SelectionCompanyModel with _$SelectionCompanyModel {
  factory SelectionCompanyModel({
    int? id,
    String? name,
    String? memo,
    String? url,
    DateTime? nextScheduledDate,
    int? agentId,
    int? selectionStatusMasterId,
    int? selectionResultMasterId,
    DateTime? createdAt,
    DateTime? updatedAt
  }) = _SelectionCompanyModel;


  factory SelectionCompanyModel.fromJson(Map<String, dynamic> json) =>
      _$SelectionCompanyModelFromJson(json);
}