import 'package:flutter/material.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/string-util.dart';

class SelectBox{
  static Widget selectBox({
    int groupValue,
    ValueChanged<int> onChanged,
    String label,
    bool isEnable
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(8.0))
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 8.0,
              top: 1.0,
              bottom: 1.0,
              right: 8.0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(label),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(children: <Widget>[
                    new Radio(
                      value: 0,
                      groupValue: groupValue,
                      onChanged: (isEnable == null || isEnable) && StringUtil.getTimeCutOff() ? onChanged : null,
                    ),
                    Text(StringRes.yes),
                  ],),
                  Row(
                    children: <Widget>[
                      new Radio(
                        value: 1,
                        groupValue: groupValue,
                        onChanged: isEnable == null || isEnable ? onChanged : null,
                      ),
                      Text(StringRes.no)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}