import "package:freezed_annotation/freezed_annotation.dart";

part 'follower.freezed.dart';
part 'follower.g.dart';

@freezed
abstract class Follower with _$Follower {
  // DBに保存する
  // createAtやIdが必要
  // 自分がフォローした時の印コレクション
  const factory Follower({
    required String followedUid,
    required String followerUid,
    required dynamic createdAt,
  }) = _Follower;
  factory Follower.fromJson(Map<String, dynamic> json) =>
      _$FollowerFromJson(json);
}
