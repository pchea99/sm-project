import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:sm_app/list-view/list-view-province.dart';
import 'package:sm_app/model_dao/dailyFeedbackDAO.dart';
import 'package:sm_app/network-service/network.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/button-save.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/navigate-to.dart';
import 'package:sm_app/utils/select-box.dart';
import 'package:sm_app/utils/select-value.dart';
import 'package:sm_app/utils/shared_preferences.dart';
import 'package:sm_app/utils/snackbar.dart';
import 'package:sm_app/utils/spinner-dialog.dart';
import 'package:sm_app/utils/string-util.dart';
import 'package:flutter/services.dart';

class DailyFeedback extends StatefulWidget {
  @override
  _DailyFeedbackState createState() => _DailyFeedbackState();
}

class _DailyFeedbackState extends State<DailyFeedback> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _radioValueFeedback;
  int _radioValueIssue;
  int _radioValueBrokenPhone;
  int _radioValueSlowPhone;
  int _radioValueBrokenApp;
  int _radioValueNoCoverage;
  int _radioValueUnrecognizeSIM;
  int _radioValueWeather;
  int _radioValueNoPeople;
  int _radioValueOverVisited;

  TextEditingController _controllerTeamNo;
  TextEditingController _controllerDate;
  TextEditingController _controllerDistrict;
  TextEditingController _controllerCommune;
  TextEditingController _controllerVillage;
  TextEditingController _controllerSmartDownload;
  TextEditingController _controllerSmartUpload;
  TextEditingController _controllerAnotherIssue;
  TextEditingController _controllerLatitude;
  TextEditingController _controllerLongtitude;

  String _txtProvince;
  DateTime _date;
  Location location = new Location();

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _controllerDate = new TextEditingController(
        text: formatDate(new DateTime.now(), StringUtil.dateFormats())
    );
    _controllerTeamNo = new TextEditingController(
        text: SharedPreferenceUtils.sharedUser.teamNo);
    _controllerAnotherIssue = new TextEditingController();
    _controllerSmartDownload = new TextEditingController();
    _controllerSmartUpload = new TextEditingController();
    _controllerDistrict = new TextEditingController();
    _controllerCommune = new TextEditingController();
    _controllerVillage = new TextEditingController();
    _controllerLatitude = new TextEditingController();
    _controllerLongtitude = new TextEditingController();

    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      scaffoldKey: _scaffoldKey,
        title: StringRes.dailyFeedback,
        actions: <Widget>[
          ButtonSave.buttonSave(_onSave)
        ],
        layout: _buildForm()
    );
  }

  void initPlatformState() async {
    Map<String, double> _currentLocation;
    try{
      _currentLocation = await location.getLocation();
    } on PlatformException catch(e){
      if(e.code == 'PERMISSION_DENIED'){
        print("err: PERMISSION_DENIED");
      }else if(e.code == 'PERMISSION_DENIED_NEVER_ASK'){
        print("err: PERMISSION_DENIED_NEVER_ASK");
      }

      _currentLocation = null;
    }

    _controllerLatitude.text = _currentLocation['latitude'].toString();
    _controllerLongtitude.text = _currentLocation['longitude'].toString();
  }

  SingleChildScrollView _buildForm() {
    return SingleChildScrollView(
        child: ContainerForm.buildContainForm(
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SelectValue.selectView(
                    label: StringRes.province,
                    callback: _onSelectProvince,
                    value: _txtProvince,
                  ),
                ),
                SelectBox.selectBox(
                    groupValue: _radioValueFeedback,
                    onChanged: _handleRadioFeedbackValueChange,
                    label: StringRes.anotherFeedback
                ),
                InputField.buildTextField(
                  controller: _controllerTeamNo,
                  label: StringRes.team,
                ),
                InputField.buildTextField(
                    controller: _controllerDate,
                    label: StringRes.date
                ),
                InputField.buildTextField(
                    controller: _controllerDistrict,
                    label: StringRes.district,
                    isEnable: true
                ),
                InputField.buildTextField(
                    controller: _controllerCommune,
                    label: StringRes.commune,
                    isEnable: true
                ),
                InputField.buildTextField(
                    controller: _controllerVillage,
                    label: StringRes.village,
                    isEnable: true
                ),
                InputField.buildTextField(
                    controller: _controllerSmartDownload,
                    label: StringRes.smartCoverageDownload,
                    isEnable: true
                ),
                InputField.buildTextField(
                    controller: _controllerSmartUpload,
                    label: StringRes.smartCoverageUpload,
                    isEnable: true
                ),
                InputField.buildTextField(
                    controller: _controllerAnotherIssue,
                    label: StringRes.otherIssueRemark,
                    isEnable: true
                ),
                SelectBox.selectBox(
                    groupValue: _radioValueIssue,
                    onChanged: _handleRadioIssueValueChange,
                    label: StringRes.issue
                ),
                SelectBox.selectBox(
                    groupValue: _radioValueBrokenPhone,
                    onChanged: _handleRadioBrokenPhoneValueChange,
                    label: StringRes.brokenPhone
                ),
                SelectBox.selectBox(
                    groupValue: _radioValueSlowPhone,
                    onChanged: _handleRadioSlowPhoneValueChange,
                    label: StringRes.slowPhone
                ),
                SelectBox.selectBox(
                    groupValue: _radioValueBrokenApp,
                    onChanged: _handleRadioBrokenAppValueChange,
                    label: StringRes.brokenApp
                ),
                SelectBox.selectBox(
                    groupValue: _radioValueNoCoverage,
                    onChanged: _handleRadioNoCoverageValueChange,
                    label: StringRes.noCoverage
                ),
                SelectBox.selectBox(
                    groupValue: _radioValueUnrecognizeSIM,
                    onChanged: _handleRadioUnrecognizeSIMValueChange,
                    label: StringRes.unrecognizedSIM
                ),
                SelectBox.selectBox(
                    groupValue: _radioValueWeather,
                    onChanged: _handleRadioWeatherValueChange,
                    label: StringRes.weather
                ),
                SelectBox.selectBox(
                    groupValue: _radioValueNoPeople,
                    onChanged: _handleRadioNoPeopleValueChange,
                    label: StringRes.noPeople
                ),
                SelectBox.selectBox(
                    groupValue: _radioValueOverVisited,
                    onChanged: _handleRadioOverVisitValueChange,
                    label: StringRes.overVisited
                ),
                InputField.buildTextField(
                    controller: _controllerLatitude,
                    label: StringRes.latitude
                ),
                InputField.buildTextField(
                  controller: _controllerLongtitude,
                  label: StringRes.longtitude,
                ),
              ],
            )
        ),
      );
  }

  void _onSelectProvince() async {
    var callback = await NavigateTo.navigateTo(context: context, route: ListViewProvince());
    if(callback != null){
      _txtProvince = callback;
      _onSetState();
    }
  }
  void _handleRadioFeedbackValueChange(int value) {
    _radioValueFeedback = value;
    _onSetState();
  }

  void _handleRadioIssueValueChange(int value) {
    _radioValueIssue = value;
    _onSetState();
  }

  void _handleRadioBrokenPhoneValueChange(int value) {
    _radioValueBrokenPhone = value;
    _onSetState();
  }

  void _handleRadioSlowPhoneValueChange(int value) {
    _radioValueSlowPhone = value;
    _onSetState();
  }

  void _handleRadioBrokenAppValueChange(int value) {
    _radioValueBrokenApp = value;
    _onSetState();
  }

  void _handleRadioNoCoverageValueChange(int value) {
    _radioValueNoCoverage = value;
    _onSetState();
  }

  void _handleRadioUnrecognizeSIMValueChange(int value) {
    _radioValueUnrecognizeSIM = value;
    _onSetState();
  }

  void _handleRadioWeatherValueChange(int value) {
    _radioValueWeather = value;
    _onSetState();
  }

  void _handleRadioNoPeopleValueChange(int value) {
    _radioValueNoPeople = value;
    _onSetState();
  }

  void _handleRadioOverVisitValueChange(int value) {
    _radioValueOverVisited = value;
    _onSetState();
  }

  void _onSetState(){
    if(!mounted){
      return;
    }

    setState(() {});
  }

  void _onSave() {
    if(_txtProvince == null || _txtProvince.isEmpty){
      SnackBarUtil.showInSnackBar(_scaffoldKey, StringRes.provinceRequired);
      return;
    }
    if(_controllerDistrict.text == null || _controllerDistrict.text.isEmpty){
      SnackBarUtil.showInSnackBar(_scaffoldKey, StringRes.districtRequired);
      return;
    }
    if(_controllerCommune.text == null || _controllerCommune.text.isEmpty){
      SnackBarUtil.showInSnackBar(_scaffoldKey, StringRes.communeRequired);
      return;
    }
    if(_controllerVillage.text == null || _controllerVillage.text.isEmpty){
      SnackBarUtil.showInSnackBar(_scaffoldKey, StringRes.villageRequired);
      return;
    }

    _saveToDB();
  }

  void _saveToDB() {
    if(_radioValueFeedback == 0) {
      SpinnerDialog.onSpinner(context);

      DailyFeedbackDAO data = new DailyFeedbackDAO()
        ..feedback.address.province = _txtProvince
        ..feedback.team = _controllerTeamNo.text
        ..feedback.date = StringUtil.dateToDB(_date)
        ..feedback.address.district = _controllerDistrict.text
        ..feedback.address.commune = _controllerCommune.text
        ..feedback.address.village = _controllerVillage.text
        ..feedback.smartCoverageDownload = _controllerSmartDownload.text
        ..feedback.smartCoverageUpload = _controllerSmartUpload.text
        ..feedback.otherIssueRemark = _controllerAnotherIssue.text
        ..feedback.issue = _radioValueIssue == 0 ? 'yes' : 'no'
        ..feedback.anotherFeedback = _radioValueFeedback == 0 ? 'yes' : 'no'
        ..feedback.brokenPhone = _radioValueBrokenPhone == 0 ? 'yes' : 'no'
        ..feedback.slowPhone = _radioValueSlowPhone == 0 ? 'yes' : 'no'
        ..feedback.brokenApp = _radioValueBrokenApp == 0 ? 'yes' : 'no'
        ..feedback.noCoverage = _radioValueNoCoverage == 0 ? 'yes' : 'no'
        ..feedback.unrecognizedSIM = _radioValueUnrecognizeSIM == 0
            ? 'yes'
            : 'no'
        ..feedback.weather = _radioValueWeather == 0 ? 'yes' : 'no'
        ..feedback.noPeople = _radioValueNoPeople == 0 ? 'yes' : 'no'
        ..feedback.overVisited = _radioValueOverVisited == 0 ? 'yes' : 'no'
        ..feedback.gps.latitude = _controllerLatitude.text
        ..feedback.gps.longtitude = _controllerLongtitude.text
      ;

      NetworkService.insertDailyFeedback(data).then((value) {
        Navigator.pop(context);
        Navigator.pop(context);
      }).catchError((err) {
        Navigator.pop(context);
      });
    }
  }
}
