
import 'package:json_annotation/json_annotation.dart';
part 'retailer.g.dart';

@JsonSerializable()
class Retailer{
  String _retailerName;
  String _retailerPhone;

  Retailer();

  factory Retailer.fromJson(Map<String, dynamic> json) => _$RetailerFromJson(json);

  Map<String, dynamic> toJson() => _$RetailerToJson(this);

  String get retailerPhone => _retailerPhone;

  set retailerPhone(String value) {
    _retailerPhone = value;
  }

  String get retailerName => _retailerName;

  set retailerName(String value) {
    _retailerName = value;
  }

  @override
  String toString() {
    return 'Retailer{_retailerName: $_retailerName, _retailerPhone: $_retailerPhone}';
  }

}