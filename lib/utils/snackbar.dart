import 'package:flutter/material.dart';
import 'package:sm_app/res/font-size-res.dart';

class SnackBarUtil{
  static void showInSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String value) {
    scaffoldKey.currentState
        .showSnackBar(
        SnackBar(
          content: ListTile(
            leading: Icon(Icons.warning, color: Colors.red),
            title: new Text(
                value,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: FontSizeRes.normal
                )
            ),
          ),
          backgroundColor: Colors.white,
        )
    );
  }
}