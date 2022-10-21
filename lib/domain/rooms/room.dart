import "package:freezed_annotation/freezed_annotation.dart";

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
abstract class Room with _$Room {
  // DBに保存する
  // createAtやIdが必要
  const factory Room({
    required String roomId,
    required int likeCount,
    required String uid,
    required String text,
    required String imageURL,
    required List<String> hashTags,
    required dynamic createdAt,
    required dynamic updatedAt,
  }) = _Room;
  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
