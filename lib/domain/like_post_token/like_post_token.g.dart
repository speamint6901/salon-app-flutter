// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_post_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LikePostToken _$$_LikePostTokenFromJson(Map<String, dynamic> json) =>
    _$_LikePostToken(
      tokenId: json['tokenId'] as String,
      activeUid: json['activeUid'] as String,
      passiveUid: json['passiveUid'] as String,
      postRef: json['postRef'],
      postId: json['postId'] as String,
      createdAt: json['createdAt'],
      tokenType: json['tokenType'] as String,
    );

Map<String, dynamic> _$$_LikePostTokenToJson(_$_LikePostToken instance) =>
    <String, dynamic>{
      'tokenId': instance.tokenId,
      'activeUid': instance.activeUid,
      'passiveUid': instance.passiveUid,
      'postRef': instance.postRef,
      'postId': instance.postId,
      'createdAt': instance.createdAt,
      'tokenType': instance.tokenType,
    };
