import 'package:flutter/material.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/string-util.dart';

class ButtonSave{
  static Widget buttonSave(VoidCallback callback){
    return FlatButton(
        onPressed: StringUtil.getTimeCutOff() ? callback : null,
        child: Text(
          StringRes.save,
          style: TextStyle(
            color: Colors.white
          ),
        )
    );
  }
}