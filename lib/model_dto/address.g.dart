// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address()
    ..village = json['village'] as String
    ..commune = json['commune'] as String
    ..district = json['district'] as String
    ..province = json['province'] as String;
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'village': instance.village,
      'commune': instance.commune,
      'district': instance.district,
      'province': instance.province
    };
