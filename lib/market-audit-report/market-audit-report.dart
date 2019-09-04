import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:sm_app/model_dao/marketAuditReportDAO.dart';
import 'package:sm_app/network-service/network.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/button-save.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/shared_preferences.dart';
import 'package:sm_app/utils/spinner-dialog.dart';
import 'package:sm_app/utils/string-util.dart';
import 'package:flutter/services.dart';

class MarketAuditReport extends StatefulWidget {
  @override
  _MarketAuditReportState createState() => _MarketAuditReportState();
}

class _MarketAuditReportState extends State<MarketAuditReport> {
  TextEditingController _controllerTeamNo;
  TextEditingController _controllerDate;
  TextEditingController _controllerRemarkAgent;
  TextEditingController _controllerRemarkVisit;
  TextEditingController _controllerRemarkSystem;
  TextEditingController _controllerOtherIssue;
  TextEditingController _controllerLatitude;
  TextEditingController _controllerLongtitude;

  DateTime _date;
  Location location = new Location();

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _controllerTeamNo = new TextEditingController(
        text: SharedPreferenceUtils.sharedUser.teamNo);
    _controllerRemarkAgent = new TextEditingController();
    _controllerRemarkVisit = new TextEditingController();
    _controllerRemarkSystem = new TextEditingController();
    _controllerOtherIssue = new TextEditingController();
    _controllerDate = new TextEditingController(
        text: formatDate(_date, StringUtil.dateFormats())
    );
    _controllerLatitude = new TextEditingController();
    _controllerLongtitude = new TextEditingController();

    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      title: StringRes.marketAuditReport,
      actions: <Widget>[
        ButtonSave.buttonSave(_onSave)
      ],
      layout: SingleChildScrollView(
        child: _buildForm(),
      ),
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

  Widget _buildForm(){
    return ContainerForm.buildContainForm(
        Column(
          children: <Widget>[
            InputField.buildTextField(
              controller: _controllerTeamNo,
              label: StringRes.team,
            ),
            InputField.buildTextField(
                controller: _controllerDate,
                label: StringRes.date
            ),
            InputField.buildTextField(
                controller: _controllerRemarkAgent,
                label: StringRes.remarkAgent,
                isEnable: true
            ),
            InputField.buildTextField(
                controller: _controllerRemarkVisit,
                label: StringRes.remarkVisit,
                isEnable: true
            ),
            InputField.buildTextField(
                controller: _controllerRemarkSystem,
                label: StringRes.remarkSystem,
                isEnable: true
            ),
            InputField.buildTextField(
                controller: _controllerOtherIssue,
                label: StringRes.otherIssue,
                isEnable: true
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
    );
  }

  void _onSave() {
    SpinnerDialog.onSpinner(context);

    MarketAuditReportDAO data = new MarketAuditReportDAO()
      ..team = _controllerTeamNo.text
      ..date = StringUtil.dateToDB(_date)
      ..remark.agentPerformance = _controllerRemarkAgent.text
      ..remark.visitedLocation = _controllerRemarkVisit.text
      ..remark.systemIssue = _controllerRemarkSystem.text
      ..remark.otherIssue = _controllerOtherIssue.text
      ..gps.latitude = _controllerLatitude.text
      ..gps.longtitude = _controllerLongtitude.text
    ;

    NetworkService.insertMarketAudit(data).then((value){
      Navigator.pop(context);
    }).catchError((err){
      Navigator.pop(context);
    });
  }
}
