import "package:freezed_annotation/freezed_annotation.dart";

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
abstract class Comment with _$Comment {
  // DBに保存する
  // createAtやIdが必要
  const factory Comment({
    required String postCommentId,
    required String comment,
    required String userName,
    required int likeCount,
    required int postCommentReplyCount,
    required String userImageURL,
    required String uid,
    required dynamic createdAt,
    required dynamic updatedAt,
  }) = _Comment;
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
