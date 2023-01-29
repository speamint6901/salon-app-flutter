import "package:freezed_annotation/freezed_annotation.dart";

part 'memo.freezed.dart';
part 'memo.g.dart';

@freezed
abstract class Memo with _$Memo {
  // DBに保存する
  // createAtやIdが必要
  const factory Memo({
    required String title,
    required String detail,
    required dynamic createdAt,
    dynamic? user,
    dynamic? updatedAt,
  }) = _Memo;
  factory Memo.fromJson(Map<String, dynamic> json) => _$MemoFromJson(json);
}
