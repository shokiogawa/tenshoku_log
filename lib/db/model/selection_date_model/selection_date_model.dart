import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection_date_model.freezed.dart';
part 'selection_date_model.g.dart';

@freezed
class SelectionDateModel with _$SelectionDateModel {
  factory SelectionDateModel({
    int? id,
    int? selectionCompanyId,
    int? selectionResultMasterId,
    int? selectionStatusMasterId,
    DateTime? selectionDate,
    DateTime? createdAt,
    DateTime? updatedAt
  }) = _SelectionDateModel;

  factory SelectionDateModel.fromJson(Map<String, dynamic> json) =>
      _$SelectionDateModelFromJson(json);
}