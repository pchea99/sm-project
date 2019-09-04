import 'package:sm_app/model_dto/agent.dart';
import 'package:sm_app/model_dto/stock.dart';

class DailyDistributionTopUpDAO{
  String _team;
  String _date;
  String _remark;
  Agent _agent;
  Stock _stock;

  DailyDistributionTopUpDAO(){
    agent = new Agent();
    stock = new Stock();
  }

  DailyDistributionTopUpDAO.fromJson(Map json){
    agent = new Agent();
    stock = new Stock();

    agent.agentNameEn = json['agent_name'];
    agent.agentNo = json['agent_no'];
    date = json['date'];
    stock.topUpAmount = json['daily_top_up_amount'] == null
        ? 0.0 : json['daily_top_up_amount'] + 0.0;
    stock.remainingStockForTomorrowWorkByAgent =
    json['remaining_stock_for_tomorrow_work_by_agent'] == null
        ? 0.0 : json['remaining_stock_for_tomorrow_work_by_agent'] + 0.0;
    remark = json['remar'];
    stock.simDistribution = json['sim_distribution'] == null
        ? 0.0 : json['sim_distribution'] + 0.0;
    stock.stockInHandBeforeTodayWork = json['stock_in_hand_before_today_work'] == null
        ? 0.0 : json['stock_in_hand_before_today_work'] + 0.0;
    stock.stockTeamLeaderTakingBackFromByAgent =
    json['stock_team_leader_taking_back_from_by_agent'] == null
        ? 0.0 : json['stock_team_leader_taking_back_from_by_agent'] + 0.0;
    stock.stockTopUpDuringTodayWork = json['stock_top_up_during_today_work'] == null
        ? 0.0 : json['stock_top_up_during_today_work'] + 0.0;
    team = json['team_no'];
    stock.topup = json['top_up'] == null
        ? 0.0 : json['top_up'] + 0.0;
  }

  Map toJson() => {
    'agent_name': agent.agentNameEn,
    'agent_no': agent.agentNo,
    'date': date,
    'daily_top_up_amount': stock.topUpAmount,
    'remaining_stock_for_tomorrow_work_by_agent': stock.remainingStockForTomorrowWorkByAgent,
    'remar': remark,
    'sim_distribution': stock.simDistribution,
    'stock_in_hand_before_today_work': stock.stockInHandBeforeTodayWork,
    'stock_team_leader_taking_back_from_by_agent': stock.stockTeamLeaderTakingBackFromByAgent,
    'stock_top_up_during_today_work': stock.stockTopUpDuringTodayWork,
    'team_no': team,
    'top_up': stock.topup
  };

  String get remark => _remark;

  set remark(String value) {
    _remark = value;
  }

  Stock get stock => _stock;

  set stock(Stock value) {
    _stock = value;
  }

  Agent get agent => _agent;

  set agent(Agent value) {
    _agent = value;
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
    return 'DailyDistributionTopUp{_team: $_team, _date: $_date, _agent: $_agent, _stock: $_stock}';
    }
}