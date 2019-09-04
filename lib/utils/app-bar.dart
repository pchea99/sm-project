import 'package:flutter/material.dart';
import 'package:sm_app/res/font-size-res.dart';

class AppBarUtil extends StatefulWidget {
  final String title;
  final List<Widget> actions;
  final Widget layout;
  final scaffoldKey;

  AppBarUtil({
    this.title,
    this.actions,
    this.layout,
    this.scaffoldKey
  });

  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBarUtil> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: FontSizeRes.title
          ),
        ),
        actions: widget.actions,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: onPressed
        ),
      ),
      body: Container(
        child: widget.layout,
      ),
    );
  }

  void onPressed(){
    Navigator.pop(context);
  }
}

