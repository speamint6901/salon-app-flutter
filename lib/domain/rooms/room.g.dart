// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Room _$$_RoomFromJson(Map<String, dynamic> json) => _$_Room(
      roomId: json['roomId'] as String,
      lastMessage: json['lastMessage'] as String,
      lastSenderUid: json['lastSenderUid'] as String,
      joinedUsers: (json['joinedUsers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      usersQuery: Map<String, bool>.from(json['usersQuery'] as Map),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );

Map<String, dynamic> _$$_RoomToJson(_$_Room instance) => <String, dynamic>{
      'roomId': instance.roomId,
      'lastMessage': instance.lastMessage,
      'lastSenderUid': instance.lastSenderUid,
      'joinedUsers': instance.joinedUsers,
      'usersQuery': instance.usersQuery,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
