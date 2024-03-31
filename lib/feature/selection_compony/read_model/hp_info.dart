import 'package:freezed_annotation/freezed_annotation.dart';

part 'hp_info.freezed.dart';
part 'hp_info.g.dart';

@freezed
class HpInfo with _$HpInfo {
  factory HpInfo({
    String? imageUrl,
    String? hpTitle
  }) = _HpInfo;

  factory HpInfo.fromJson(Map<String, dynamic> json) =>
      _$HpInfoFromJson(json);
}