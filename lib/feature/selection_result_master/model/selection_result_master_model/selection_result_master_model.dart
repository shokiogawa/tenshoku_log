import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection_result_master_model.freezed.dart';
part 'selection_result_master_model.g.dart';

@freezed
class SelectionResultMasterModel with _$SelectionResultMasterModel {
  factory SelectionResultMasterModel({
    int? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt
  }) = _SelectionResultMasterModel;

  factory SelectionResultMasterModel.fromJson(Map<String, dynamic> json) =>
      _$SelectionResultMasterModelFromJson(json);
}