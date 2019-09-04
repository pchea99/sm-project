import 'dart:convert';

import 'package:sm_app/model_dto/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils{
  static User sharedUser;
  static String timeCutOff;

  static void setUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', json.encode(user.toJson()));
    sharedUser = user;
  }

  static Future getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = prefs.getString('user');
    if(userJson == null){
      return null;
    }

    sharedUser = User.fromJson(json.decode(userJson));
    return sharedUser;
  }

  static void clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static bool isTeamLeader(){
    return sharedUser.position.trim().toLowerCase() == 'teamleader' ||
        sharedUser.position.trim().toLowerCase() == 'team leader';
  }

  static bool isAgent(){
    return sharedUser.position.trim().toLowerCase() == 'agent';
  }
}