// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Salon _$$_SalonFromJson(Map<String, dynamic> json) => _$_Salon(
      salonName: json['salonName'] as String,
      uid: json['uid'] as String,
      prefName: json['prefName'] as String,
      address: json['address'] as String,
      stationName: (json['stationName'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      cityName: json['cityName'] as String,
      geoCode: json['geoCode'],
      mainImageURL: json['mainImageURL'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );

Map<String, dynamic> _$$_SalonToJson(_$_Salon instance) => <String, dynamic>{
      'salonName': instance.salonName,
      'uid': instance.uid,
      'prefName': instance.prefName,
      'address': instance.address,
      'stationName': instance.stationName,
      'cityName': instance.cityName,
      'geoCode': instance.geoCode,
      'mainImageURL': instance.mainImageURL,
      'categories': instance.categories,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
