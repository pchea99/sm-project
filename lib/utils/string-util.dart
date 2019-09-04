import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'package:sm_app/utils/shared_preferences.dart';

class StringUtil{
  static List<String> dateFormats(){
    return [DD, ', ', MM,' ',dd, ', ', yyyy];
  }

  static String dateFull(date){
    return DateFormat('EEEE, MMMM d, yyyy').format(date);
  }

  static String dateFormat(){
    return 'EEEE, MMMM d, yyyy';
  }

  static String dateToDB(date){
    return DateFormat('dd-MM-yyyy').format(date);
  }

  static String dateChildDB(date){
    return DateFormat('yyyyMMddhhmmss').format(date);
  }

  static bool getTimeCutOff(){
    DateFormat dateFormat = new DateFormat.Hm();
    DateTime now = DateTime.now();

    DateTime close = dateFormat.parse(SharedPreferenceUtils.timeCutOff);
    DateTime open = dateFormat.parse(DateFormat('hh:mm a').format(now));
    open = new DateTime(now.year, now.month, now.day, open.hour, open.minute);
    close = new DateTime(now.year, now.month, now.day, close.hour, close.minute);

    return open.isBefore(close);
  }
}