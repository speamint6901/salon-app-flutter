// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Memo _$$_MemoFromJson(Map<String, dynamic> json) => _$_Memo(
      title: json['title'] as String,
      detail: json['detail'] as String,
      createdAt: json['createdAt'],
      user: json['user'],
      updatedAt: json['updatedAt'],
    );

Map<String, dynamic> _$$_MemoToJson(_$_Memo instance) => <String, dynamic>{
      'title': instance.title,
      'detail': instance.detail,
      'createdAt': instance.createdAt,
      'user': instance.user,
      'updatedAt': instance.updatedAt,
    };
