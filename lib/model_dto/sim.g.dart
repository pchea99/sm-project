// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sim _$SimFromJson(Map<String, dynamic> json) {
  return Sim()
    ..masterSIM = (json['masterSIM'] as num)?.toDouble()
    ..masterSIMPassword = (json['masterSIMPassword'] as num)?.toDouble()
    ..registeredSIM = (json['registeredSIM'] as num)?.toDouble()
    ..slaveSIM = (json['slaveSIM'] as num)?.toDouble()
    ..slaveSIMPassword = (json['slaveSIMPassword'] as num)?.toDouble();
}

Map<String, dynamic> _$SimToJson(Sim instance) => <String, dynamic>{
      'masterSIM': instance.masterSIM,
      'masterSIMPassword': instance.masterSIMPassword,
      'registeredSIM': instance.registeredSIM,
      'slaveSIM': instance.slaveSIM,
      'slaveSIMPassword': instance.slaveSIMPassword
    };
