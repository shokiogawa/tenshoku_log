import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo.freezed.dart';
part 'memo.g.dart';

@freezed
class Memo with _$Memo {
  factory Memo({
    int? id,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt
  }) = _Memo;

  factory Memo.fromJson(Map<String, dynamic> json) =>
      _$MemoFromJson(json);
}