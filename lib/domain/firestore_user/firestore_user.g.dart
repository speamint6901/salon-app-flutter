// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirestoreUser _$$_FirestoreUserFromJson(Map<String, dynamic> json) =>
    _$_FirestoreUser(
      userName: json['userName'] as String,
      uid: json['uid'] as String,
      password: json['password'] as String,
      isAdmin: json['isAdmin'] as bool,
      followerCount: json['followerCount'] as int,
      followingCount: json['followingCount'] as int,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      userImageURL: json['userImageURL'] as String,
    );

Map<String, dynamic> _$$_FirestoreUserToJson(_$_FirestoreUser instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'uid': instance.uid,
      'password': instance.password,
      'isAdmin': instance.isAdmin,
      'followerCount': instance.followerCount,
      'followingCount': instance.followingCount,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'userImageURL': instance.userImageURL,
    };
