import "package:freezed_annotation/freezed_annotation.dart";

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
abstract class Room with _$Room {
  // DBに保存する
  // createAtやIdが必要
  const factory Room({
    required String roomId,
    required String lastMessage, // 最後のメッセージ
    required String lastSenderUid, // 最後に送ったユーザーID
    required List<String> joinedUsers, // ルームに所属するユーザーリスト1:1
    required Map<String, bool> usersQuery, //　ルームが存在するかチェックするフィールド
    required dynamic createdAt,
    dynamic? updatedAt,
  }) = _Room;
  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
