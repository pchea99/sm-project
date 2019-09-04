import 'package:sm_app/model_dto/stock.dart';

class StockControlReportByTeamLeaderDAO{
  String _team;
  String _date;
  Stock _stock;

  StockControlReportByTeamLeaderDAO(){
    stock = new Stock();
  }

  StockControlReportByTeamLeaderDAO.fromJson(Map json){
    stock = new Stock();
    team = json['team_no'];
    date = json['date'];
    stock.initialStockInHandForTeamLeader = json['initial_stocks_in_hand_for_team_leader'] + 0.0;
    stock.remainStockTeamLeaderFromYesterday = json['remaining_stocks_at_team_leader_from_yesterday'] + 0.0;
    stock.simStockReceivedByAssistant = json['sim_stock_received_by_assistant'] + 0.0;
    stock.stockDeliveredBackToAssistant = json['stock_delivered_back_to_assistant'] + 0.0;
    stock.totalStockAllocatedToAllAgent = json['total_stocks_allocated_to_all_agent'] + 0.0;
    stock.totalStockReturnTeamLeaderTakingBackToday = json['total_stocks_team_leader_taking_back_today'] + 0.0;
    stock.remainStockTeamLeaderForToday = json['remaining_stock_at_team_leader_for_today'] + 0.0;
  }

  void init(){
    stock = new Stock();
    team = "";
    date = DateTime.now().toUtc().toString();
    stock.initialStockInHandForTeamLeader = 0.0;
    stock.remainStockTeamLeaderFromYesterday = 0.0;
    stock.simStockReceivedByAssistant = 0.0;
    stock.stockDeliveredBackToAssistant = 0.0;
    stock.totalStockAllocatedToAllAgent = 0.0;
    stock.totalStockReturnTeamLeaderTakingBackToday = 0.0;
    stock.remainStockTeamLeaderForToday = 0.0;
  }

  Map toJson() => {
    'team_no': team,
    'date': date,
    'initial_stocks_in_hand_for_team_leader': stock.initialStockInHandForTeamLeader,
    'remaining_stocks_at_team_leader_from_yesterday': stock.remainStockTeamLeaderFromYesterday,
    'sim_stock_received_by_assistant': stock.simStockReceivedByAssistant,
    'stock_delivered_back_to_assistant': stock.stockDeliveredBackToAssistant,
    'total_stocks_allocated_to_all_agent': stock.totalStockAllocatedToAllAgent,
    'total_stocks_team_leader_taking_back_today': stock.totalStockReturnTeamLeaderTakingBackToday,
    'remaining_stock_at_team_leader_for_today': stock.remainStockTeamLeaderForToday
  };

  Stock get stock => _stock;

  set stock(Stock value) {
    _stock = value;
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
    return 'StockControlReportByTeamLeader{_team: $_team, _date: $_date, _stock: $_stock}';
  }

}