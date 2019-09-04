import 'package:flutter/material.dart';
import 'package:sm_app/list-view/list-view-agent.dart';
import 'package:sm_app/model_dao/stockControlHistoryByAgentDAO.dart';
import 'package:sm_app/network-service/network.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';
import 'package:sm_app/utils/container-form.dart';
import 'package:sm_app/utils/date-picker.dart';
import 'package:sm_app/utils/input-field.dart';
import 'package:sm_app/utils/input-number.dart';
import 'package:sm_app/utils/navigate-to.dart';
import 'package:sm_app/utils/select-value.dart';
import 'package:sm_app/utils/shared_preferences.dart';
import 'package:sm_app/utils/string-util.dart';

class StockControlHistoryByAgent extends StatefulWidget {
  @override
  _StockControlHistoryByAgentState createState() => _StockControlHistoryByAgentState();
}

class _StockControlHistoryByAgentState extends State<StockControlHistoryByAgent> {
  TextEditingController _controllerTeam;
  TextEditingController _controllerAgentName;
  TextEditingController _controllerSIMDistribution;
  TextEditingController _controllerTopUp;
  TextEditingController _controllerStockInHand;
  TextEditingController _controllerStockTopUp;
  TextEditingController _controllerStockTeamLeader;
  TextEditingController _controllerRemainStock;

  String _txtAgentNo;
  DateTime _date;

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _controllerTeam = new TextEditingController(
        text: SharedPreferenceUtils.sharedUser.teamNo);
    _controllerAgentName = new TextEditingController();
    _controllerSIMDistribution = new TextEditingController();
    _controllerTopUp = new TextEditingController();
    _controllerStockInHand = new TextEditingController();
    _controllerStockTopUp = new TextEditingController();
    _controllerStockTeamLeader = new TextEditingController();
    _controllerRemainStock = new TextEditingController();

    if(SharedPreferenceUtils.isAgent()){
      _txtAgentNo = SharedPreferenceUtils.sharedUser.agentNo;
      _controllerAgentName.text = SharedPreferenceUtils.sharedUser.firstName +" "+
          SharedPreferenceUtils.sharedUser.lastName;

      _loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      title: StringRes.stockControlHistoryAgent,
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
                  callback: _selectAgentNo,
                  isEnable: SharedPreferenceUtils.isTeamLeader()
              ),
            ),
            DatePicker.datePicker(onSelectedDate),
            InputField.buildTextField(
              controller: _controllerTeam,
              label: StringRes.team,
            ),
            InputField.buildTextField(
                controller: _controllerAgentName,
                label: StringRes.agentName
            ),
            InputNumber.buildTextField(
                controller: _controllerSIMDistribution,
                label: StringRes.simDistribution,
            ),
            InputNumber.buildTextField(
                controller: _controllerTopUp,
                label: StringRes.topUp,
            ),
            InputNumber.buildTextField(
                controller: _controllerStockInHand,
                label: StringRes.stockInHandBTW
            ),
            InputNumber.buildTextField(
                controller: _controllerStockTopUp,
                label: StringRes.stockTopUpDTW,
            ),
            InputNumber.buildTextField(
                controller: _controllerStockTeamLeader,
                label: StringRes.stockTeamLeaderTBFAT,
            ),
            InputNumber.buildTextField(
                controller: _controllerRemainStock,
                label: StringRes.remainingStock
            ),
          ],
        )
    );
  }

  void _getStockControlHistory(){
    NetworkService.getStockByTeamAgent(
      StringUtil.dateToDB(_date),
      _controllerTeam.text,
      _txtAgentNo
    ).then((data){
      if(data != null) {
        StockControlHistoryByAgentDAO stock = data;
        _controllerSIMDistribution.text =
            stock.stock.simDistribution.toString();
        _controllerTopUp.text = stock.stock.topup.toString();
        _controllerStockInHand.text =
            stock.stock.stockInHandBeforeTodayWork.toString();
        _controllerStockTopUp.text =
            stock.stock.stockTopUpDuringTodayWork.toString();
        _controllerStockTeamLeader.text =
            stock.stock.stockTeamLeaderTakingBackFromByAgent.toString();
        _controllerRemainStock.text =
            stock.stock.remainingStockForTomorrowWorkByAgent.toString();

        _onSetState();
      }
    });
  }

  void onSelectedDate(value) {
    _date = value;
    _loadData();
  }

  void _loadData() {
    _clearData();
    if(_date != null && _txtAgentNo != null && _txtAgentNo.isNotEmpty){
      _getStockControlHistory();
    }
  }

  void _selectAgentNo() async {
    var callback = await NavigateTo.navigateTo(
        context: context,
        route: ListViewAgent(
            teamNo: SharedPreferenceUtils.sharedUser.teamNo)
    );

    if(callback != null){
      _txtAgentNo = callback.agentNo;
      _controllerAgentName.text = callback.agentNameEn;
      _loadData();
    }
  }

  void _onSetState() {
    if(!mounted){
      return;
    }

    setState(() {});
  }

  void _clearData(){
    _controllerSIMDistribution.text = "";
    _controllerTopUp.text = "";
    _controllerStockInHand.text = "";
    _controllerStockTopUp.text = "";
    _controllerStockTeamLeader.text = "";
    _controllerRemainStock.text = "";
  }

}
