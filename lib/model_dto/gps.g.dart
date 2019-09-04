// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gps _$GpsFromJson(Map<String, dynamic> json) {
  return Gps()
    ..longtitude = json['longtitude'] as String
    ..latitude = json['latitude'] as String;
}

Map<String, dynamic> _$GpsToJson(Gps instance) => <String, dynamic>{
      'longtitude': instance.longtitude,
      'latitude': instance.latitude
    };
