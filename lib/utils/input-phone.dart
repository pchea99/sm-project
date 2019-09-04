import 'package:flutter/material.dart';
import 'package:sm_app/res/font-size-res.dart';
import 'package:sm_app/utils/string-util.dart';

class InputPhone{
  static Widget buildTextField({
    TextEditingController controller,
    String label,
    bool isEnable
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 3.0,
              bottom: 2.0
            ),
            child: Text(
              label,
              style: TextStyle(
                  fontSize: FontSizeRes.normal
              ),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: controller,
            enabled: isEnable == null || !StringUtil.getTimeCutOff() ? false : isEnable,
            style: TextStyle(
                fontSize: FontSizeRes.normal
            ),
            decoration: InputDecoration(
              labelStyle: TextStyle(
                  fontSize: FontSizeRes.normal
              ),
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 15.0, horizontal: 8.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}