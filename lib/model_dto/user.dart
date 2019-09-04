class User{
  String _teamNo;
  String _agentNo;
  String _firstName;
  String _lastName;
  String _sex;
  String _idNumber;
  String _position;
  String _personalPhone;
  String _password;
  String dailyDistribution;
  String dailyRetailer;
  String dailyFeedbacks;
  String dailySummary;
  String stockControlAgent;
  String stockControlTeamLeader;
  String routePlan;
  String marketAudit;
  String teamInfo;

  User();

  User.fromJson(Map json){
    personalPhone = json['personal_phone'].toString();
    position = json['position'];
    idNumber = json['id_number'].toString();
    sex = json['sex'];
    lastName = json['last_name'];
    firstName = json['first_name'];
    password = json['password'].toString();
    teamNo = json['team_no'];
    agentNo = json['agent_no'];
    dailyDistribution = json['daily_distribution'];
    dailyRetailer = json['daily_retailer'];
    dailyFeedbacks = json['daily_feedbacks'];
    dailySummary = json['daily_summary'];
    stockControlAgent = json['stock_control_agent'];
    stockControlTeamLeader = json['stock_control_team_leader'];
    routePlan = json['route_plan'];
    marketAudit = json['market_audit'];
    teamInfo = json['team_info'];
  }

  Map<String, dynamic> toJson() => {
    'personal_phone': personalPhone,
    'position': position,
    'id_number': idNumber,
    'sex': sex,
    'last_name': lastName,
    'first_name': firstName,
    'team_no': teamNo,
    'password': password,
    'agent_no': agentNo,
    'daily_distribution': dailyDistribution,
    'daily_retailer': dailyRetailer,
    'daily_feedbacks': dailyFeedbacks,
    'daily_summary': dailySummary,
    'stock_control_agent': stockControlAgent,
    'stock_control_team_leader': stockControlTeamLeader,
    'route_plan': routePlan,
    'market_audit': marketAudit,
    'team_info': teamInfo
  };

  String get agentNo => _agentNo;

  set agentNo(String value) {
    _agentNo = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get personalPhone => _personalPhone;

  set personalPhone(String value) {
    _personalPhone = value;
  }

  String get position => _position;

  set position(String value) {
    _position = value;
  }

  String get idNumber => _idNumber;

  set idNumber(String value) {
    _idNumber = value;
  }

  String get sex => _sex;

  set sex(String value) {
    _sex = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  String get teamNo => _teamNo;

  set teamNo(String value) {
    _teamNo = value;
  }

  @override
  String toString() {
    return 'User{_teamNo: $_teamNo, _agentNo: $_agentNo, _firstName: $_firstName, _lastName: $_lastName, _sex: $_sex, _idNumber: $_idNumber, _position: $_position, _personalPhone: $_personalPhone, _password: $_password}';
  }
}