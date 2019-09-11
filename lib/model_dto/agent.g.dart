// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Agent _$AgentFromJson(Map json) {
  return Agent()
    ..agentNo = json['agent_no'].toString()
    ..agentTeamNo = json['team_no'].toString()
    ..agentNameEn = json['agent_name_en'].toString()
    ..agentNameKh = json['agent_name_kh'].toString()
    ..sex = json['sex'].toString()
    ..position = json['position'].toString()
    ..projectLeadName = json['project_lead_name'].toString()
    ..teamLeaderName = json['team_lead_name'].toString()
    ..driverName = json['van_driver_name'].toString()
    ..driverID = json['van_driver_id'].toString()
    ..plaqueNumber = json['van_plaque_number'].toString()
    ..idNumber = json['id_number'].toString()
    ..personalPhone = json['personal_phone'].toString()
    ..masterSim = json['master_sim'].toString()
    ..masterSimPwd = json['master_sim_password'].toString()
    ..registerSim = json['register_sim'].toString()
    ..slaveSim = json['slave_sim'].toString()
    ..slaveSimPwd = json['slave_sim_password'].toString()
    ..entryDate = json['entry_date'].toString()
  ;

}

Map<String, dynamic> _$AgentToJson(Agent instance) => <String, dynamic>{
      'agent_name_en': instance.agentNameEn,
      'agent_name_kh': instance.agentNameKh,
      'agent_no': instance.agentNo
    };
