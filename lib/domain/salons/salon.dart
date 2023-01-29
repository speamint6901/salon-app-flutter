import "package:freezed_annotation/freezed_annotation.dart";

part 'salon.freezed.dart';
part 'salon.g.dart';

@freezed
abstract class Salon with _$Salon {
  const factory Salon({
    required String salonName,
    required String uid,
    required String prefName,
    required String address,
    required List<String> stationName,
    required String cityName,
    required dynamic geoCode,
    required String mainImageURL,
    required List<String> categories,
    required dynamic createdAt,
    dynamic? updatedAt,
  }) = _Salon;
  factory Salon.fromJson(Map<String, dynamic> json) => _$SalonFromJson(json);
}
