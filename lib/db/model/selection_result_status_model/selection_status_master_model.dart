import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection_status_master_model.freezed.dart';
part 'selection_status_master_model.g.dart';

@freezed
class SelectionStatusMasterModel with _$SelectionStatusMasterModel {
  factory SelectionStatusMasterModel({
    int? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt
  }) = _SelectionStatusMasterModel;

  factory SelectionStatusMasterModel.fromJson(Map<String, dynamic> json) =>
      _$SelectionStatusMasterModelFromJson(json);
}