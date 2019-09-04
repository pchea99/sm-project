import 'package:sm_app/model_dto/address.dart';
import 'package:sm_app/model_dto/gps.dart';

class DailyRetailerMappingDAO{
  String _date;
  String _anotherRetailer;
  String _teamNo;
  Gps _gps;
  Address _address;
  String _retailerName;
  String _retailerPhone;

  DailyRetailerMappingDAO(){
   address = new Address();
   gps = new Gps();
  }

  DailyRetailerMappingDAO.fromJson(Map json){
    address = new Address();
    gps = new Gps();

    teamNo = json['team_no'];
    anotherRetailer = json['another_retailer'];
    date = json['date'];
    address.province = json['province'];
    address.district = json['district'];
    address.commune = json['commune'];
    address.village = json['village'];
    gps.latitude = json['tatitude'];
    gps.longtitude = json['longtitude'];
    retailerName = json['retailer_name'];
    retailerPhone = json['retailer_phone'];
  }

  Map<String, dynamic> toJson() => {
    'team_no': teamNo,
    'date': date,
    'another_retailer': anotherRetailer,
    'province': address.province,
    'district': address.district,
    'commune': address.commune,
    'village': address.village,
    'tatitude': gps.latitude,
    'longtitude': gps.longtitude,
    'retailer_name': retailerName,
    'retailer_phone': retailerPhone
  };

  String get retailerName => _retailerName;

  set retailerName(String value) {
    _retailerName = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get anotherRetailer => _anotherRetailer;

  set anotherRetailer(String value) {
    _anotherRetailer = value;
  }

  Address get address => _address;

  set address(Address value) {
    _address = value;
  }

  String get teamNo => _teamNo;

  set teamNo(String value) {
    _teamNo = value;
  }

  String get retailerPhone => _retailerPhone;

  set retailerPhone(String value) {
    _retailerPhone = value;
  }

  Gps get gps => _gps;

  set gps(Gps value) {
    _gps = value;
  }


}