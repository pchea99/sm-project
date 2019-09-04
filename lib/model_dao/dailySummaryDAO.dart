import 'package:sm_app/model_dto/address.dart';
import 'package:sm_app/model_dto/stock.dart';

class DailySummaryDAO{
  String _team;
  String _date;
  Address _address;
  int _agentNumber;
  Stock _stock;

  DailySummaryDAO(){
    address = new Address();
    stock = new Stock();
  }

  DailySummaryDAO.fromJson(Map json) {
    address = new Address();
    stock = new Stock();

    agentNumber = json['agent_no'];
    date = json['date'];
    address.province = json['province'];
    stock.remainStockAgent = json['remaining_stocks_at_agent'] == null
        ? 0.0 : json['remaining_stocks_at_agent'] + 0.0;
    stock.remainStockTeamLeader = json['remaining_stocks_at_team_leader'] == null
        ? 0.0 : json['remaining_stocks_at_team_leader'] + 0.0;
    team = json['team_no'];
    stock.totalDistribution = json['total_distribution'] == null
        ? 0.0 : json['total_distribution'] + 0.0;
    stock.totalTopup = json['total_top_up'] == null ? 0.0 : json['total_top_up'] + 0.0;
    stock.topUpAmount = json['total_up_amount'] == null ? 0.0 : json['total_up_amount'] + 0.0;
  }

  Map<String, dynamic> toJson() =>
      {
        'agent_no': agentNumber,
        'date': date,
        'province': address.province,
        'remaining_stocks_at_agent': stock.remainStockAgent,
        'remaining_stocks_at_team_leader': stock.remainStockTeamLeader,
        'team_no': team,
        'total_distribution': stock.totalDistribution,
        'total_top_up': stock.totalTopup,
        'total_up_amount': stock.topUpAmount
      };

  Stock get stock => _stock;

  set stock(Stock value) {
    _stock = value;
  }

  int get agentNumber => _agentNumber;

  set agentNumber(int value) {
    _agentNumber = value;
  }

  Address get address => _address;

  set address(Address value) {
    _address = value;
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
    return 'DailySummaryDAO{_team: $_team, _date: $_date, _address: $_address, _agentNumber: $_agentNumber, _stock: $_stock}';
  }
}