// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FollowingToken _$$_FollowingTokenFromJson(Map<String, dynamic> json) =>
    _$_FollowingToken(
      tokenId: json['tokenId'] as String,
      passiveUid: json['passiveUid'] as String,
      createdAt: json['createdAt'],
      tokenType: json['tokenType'] as String,
    );

Map<String, dynamic> _$$_FollowingTokenToJson(_$_FollowingToken instance) =>
    <String, dynamic>{
      'tokenId': instance.tokenId,
      'passiveUid': instance.passiveUid,
      'createdAt': instance.createdAt,
      'tokenType': instance.tokenType,
    };
