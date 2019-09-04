import 'package:flutter/material.dart';

class ContainerForm{
  static Widget buildContainForm(Widget widget){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey[50]),
            borderRadius: BorderRadius.all(Radius.circular(8.0))
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            bottom: 8.0
          ),
          child: widget,
        ),
      ),
    );
  }
}