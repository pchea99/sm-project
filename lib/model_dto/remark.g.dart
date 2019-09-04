// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Remark _$RemarkFromJson(Map<String, dynamic> json) {
  return Remark()
    ..otherIssue = json['otherIssue'] as String
    ..systemIssue = json['systemIssue'] as String
    ..visitedLocation = json['visitedLocation'] as String
    ..agentPerformance = json['agentPerformance'] as String;
}

Map<String, dynamic> _$RemarkToJson(Remark instance) => <String, dynamic>{
      'otherIssue': instance.otherIssue,
      'systemIssue': instance.systemIssue,
      'visitedLocation': instance.visitedLocation,
      'agentPerformance': instance.agentPerformance
    };
