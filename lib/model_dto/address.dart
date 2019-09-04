part 'address.g.dart';

class Address{
  String _province;
  String _district;
  String _commune;
  String _village;

  Address();

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  String get village => _village;

  set village(String value) {
    _village = value;
  }

  String get commune => _commune;

  set commune(String value) {
    _commune = value;
  }

  String get district => _district;

  set district(String value) {
    _district = value;
  }

  String get province => _province;

  set province(String value) {
    _province = value;
  }

  @override
  String toString() {
    return 'Address{_province: $_province, _district: $_district, _commune: $_commune, _village: $_village}';
  }
}
