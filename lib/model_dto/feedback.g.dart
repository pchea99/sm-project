// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feedback _$FeedbackFromJson(Map<String, dynamic> json) {
  return Feedback()
    ..otherIssueRemark = json['otherIssueRemark'] as String
    ..overVisited = json['overVisited'] as String
    ..noPeople = json['noPeople'] as String
    ..weather = json['weather'] as String
    ..unrecognizedSIM = json['unrecognizedSIM'] as String
    ..noCoverage = json['noCoverage'] as String
    ..brokenApp = json['brokenApp'] as String
    ..slowPhone = json['slowPhone'] as String
    ..brokenPhone = json['brokenPhone'] as String
    ..issue = json['issue'] as String
    ..smartCoverageUpload = json['smartCoverageUpload'] as String
    ..smartCoverageDownload = json['smartCoverageDownload'] as String
    ..gps = json['gps'] == null
        ? null
        : Gps.fromJson(json['gps'] as Map<String, dynamic>)
    ..address = json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>)
    ..date =
        json['date'] == null ? null : json['date'] as String
    ..team = json['team'] as String
    ..anotherFeedback = json['anotherFeedback'] as String;
}

Map<String, dynamic> _$FeedbackToJson(Feedback instance) => <String, dynamic>{
      'otherIssueRemark': instance.otherIssueRemark,
      'overVisited': instance.overVisited,
      'noPeople': instance.noPeople,
      'weather': instance.weather,
      'unrecognizedSIM': instance.unrecognizedSIM,
      'noCoverage': instance.noCoverage,
      'brokenApp': instance.brokenApp,
      'slowPhone': instance.slowPhone,
      'brokenPhone': instance.brokenPhone,
      'issue': instance.issue,
      'smartCoverageUpload': instance.smartCoverageUpload,
      'smartCoverageDownload': instance.smartCoverageDownload,
      'gps': instance.gps,
      'address': instance.address,
      'date': instance.date,
      'team': instance.team,
      'anotherFeedback': instance.anotherFeedback
    };
