import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection_result_master.freezed.dart';
part 'selection_result_master.g.dart';

@freezed
class SelectionResultMaster with _$SelectionResultMaster {
  factory SelectionResultMaster({
    int? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt
  }) = _SelectionResultMaster;

  factory SelectionResultMaster.fromJson(Map<String, dynamic> json) =>
      _$SelectionResultMasterFromJson(json);
}