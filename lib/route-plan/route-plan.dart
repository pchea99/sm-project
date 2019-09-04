import 'package:flutter/material.dart';
import 'package:sm_app/model_dao/dailySummaryDAO.dart';
import 'package:sm_app/model_dao/routePlanDAO.dart';
import 'package:sm_app/network-service/network.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/button-save.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/date-picker.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/select-box.dart';
import 'package:sm_app/utils/shared_preferences.dart';
import 'package:sm_app/utils/spinner-dialog.dart';
import 'package:sm_app/utils/string-util.dart';

class RoutePlan extends StatefulWidget {
  @override
  _RoutePlanState createState() => _RoutePlanState();
}

class _RoutePlanState extends State<RoutePlan> {
  TextEditingController _controllerTeamNo;
  TextEditingController _controllerPlannedProvince;
  TextEditingController _controllerPlannedDistrict;
  TextEditingController _controllerPlannedCommune;
  TextEditingController _controllerPlannedVillage;

  int _groupValue;
  DateTime _date;
  RoutePlanDAO _data;
  DailySummaryDAO _dailySummary;

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _controllerTeamNo = new TextEditingController(
        text: SharedPreferenceUtils.sharedUser.teamNo);
    _controllerPlannedProvince = new TextEditingController();
    _controllerPlannedDistrict = new TextEditingController();
    _controllerPlannedCommune = new TextEditingController();
    _controllerPlannedVillage = new TextEditingController();
    _getRoutePlan();
    _getDailySummary();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      title: StringRes.routePlan,
      actions: <Widget>[
        ButtonSave.buttonSave(_onSave)
      ],
      layout: SingleChildScrollView(
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm(){
    return ContainerForm.buildContainForm(
        Column(
          children: <Widget>[
            DatePicker.datePicker(onSelectedDate),
            SelectBox.selectBox(
                groupValue: _groupValue,
                onChanged: _handleRadioValueChange,
                label: StringRes.actualVisitPlan,
                isEnable: SharedPreferenceUtils.isTeamLeader()
            ),
            InputField.buildTextField(
              controller: _controllerTeamNo,
              label: StringRes.team,
            ),
            InputField.buildTextField(
                controller: _controllerPlannedProvince,
                label: StringRes.plannedProvince
            ),
            InputField.buildTextField(
                controller: _controllerPlannedDistrict,
                label: StringRes.plannedDistrict,
            ),
            InputField.buildTextField(
                controller: _controllerPlannedCommune,
                label: StringRes.plannedCommune,
            ),
            InputField.buildTextField(
                controller: _controllerPlannedVillage,
                label: StringRes.plannedVillage
            ),
          ],
        )
    );
  }

  void _onSave() {
    SpinnerDialog.onSpinner(context);

    _data = new RoutePlanDAO()
      ..team = _controllerTeamNo.text
      ..date = StringUtil.dateToDB(_date)
      ..address.province = _controllerPlannedProvince.text
      ..address.district = _controllerPlannedDistrict.text
      ..address.commune = _controllerPlannedCommune.text
      ..address.village = _controllerPlannedVillage.text
      ..actualVisitVs_Plan = _groupValue == 0 ? 'yes' : 'no'
    ;

    NetworkService.insertRoutePlan(_data).then((value){
      _saveDailySummary();
      Navigator.pop(context);
    }).catchError((err){
      Navigator.pop(context);
    });
  }

  void _getRoutePlan(){
    NetworkService.getRoutePlan(
        StringUtil.dateToDB(_date),
        SharedPreferenceUtils.sharedUser.teamNo
    ).then((data){
      if(data != null) {
        _data = data;
        _initData();
      }
    });
  }

  void _initData(){
    _controllerPlannedProvince.text = _data.address.province;
    _controllerPlannedDistrict.text = _data.address.district;
    _controllerPlannedCommune.text = _data.address.commune;
    _controllerPlannedVillage.text = _data.address.village;
    _groupValue = _data.actualVisitVs_Plan.toLowerCase() == 'yes' ? 0 : 1;

    _onSetState();
  }

  void _clear(){
    _controllerPlannedProvince.text = "";
    _controllerPlannedDistrict.text = "";
    _controllerPlannedCommune.text = "";
    _controllerPlannedVillage.text = "";
    _groupValue = null;
    _onSetState();
  }

  void _handleRadioValueChange(int value) {
    _groupValue = value;
    _onSetState();
  }

  void onSelectedDate(value) {
    _date = value;
    _getRoutePlan();
    _getDailySummary();
    _clear();
  }

  void _getDailySummary() {
    _dailySummary = null;
    NetworkService.getSummaryByTeam(
        StringUtil.dateToDB(_date),
        SharedPreferenceUtils.sharedUser.teamNo
    ).then((data){
      if(data != null){
        _dailySummary = data;
      }
    });
  }

  void _saveDailySummary() {
    if(_dailySummary == null){
      _dailySummary = new DailySummaryDAO()
        ..date = StringUtil.dateToDB(_date)
        ..team = SharedPreferenceUtils.sharedUser.teamNo
        ..address.province = ""
        ..agentNumber = 1
        ..stock.totalTopup = 0.0
        ..stock.totalDistribution = 0.0
        ..stock.remainStockAgent = 0.0
        ..stock.remainStockTeamLeader = 0.0
        ..stock.totalRemainStock = 0.0
      ;
    }else{
      DailySummaryDAO summary = new DailySummaryDAO()
        ..date = _dailySummary.date
        ..team = _dailySummary.team
        ..address.province = _dailySummary.address.province
        ..agentNumber = _dailySummary.agentNumber
        ..stock.totalTopup = _dailySummary.stock.totalTopup
        ..stock.totalDistribution = _dailySummary.stock.totalDistribution
        ..stock.remainStockAgent = _dailySummary.stock.remainStockAgent
        ..stock.remainStockTeamLeader = 0.0
      ;

      _dailySummary = summary;
    }

    NetworkService.insertDailySummary(_dailySummary);
  }

  void _onSetState(){
    if(!mounted){
      return;
    }

    setState(() {});
  }
}
