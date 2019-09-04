import 'package:flutter/material.dart';
import 'package:sm_app/utils/app-bar.dart';

class SelectList extends StatefulWidget {
  final String title;
  final List items;
  final ValueChanged onSelected;

  SelectList({
    this.title,
    this.items,
    this.onSelected,
  });

  @override
  _SelectListState createState() => _SelectListState();
}

class _SelectListState extends State<SelectList> {
  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      title: widget.title,
      layout: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      itemBuilder: (context, index)=>
      Column(
        children: widget.items.map((item)=>
            Card(
              child: ListTile(
                title: item,
              ),
            ),
        ).toList(),
      ),
      itemCount: widget.items.length,
    );
  }
}
