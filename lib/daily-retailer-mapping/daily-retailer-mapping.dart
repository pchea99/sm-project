import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:sm_app/list-view/list-view-province.dart';
import 'package:sm_app/model_dao/dailyRetailerMappingDAO.dart';
import 'package:sm_app/network-service/network.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/button-save.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/input-phone.dart';
import 'package:sm_app/utils/navigate-to.dart';
import 'package:sm_app/utils/select-box.dart';
import 'package:sm_app/utils/select-value.dart';
import 'package:sm_app/utils/shared_preferences.dart';
import 'package:sm_app/utils/snackbar.dart';
import 'package:sm_app/utils/spinner-dialog.dart';
import 'package:sm_app/utils/string-util.dart';
import 'package:flutter/services.dart';

class DailyRetailerMapping extends StatefulWidget {
  @override
  _DailyRetailerMappingState createState() => _DailyRetailerMappingState();
}

class _DailyRetailerMappingState extends State<DailyRetailerMapping> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _controllerTeam;
  TextEditingController _controllerDate;
  TextEditingController _controllerDistrict;
  TextEditingController _controllerCommune;
  TextEditingController _controllerVillage;
  TextEditingController _controllerRetailerName;
  TextEditingController _controllerRetailerPhone;
  TextEditingController _controllerLatitude;
  TextEditingController _controllerLongtitude;

  String _txtProvince;
  int _radioValue;
  DateTime _date;
  Location location = new Location();

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _controllerDate = new TextEditingController(
        text: formatDate(new DateTime.now(), StringUtil.dateFormats())
    );
    _controllerTeam = new TextEditingController(
        text: SharedPreferenceUtils.sharedUser.teamNo);
    _controllerDistrict = new TextEditingController();
    _controllerCommune = new TextEditingController();
    _controllerVillage = new TextEditingController();
    _controllerRetailerName = new TextEditingController();
    _controllerRetailerPhone = new TextEditingController();
    _controllerLatitude = new TextEditingController();
    _controllerLongtitude = new TextEditingController();

    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      scaffoldKey: _scaffoldKey,
        title: StringRes.dailyRetailerMapping,
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
                      value: _txtProvince,
                      callback: _onSelectProvince
                  ),
                ),
                SelectBox.selectBox(
                    groupValue: _radioValue,
                    onChanged: _handleRadioValueChange,
                    label: StringRes.anotherRetailer
                ),
                InputField.buildTextField(
                  controller: _controllerTeam,
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
                    controller: _controllerRetailerName,
                    label: StringRes.retailerName,
                    isEnable: true
                ),
                InputPhone.buildTextField(
                    controller: _controllerRetailerPhone,
                    label: StringRes.retailerPhone,
                    isEnable: true
                ),
                InputField.buildTextField(
                  controller: _controllerLatitude,
                  label: StringRes.latitude,
                ),
                InputField.buildTextField(
                    controller: _controllerLongtitude,
                    label: StringRes.longtitude
                ),
              ],
            )
        ),
      );
  }

  void _handleRadioValueChange(int value) {
    _radioValue = value;
    _onSetState();
  }

  void _onSelectProvince() async {
    var callback = await NavigateTo.navigateTo(context: context, route: ListViewProvince());
    if(callback != null){
      _txtProvince = callback;
      _onSetState();
    }
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
    if(_controllerRetailerName.text == null || _controllerRetailerName.text.isEmpty){
      SnackBarUtil.showInSnackBar(_scaffoldKey, StringRes.retailerNameRequired);
      return;
    }
    if(_controllerRetailerPhone.text == null || _controllerRetailerPhone.text.isEmpty){
      SnackBarUtil.showInSnackBar(_scaffoldKey, StringRes.retailerPhoneRequired);
      return;
    }

    _saveToDB();
  }

  void _saveToDB() {
    if(_radioValue == 0) {
      SpinnerDialog.onSpinner(context);

      DailyRetailerMappingDAO data = new DailyRetailerMappingDAO()
        ..teamNo = _controllerTeam.text
        ..date = StringUtil.dateToDB(_date)
        ..anotherRetailer = 'yes'
        ..address.province = _txtProvince
        ..address.district = _controllerDistrict.text
        ..address.commune = _controllerCommune.text
        ..address.village = _controllerVillage.text
        ..gps.latitude = _controllerLatitude.text
        ..gps.longtitude = _controllerLongtitude.text
        ..retailerName = _controllerRetailerName.text
        ..retailerPhone = _controllerRetailerPhone.text
      ;

      NetworkService.insertDailyRetailerMapping(data).then((value) {
        Navigator.pop(context);
        Navigator.pop(context);
      }).catchError((err) {
        Navigator.pop(context);
      });
    }
  }
}
