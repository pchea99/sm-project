import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sm_app/res/font-size-res.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/string-util.dart';

class DatePicker {
  static Widget datePicker(ValueChanged onSelectedDate){
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: DateTimePickerFormField(
        resetIcon: null,
        initialValue: new DateTime.now(),
        inputType: InputType.date,
        format: DateFormat(StringUtil.dateFormat()),
        editable: false,
        decoration: InputDecoration(
          labelText: StringRes.date,
          labelStyle: TextStyle(
              fontSize: FontSizeRes.normal
          ),
          contentPadding: const EdgeInsets.symmetric(
              vertical: 15.0, horizontal: 8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onChanged: onSelectedDate,
      ),
    );
  }
}

