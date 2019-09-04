import 'package:flutter/material.dart';
import 'package:sm_app/model_dao/dailySummaryDAO.dart';
import 'package:sm_app/network-service/network.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/date-picker.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/input-number.dart';
import 'package:sm_app/utils/shared_preferences.dart';
import 'package:sm_app/utils/string-util.dart';

class DailySummary extends StatefulWidget {
  @override
  _DailySummaryState createState() => _DailySummaryState();
}

class _DailySummaryState extends State<DailySummary> {
  TextEditingController _controllerTeam;
  TextEditingController _controllerAgentNo;
  TextEditingController _controllerProvince;
  TextEditingController _controllerTotalDistribution;
  TextEditingController _controllerTotalTopUp;
  TextEditingController _controllerRemainingStockAtAgent;
  TextEditingController _controllerRemainStockAtTeamLeader;
  DateTime _date;

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _controllerTeam = new TextEditingController(
        text: SharedPreferenceUtils.sharedUser.teamNo);
    _controllerProvince = new TextEditingController();
    _controllerAgentNo = new TextEditingController();
    _controllerTotalDistribution = new TextEditingController();
    _controllerTotalTopUp = new TextEditingController();
    _controllerRemainingStockAtAgent = new TextEditingController();
    _controllerRemainStockAtTeamLeader = new TextEditingController();

    _getSummary();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      title: StringRes.dailySummary,
      layout: SingleChildScrollView(
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm(){
    return ContainerForm.buildContainForm(
        Column(
          children: <Widget>[
            DatePicker.datePicker(_onSelectedDate),
            InputField.buildTextField(
              controller: _controllerTeam,
              label: StringRes.team,
            ),
            InputField.buildTextField(
                controller: _controllerProvince,
                label: StringRes.province
            ),
            InputNumber.buildTextField(
                controller: _controllerAgentNo,
                label: StringRes.agentNunmber
            ),
            InputNumber.buildTextField(
                controller: _controllerTotalDistribution,
                label: StringRes.totalDistribution,
                color: Colors.grey[300]
            ),
            InputNumber.buildTextField(
                controller: _controllerTotalTopUp,
                label: StringRes.totalTopUp
            ),
            InputNumber.buildTextField(
                controller: _controllerRemainingStockAtAgent,
                label: StringRes.remainingStockAgent
            ),
            InputNumber.buildTextField(
                controller: _controllerRemainStockAtTeamLeader,
                label: StringRes.remainStockTeamLeader,
            ),
          ],
        )
    );
  }

  void _getSummary() {
    NetworkService.getSummaryByTeam(StringUtil.dateToDB(_date), _controllerTeam.text)
        .then((data){
          if(data != null) {
            DailySummaryDAO summaryDAO = data;
//          _controllerProvince.text = summaryDAO.address.province;
            _controllerAgentNo.text = summaryDAO.agentNumber.toString();
            _controllerTotalDistribution.text =
                summaryDAO.stock.totalDistribution.toString();
            _controllerTotalTopUp.text = summaryDAO.stock.totalTopup.toString();
            _controllerRemainingStockAtAgent.text =
                summaryDAO.stock.remainStockAgent.toString();
            _controllerRemainStockAtTeamLeader.text =
                summaryDAO.stock.remainStockTeamLeader.toString();
          }
        });
  }

  void _onSelectedDate(value) {
    _date = value;
    _clearData();
    _getSummary();
  }

  void _clearData(){
    _controllerProvince.text = "";
    _controllerAgentNo.text = "";
    _controllerTotalDistribution.text = "";
    _controllerTotalTopUp.text = "";
    _controllerRemainingStockAtAgent.text = "";
    _controllerRemainStockAtTeamLeader.text = "";
  }
}
