import 'package:json_annotation/json_annotation.dart';
part 'agent.g.dart';

@JsonSerializable()
class Agent{
  String _agentNo;
  String _agentTeamNo;
  String _agentNameKh;
  String _agentNameEn;
  String _sex;
  String _position;
  String _projectLeadName;
  String _teamLeaderName;
  String _driverName;
  String _driverID;
  String _plaqueNumber;
  String _idNumber;
  String _entryDate;
  String _personalPhone;
  String _masterSim;
  String _slaveSim;
  String _masterSimPwd;
  String _slaveSimPwd;
  String _registerSim;

  Agent();

  factory Agent.fromJson(Map json) => _$AgentFromJson(json);

  Map<String, dynamic> toJson() => _$AgentToJson(this);

  String get agentNameEn => _agentNameEn;

  set agentNameEn(String value) {
    _agentNameEn = value;
  }

  String get registerSim => _registerSim;

  set registerSim(String value) {
    _registerSim = value;
  }

  String get agentTeamNo => _agentTeamNo;

  set agentTeamNo(String value) {
    _agentTeamNo = value;
  }

  String get agentNameKh => _agentNameKh;

  set agentNameKh(String value) {
    _agentNameKh = value;
  }

  String get agentNo => _agentNo;

  set agentNo(String value) {
    _agentNo = value;
  }

  @override
  String toString() {
    return 'Agent{_agentNo: $_agentNo,'
        ' _agentNameKh: $_agentNameKh,'
        ' _agentTeamNo: $_agentTeamNo,'
        ' _sex: $_sex,'
        ' _position: $_position,'
        ' _projectLeadName: $_projectLeadName,'
        ' _teamLeaderName: $_teamLeaderName,'
        ' _driverName: $_driverName,'
        ' _driverID: $_driverID,'
        ' _plaqueNumber: $_plaqueNumber,'
        ' _entryDate: $_entryDate,'
        ' _personalPhone: $_personalPhone,'
        ' _masterSim: $_masterSim,'
        ' _idNumber: $_idNumber,'
        ' _slaveSim: $_slaveSim,'
        ' _masterSimPwd: $_masterSimPwd,'
        ' _slaveSimPwd: $_slaveSimPwd,'
        ' _registerSim: $_registerSim,'
        ' _agentNameEn: $_agentNameEn,}';
  }

  String get sex => _sex;

  set sex(String value) {
    _sex = value;
  }

  String get position => _position;

  set position(String value) {
    _position = value;
  }

  String get projectLeadName => _projectLeadName;

  set projectLeadName(String value) {
    _projectLeadName = value;
  }

  String get teamLeaderName => _teamLeaderName;

  set teamLeaderName(String value) {
    _teamLeaderName = value;
  }

  String get driverName => _driverName;

  set driverName(String value) {
    _driverName = value;
  }

  String get driverID => _driverID;

  set driverID(String value) {
    _driverID = value;
  }

  String get plaqueNumber => _plaqueNumber;

  set plaqueNumber(String value) {
    _plaqueNumber = value;
  }

  String get idNumber => _idNumber;

  set idNumber(String value) {
    _idNumber = value;
  }

  String get entryDate => _entryDate;

  set entryDate(String value) {
    _entryDate = value;
  }

  String get personalPhone => _personalPhone;

  set personalPhone(String value) {
    _personalPhone = value;
  }

  String get masterSim => _masterSim;

  set masterSim(String value) {
    _masterSim = value;
  }

  String get slaveSim => _slaveSim;

  set slaveSim(String value) {
    _slaveSim = value;
  }

  String get masterSimPwd => _masterSimPwd;

  set masterSimPwd(String value) {
    _masterSimPwd = value;
  }

  String get slaveSimPwd => _slaveSimPwd;

  set slaveSimPwd(String value) {
    _slaveSimPwd = value;
  }

}