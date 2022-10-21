import "package:freezed_annotation/freezed_annotation.dart";

part 'like_post_token.freezed.dart';
part 'like_post_token.g.dart';

@freezed
abstract class LikePostToken with _$LikePostToken {
  // DBに保存する
  // 自分が投稿にいいねした時の印
  const factory LikePostToken({
    required String tokenId,
    required String activeUid,
    required String passiveUid,
    required dynamic postRef,
    required String postId,
    required dynamic createdAt,
  }) = _LikePostToken;
  factory LikePostToken.fromJson(Map<String, dynamic> json) =>
      _$LikePostTokenFromJson(json);
}
