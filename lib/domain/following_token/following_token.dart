import "package:freezed_annotation/freezed_annotation.dart";

part 'following_token.freezed.dart';
part 'following_token.g.dart';

@freezed
abstract class FollowingToken with _$FollowingToken {
  // DBに保存する
  // createAtやIdが必要
  // 自分がフォローした時の印コレクション
  const factory FollowingToken({
    required String tokenId,
    required String passiveUid,
    required dynamic createdAt,
  }) = _FollowingToken;
  factory FollowingToken.fromJson(Map<String, dynamic> json) =>
      _$FollowingTokenFromJson(json);
}
