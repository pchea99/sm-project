import 'package:flutter/material.dart';

class NavigateTo{
  static Future navigateTo({BuildContext context, Widget route}) async {
    var callback = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => route),
    );

    return callback;
  }
}