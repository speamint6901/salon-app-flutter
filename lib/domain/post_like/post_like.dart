import "package:freezed_annotation/freezed_annotation.dart";

part 'post_like.freezed.dart';
part 'post_like.g.dart';

@freezed
abstract class PostLike with _$PostLike {
  // DBに保存する
  // 自分が投稿にいいねした時の印
  const factory PostLike({
    required String activeUid,
    required dynamic createdAt,
    required String postCreatorUid,
    required dynamic postRef,
    required String postId,
  }) = _PostLike;
  factory PostLike.fromJson(Map<String, dynamic> json) =>
      _$PostLikeFromJson(json);
}
