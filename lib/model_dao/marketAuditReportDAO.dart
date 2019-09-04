import 'package:sm_app/model_dto/gps.dart';
import 'package:sm_app/model_dto/remark.dart';

class MarketAuditReportDAO{
  String _team;
  String _date;
  Remark _remark;
  Gps _gps;

  MarketAuditReportDAO(){
    remark = new Remark();
    gps = new Gps();
  }

  MarketAuditReportDAO.fromJson(Map json) {
    remark = new Remark();
    gps = new Gps();

    date = json['date'];
    remark.otherIssue = json['other_issue'];
    remark.agentPerformance = json['remark_on_agent_performance'];
    remark.systemIssue = json['remark_on_system_issues'];
    remark.visitedLocation = json['remark_on_visited_location'];
    team = json['team_no'];
    gps.latitude = json['latitude'];
    gps.longtitude = json['longtitude'];
  }

  Map toJson() => {
    'date': date,
    'other_issue': remark.otherIssue,
    'remark_on_agent_performance': remark.agentPerformance,
    'remark_on_system_issues': remark.systemIssue,
    'remark_on_visited_location': remark.visitedLocation,
    'team_no': team,
    'latitude': gps.latitude,
    'longtitude': gps.longtitude
  };

  Gps get gps => _gps;

  set gps(Gps value) {
    _gps = value;
  }

  Remark get remark => _remark;

  set remark(Remark value) {
    _remark = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get team => _team;

  set team(String value) {
    _team = value;
  }

  @override
  String toString() {
    return 'MarketAuditReport{_team: $_team, _date: $_date, _remark: $_remark}';
  }

}