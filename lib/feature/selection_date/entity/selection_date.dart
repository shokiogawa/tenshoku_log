import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection_date.freezed.dart';
part 'selection_date.g.dart';

@freezed
class SelectionDate with _$SelectionDate {
  factory SelectionDate({
    int? id,
    int? selectionCompanyId,
    int? selectionResultMasterId,
    int? selectionStatusMasterId,
    DateTime? selectionDate,
    DateTime? createdAt,
    DateTime? updatedAt
  }) = _SelectionDate;

  factory SelectionDate.fromJson(Map<String, dynamic> json) =>
      _$SelectionDateFromJson(json);
}