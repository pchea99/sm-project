import 'package:sm_app/model_dto/feedback.dart';

class DailyFeedbackDAO{
  Feedback _feedback;

  DailyFeedbackDAO(){
    feedback = new Feedback();
  }

  Feedback get feedback => _feedback;

  set feedback(Feedback value) {
    _feedback = value;
  }

  DailyFeedbackDAO.fromJson(Map json) {
    feedback.anotherFeedback = json['another_feedback'];
    feedback.brokenApp = json['broken_app'];
    feedback.brokenPhone = json['broken_phone'];
    feedback.address.commune = json['commune'];
    feedback.date = json['date'];
    feedback.address.district = json['district'];
    feedback.issue = json['issue'];
    feedback.gps.latitude = json['latitude'];
    feedback.gps.longtitude = json['longtitude'];
    feedback.noCoverage = json['no_coverage'];
    feedback.noPeople = json['no_people'];
    feedback.otherIssueRemark = json['other_issue_remark'];
    feedback.overVisited = json['over_visited'];
    feedback.address.province = json['province'];
    feedback.slowPhone = json['slow_phone'];
    feedback.smartCoverageDownload = json['smart_coverage_download'];
    feedback.smartCoverageUpload = json['smart_coverage_upload'];
    feedback.team = json['team_no'];
    feedback.unrecognizedSIM = json['unrecognized_sim'];
    feedback.address.village = json['village'];
    feedback.weather = json['weather'];
  }

  Map toJson(){
    return{
      'another_feedback': feedback.anotherFeedback,
      'broken_app': feedback.brokenApp,
      'broken_phone': feedback.brokenPhone,
      'commune': feedback.address.commune,
      'date': feedback.date,
      'district': feedback.address.district,
      'issue': feedback.issue,
      'latitude': feedback.gps.latitude,
      'longtitude': feedback.gps.longtitude,
      'no_coverage': feedback.noCoverage,
      'no_people': feedback.noPeople,
      'other_issue_remark': feedback.otherIssueRemark,
      'over_visited': feedback.overVisited,
      'province': feedback.address.province,
      'slow_phone': feedback.slowPhone,
      'smart_coverage_download': feedback.smartCoverageDownload,
      'smart_coverage_upload': feedback.smartCoverageUpload,
      'team_no': feedback.team,
      'unrecognized_sim': feedback.unrecognizedSIM,
      'village': feedback.address.village,
      'weather': feedback.weather
    };
  }

  @override
  String toString() {
    return 'DailyFeedback{_feedback: $_feedback}';
  }
}