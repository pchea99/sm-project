import 'package:json_annotation/json_annotation.dart';
part 'van.g.dart';

@JsonSerializable()
class Van{
  String _driverName;
  String _driverID;
  String _plaqueNumber;

  Van();

  factory Van.fromJson(Map<String, dynamic> json) => _$VanFromJson(json);

  Map<String, dynamic> toJson() => _$VanToJson(this);

  String get plaqueNumber => _plaqueNumber;

  set plaqueNumber(String value) {
    _plaqueNumber = value;
  }

  String get driverID => _driverID;

  set driverID(String value) {
    _driverID = value;
  }

  String get driverName => _driverName;

  set driverName(String value) {
    _driverName = value;
  }

  @override
  String toString() {
    return 'Van{_driverName: $_driverName, _driverID: $_driverID, _plaqueNumber: $_plaqueNumber}';
  }

}