import 'package:flutter/material.dart';
import 'package:sm_app/res/font-size-res.dart';
import 'package:sm_app/utils/string-util.dart';

class SelectValue{
  static Widget selectView({
    String label,
    String value,
    VoidCallback callback,
    bool isEnable,
    Color color
  }){
    return InkWell(
      onTap: (isEnable == null || isEnable) && StringUtil.getTimeCutOff() ? callback : null,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black45),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: color
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            top: 12.0,
            bottom: 12.0
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                      fontSize: FontSizeRes.normal
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  value == null ? "" : value,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: FontSizeRes.normal
                  ),
                ),
              ),
              Icon(
                Icons.navigate_next,
                color: Colors.black45,
              )
            ],
          )
        ),
      ),
    );
  }
}