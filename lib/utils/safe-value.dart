class SafeValue{
  static getSafeDouble(value){
    if(value == null || value.toString().isEmpty){
      return 0.0;
    }
    return double.parse(value.toString());
  }

  static getSafeInt(value){
    if(value == null || value.toString().isEmpty){
      return 0;
    }
    return int.parse(value.toString());
  }
}