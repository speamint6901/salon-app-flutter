// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      postCommentId: json['postCommentId'] as String,
      comment: json['comment'] as String,
      userName: json['userName'] as String,
      likeCount: json['likeCount'] as int,
      postCommentReplyCount: json['postCommentReplyCount'] as int,
      userImageURL: json['userImageURL'] as String,
      uid: json['uid'] as String,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'postCommentId': instance.postCommentId,
      'comment': instance.comment,
      'userName': instance.userName,
      'likeCount': instance.likeCount,
      'postCommentReplyCount': instance.postCommentReplyCount,
      'userImageURL': instance.userImageURL,
      'uid': instance.uid,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
