import "package:freezed_annotation/freezed_annotation.dart";

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
abstract class Message with _$Message {
  // DBに保存する
  // createAtやIdが必要
  const factory Message({
    required String messageId,
    required String body,
    required String uid,
    required bool isRead,
    required dynamic createdAt,
    required dynamic updatedAt,
  }) = _Message;
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
