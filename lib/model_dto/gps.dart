
import 'package:json_annotation/json_annotation.dart';
part 'gps.g.dart';

@JsonSerializable()
class Gps{
 String _latitude;
 String _longtitude;

 Gps();

 factory Gps.fromJson(Map<String, dynamic> json) => _$GpsFromJson(json);

 Map<String, dynamic> toJson() => _$GpsToJson(this);

 String get longtitude => _longtitude;

 set longtitude(String value) {
   _longtitude = value;
 }

 String get latitude => _latitude;

 set latitude(String value) {
   _latitude = value;
 }

 @override
 String toString() {
   return 'Gps{_latitude: $_latitude, _longtitude: $_longtitude}';
 }

}