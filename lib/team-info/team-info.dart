import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:sm_app/list-view/list-view-agent.dart';
import 'package:sm_app/network-service/network.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/navigate-to.dart';
import 'package:sm_app/utils/select-value.dart';
import 'package:sm_app/utils/shared_preferences.dart';
import 'package:sm_app/utils/string-util.dart';

class TeamInfo extends StatefulWidget {
  @override
  _TeamInfoState createState() => _TeamInfoState();
}

class _TeamInfoState extends State<TeamInfo> {
  TextEditingController _controllerTeam;
  TextEditingController _controllerSex;
  TextEditingController _controllerDate;
  TextEditingController _controllerAgentName;
  TextEditingController _controllerAgentNameKh;
  TextEditingController _controllerProjectLeadName;
  TextEditingController _controllerTeamLeaderName;
  TextEditingController _controllerDriverName;
  TextEditingController _controllerDriverID;
  TextEditingController _controllerPlaqueNumber;
  TextEditingController _controllerPosition;
  TextEditingController _controllerPersonalPhone;
  TextEditingController _controllerSlaveSIMPassword;
  TextEditingController _controllerIDNumber;
  TextEditingController _controllerEntryDate;
  TextEditingController _controllerMasterSIM;
  TextEditingController _controllerMasterSIMPassword;
  TextEditingController _controllerRegisteredSIM;
  TextEditingController _controllerSlaveSIM;


  String _txtAgentNo;

  @override
  void initState() {
    super.initState();
    _controllerDate = new TextEditingController(
        text: formatDate(new DateTime.now(), StringUtil.dateFormats())
    );
    _controllerTeam = new TextEditingController();
    _controllerSex = new TextEditingController();
    _controllerAgentName = new TextEditingController();
    _controllerAgentNameKh = new TextEditingController();
    _controllerProjectLeadName = new TextEditingController();
    _controllerTeamLeaderName = new TextEditingController();
    _controllerDriverName = new TextEditingController();
    _controllerDriverID = new TextEditingController();
    _controllerPlaqueNumber = new TextEditingController();
    _controllerPosition = new TextEditingController();
    _controllerPersonalPhone = new TextEditingController();
    _controllerSlaveSIMPassword = new TextEditingController();
    _controllerIDNumber = new TextEditingController();
    _controllerEntryDate = new TextEditingController();
    _controllerMasterSIM = new TextEditingController();
    _controllerMasterSIMPassword = new TextEditingController();
    _controllerRegisteredSIM = new TextEditingController();
    _controllerSlaveSIM = new TextEditingController();

    if(SharedPreferenceUtils.isAgent()){
      _txtAgentNo = SharedPreferenceUtils.sharedUser.agentNo;
      _getAgents();
    }

  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      title: StringRes.teamInfo,
      layout: SingleChildScrollView(
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm(){
    return ContainerForm.buildContainForm(
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SelectValue.selectView(
                  label: StringRes.agentNo,
                  value: _txtAgentNo,
                  callback: _onTabAgentNo
              ),
            ),
            InputField.buildTextField(
                controller: _controllerDate,
                label: StringRes.date
            ),
            InputField.buildTextField(
                controller: _controllerAgentName,
                label: StringRes.agentName+" (Eng)"
            ),
            InputField.buildTextField(
                controller: _controllerAgentNameKh,
                label: StringRes.agentName+" (Khmer)"
            ),
            InputField.buildTextField(
              controller: _controllerSex,
              label: StringRes.sex,
            ),
            InputField.buildTextField(
              controller: _controllerTeam,
              label: StringRes.team,
            ),
            InputField.buildTextField(
                controller: _controllerProjectLeadName,
                label: StringRes.projectLeadName,
            ),
            InputField.buildTextField(
                controller: _controllerTeamLeaderName,
                label: StringRes.teamLeadName,
            ),
            InputField.buildTextField(
                controller: _controllerDriverName,
                label: StringRes.vanDriverName
            ),
            InputField.buildTextField(
                controller: _controllerDriverID,
                label: StringRes.vanDriverID,
            ),
            InputField.buildTextField(
                controller: _controllerPlaqueNumber,
                label: StringRes.vanPlaqueNumber,
            ),
            InputField.buildTextField(
                controller: _controllerPosition,
                label: StringRes.position
            ),
            InputField.buildTextField(
                controller: _controllerIDNumber,
                label: StringRes.idNumber,
            ),
            InputField.buildTextField(
              controller: _controllerEntryDate,
              label: StringRes.entryDate,
            ),
            InputField.buildTextField(
              controller: _controllerPersonalPhone,
              label: StringRes.personalPhone,
            ),
            InputField.buildTextField(
              controller: _controllerMasterSIM,
              label: StringRes.masterSIM,
            ),
            InputField.buildTextField(
              controller: _controllerMasterSIMPassword,
              label: StringRes.masterSIMPassword,
            ),
            InputField.buildTextField(
              controller: _controllerRegisteredSIM,
              label: StringRes.registeredSIM,
            ),
            InputField.buildTextField(
              controller: _controllerSlaveSIM,
              label: StringRes.slaveSIM,
            ),
            InputField.buildTextField(
              controller: _controllerSlaveSIMPassword,
              label: StringRes.slaveSIMPassword,
            ),
          ],
        )
    );
  }


  void _onSetState(){
    if(!mounted){
      return;
    }

    setState(() {});
  }

  void _onTabAgentNo() async {
    var callback = await NavigateTo.navigateTo(
        context: context,
        route: ListViewAgent(
            teamNo: SharedPreferenceUtils.sharedUser.teamNo)
    );

    if(callback != null){
      _setData(callback);
    }
  }

  void _getAgents(){
    NetworkService
        .getTeamInfo(SharedPreferenceUtils.sharedUser.teamNo, _txtAgentNo)
        .then((agentDB){
          if(agentDB != null) {
            _setData(agentDB);
            _onSetState();
          }

    }).catchError((err){
      print("err: $err");
    });
  }

  void _setData(callback) {
    _txtAgentNo = callback.agentNo;
    _controllerTeam.text = callback.agentTeamNo;
    _controllerAgentName.text = callback.agentNameEn;
    _controllerAgentNameKh.text = callback.agentNameKh;
    _controllerSex.text = callback.sex;
    _controllerPosition.text = callback.position;
    _controllerProjectLeadName.text = callback.projectLeadName;
    _controllerTeamLeaderName.text = callback.teamLeaderName;
    _controllerDriverName.text = callback.driverName;
    _controllerDriverID.text = callback.driverID;
    _controllerPlaqueNumber.text = callback.plaqueNumber;
    _controllerIDNumber.text = callback.idNumber;
    _controllerEntryDate.text = callback.entryDate;
    _controllerPersonalPhone.text = callback.personalPhone;
    _controllerMasterSIM.text = callback.masterSim;
    _controllerMasterSIMPassword.text = callback.masterSimPwd;
    _controllerRegisteredSIM.text = callback.registerSim;
    _controllerSlaveSIM.text = callback.slaveSim;
    _controllerSlaveSIMPassword.text = callback.slaveSimPwd;
    //_province = callback.province;
    _onSetState();
  }
}
