import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sm_app/login/login.dart';
import 'package:sm_app/menu/menu.dart';
import 'package:sm_app/network-service/network.dart';
import 'package:sm_app/utils/navigate-to.dart';
import 'package:sm_app/utils/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset('assets/havas_riverorchid_HRO_green.png'),
    );
  }

  @override
  void initState() {
    super.initState();
    _getTimeCutOff();
  }

  void _getTimeCutOff() async {
     await NetworkService.getTimeCutOff();
    _getUserLogin();
  }

  void _getUserLogin() async {
    SharedPreferenceUtils.sharedUser = await SharedPreferenceUtils.getUser();
    if(SharedPreferenceUtils.sharedUser != null){
      _navigateTo(Menu());
    }else{
      _navigateTo(Login());
    }
  }

  Future _navigateTo(Widget route) async {
    await NavigateTo.navigateTo(context: context, route: route);
    exit(0);
  }
}
