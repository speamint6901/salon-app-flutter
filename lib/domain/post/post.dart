import "package:freezed_annotation/freezed_annotation.dart";

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
abstract class Post with _$Post {
  // DBに保存する
  // createAtやIdが必要
  const factory Post({
    required String postId,
    required int likeCount,
    required String uid,
    required String text,
    required String imageURL,
    required List<String> hashTags,
    required String userName,
    required String userImageURL,
    required dynamic createdAt,
    required dynamic updatedAt,
  }) = _Post;
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
