import 'package:sm_app/model_dto/address.dart';

class RoutePlanDAO{
  String _team;
  String _date;
  String _actualVisitVs_Plan;
  Address _address;

  RoutePlanDAO(){
    address = new Address();
  }

  RoutePlanDAO.fromJson(Map json) {
    address = new Address();

    actualVisitVs_Plan = json['actual_visit_vs_plan'];
    date = json['date'];
    address.commune= json['planned_commune'];
    address.district = json['planned_district'];
    address.province = json['planned_province'];
    address.village = json['planned_village'];
    team = json['team_no'];
  }

  Map toJson() => {
    'actual_visit_vs_plan': actualVisitVs_Plan,
    'date': date,
    'planned_commune': address.commune,
    'planned_district': address.district,
    'planned_province': address.province,
    'planned_village': address.village,
    'team_no': team
  };

  Address get address => _address;

  set address(Address value) {
    _address = value;
  }

  String get actualVisitVs_Plan => _actualVisitVs_Plan;

  set actualVisitVs_Plan(String value) {
    _actualVisitVs_Plan = value;
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
    return 'RoutePlan{_team: $_team, _date: $_date, _actualVisitVs_Plan: $_actualVisitVs_Plan, _address: $_address}';
  }

}