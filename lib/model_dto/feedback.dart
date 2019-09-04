import 'package:json_annotation/json_annotation.dart';
import 'package:sm_app/model_dto/address.dart';
import 'package:sm_app/model_dto/gps.dart';
part 'feedback.g.dart';

@JsonSerializable()
class Feedback{
  String _anotherFeedback;
  String _team;
  String _date;
  Address _address;
  Gps _gps;
  String _smartCoverageDownload;
  String _smartCoverageUpload;
  String _issue;
  String _brokenPhone;
  String _slowPhone;
  String _brokenApp;
  String _noCoverage;
  String _unrecognizedSIM;
  String _weather;
  String _noPeople;
  String _overVisited;
  String _otherIssueRemark;

  Feedback(){
    gps = new Gps();
    address = new Address();
  }

  factory Feedback.fromJson(Map<String, dynamic> json) => _$FeedbackFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackToJson(this);

  String get otherIssueRemark => _otherIssueRemark;

  set otherIssueRemark(String value) {
    _otherIssueRemark = value;
  }

  String get overVisited => _overVisited;

  set overVisited(String value) {
    _overVisited = value;
  }

  String get noPeople => _noPeople;

  set noPeople(String value) {
    _noPeople = value;
  }

  String get weather => _weather;

  set weather(String value) {
    _weather = value;
  }

  String get unrecognizedSIM => _unrecognizedSIM;

  set unrecognizedSIM(String value) {
    _unrecognizedSIM = value;
  }

  String get noCoverage => _noCoverage;

  set noCoverage(String value) {
    _noCoverage = value;
  }

  String get brokenApp => _brokenApp;

  set brokenApp(String value) {
    _brokenApp = value;
  }

  String get slowPhone => _slowPhone;

  set slowPhone(String value) {
    _slowPhone = value;
  }

  String get brokenPhone => _brokenPhone;

  set brokenPhone(String value) {
    _brokenPhone = value;
  }

  String get issue => _issue;

  set issue(String value) {
    _issue = value;
  }

  String get smartCoverageUpload => _smartCoverageUpload;

  set smartCoverageUpload(String value) {
    _smartCoverageUpload = value;
  }

  String get smartCoverageDownload => _smartCoverageDownload;

  set smartCoverageDownload(String value) {
    _smartCoverageDownload = value;
  }

  Gps get gps => _gps;

  set gps(Gps value) {
    _gps = value;
  }

  Address get address => _address;

  set address(Address value) {
    _address = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get team => _team;

  set team(String value) {
    _team = value;
  }

  String get anotherFeedback => _anotherFeedback;

  set anotherFeedback(String value) {
    _anotherFeedback = value;
  }

  @override
  String toString() {
    return 'Feedback{_anotherFeedback: $_anotherFeedback, _team: $_team, _date: $_date, _address: $_address, _gps: $_gps, _smartCoverageDownload: $_smartCoverageDownload, _smartCoverageUpload: $_smartCoverageUpload, _issue: $_issue, _brokenPhone: $_brokenPhone, _slowPhone: $_slowPhone, _brokenApp: $_brokenApp, _noCoverage: $_noCoverage, _unrecognizedSIM: $_unrecognizedSIM, _weather: $_weather, _noPeople: $_noPeople, _overVisited: $_overVisited, _otherIssueRemark: $_otherIssueRemark}';
  }
}