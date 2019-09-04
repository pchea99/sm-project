// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'van.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Van _$VanFromJson(Map<String, dynamic> json) {
  return Van()
    ..plaqueNumber = json['plaqueNumber'] as String
    ..driverID = json['driverID'] as String
    ..driverName = json['driverName'] as String;
}

Map<String, dynamic> _$VanToJson(Van instance) => <String, dynamic>{
      'plaqueNumber': instance.plaqueNumber,
      'driverID': instance.driverID,
      'driverName': instance.driverName
    };
