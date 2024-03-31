import 'package:freezed_annotation/freezed_annotation.dart';

part 'selection_status_master.freezed.dart';
part 'selection_status_master.g.dart';

@freezed
class SelectionStatusMaster with _$SelectionStatusMaster {
  factory SelectionStatusMaster({
    int? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt
  }) = _SelectionStatusMaster;

  factory SelectionStatusMaster.fromJson(Map<String, dynamic> json) =>
      _$SelectionStatusMasterFromJson(json);
}