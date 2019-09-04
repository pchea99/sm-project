import 'package:sm_app/model_dto/agent.dart';
import 'package:sm_app/model_dto/sim.dart';
import 'package:sm_app/model_dto/user.dart';
import 'package:sm_app/model_dto/van.dart';

class TeamInfoDAO{
  String _team;
  String _date;
  String _projectLeadName;
  String _teamLeaderName;
  Van _van;
  Agent _agent;
  User _user;
  Sim _sim;
  String _entryDate;

  TeamInfoDAO(){
    van = new Van();
    agent = new Agent();
    user = new User();
    sim = new Sim();
  }

  TeamInfoDAO.fromJson(Map json) {
    van = new Van();
    agent = new Agent();
    user = new User();
    sim = new Sim();

    agent.agentNameEn = json['agent_name_en'];
    agent.agentNameKh = json['agent_name_kh'];
    agent.agentNo = json['agent_no'];
    date = json['date'];
    entryDate = json['entry_date'];
    user.idNumber = json['id_number'].toString();
    sim.masterSIM = json['master_sim'] + 0.0;
    sim.masterSIMPassword = json['master_sim_password'] + 0.0;
    user.personalPhone = json['personal_phone'].toString();
    user.position = json['position'];
    projectLeadName = json['project_lead_name'];
    sim.registeredSIM = json['register_sim'] + 0.0;
    user.sex = json['sex'];
    sim.slaveSIM = json['slave_sim'] + 0.0;
    sim.slaveSIMPassword = json['slave_sim_password'] + 0.0;
    teamLeaderName = json['team_lead_name'];
    team = json['team_no'];
    van.driverID = json['van_driver_id'];
    van.driverName = json['van_driver_name'];
    van.plaqueNumber = json['van_plaque_number'];
  }

  Map<String, dynamic> toJson() =>
      {
        'agent_name_en': agent.agentNo,
        'agent_name_kh': agent.agentNameKh,
        'agent_no': agent.agentNo,
        'date': date,
        'entry_date': entryDate,
        'id_number': user.idNumber,
        'master_sim': sim.masterSIM,
        'master_sim_password': sim.masterSIMPassword,
        'personal_phone': user.personalPhone,
        'position': user.position,
        'project_lead_name': projectLeadName,
        'register_sim': sim.registeredSIM,
        'sex': user.sex,
        'slave_sim': sim.slaveSIM,
        'slave_sim_password': sim.slaveSIMPassword,
        'team_lead_name': teamLeaderName,
        'team_no': team,
        'van_driver_id': van.driverID,
        'van_driver_name': van.driverName,
        'van_plaque_number': van.plaqueNumber
      };

  String get entryDate => _entryDate;

  set entryDate(String value) {
    _entryDate = value;
  }

  Sim get sim => _sim;

  set sim(Sim value) {
    _sim = value;
  }

  User get user => _user;

  set user(User value) {
    _user = value;
  }

  Agent get agent => _agent;

  set agent(Agent value) {
    _agent = value;
  }

  Van get van => _van;

  set van(Van value) {
    _van = value;
  }

  String get teamLeaderName => _teamLeaderName;

  set teamLeaderName(String value) {
    _teamLeaderName = value;
  }

  String get projectLeadName => _projectLeadName;

  set projectLeadName(String value) {
    _projectLeadName = value;
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
    return 'TeamInfo{_team: $_team, _date: $_date, _projectLeadName: $_projectLeadName, _teamLeaderName: $_teamLeaderName, _van: $_van, _agent: $_agent, _user: $_user, _sim: $_sim, _entryDate: $_entryDate}';
  }

}