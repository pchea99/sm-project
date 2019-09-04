import 'package:flutter/material.dart';
import 'package:sm_app/res/string-res.dart';
import 'package:sm_app/utils/app-bar.dart';

class ListViewProvince extends StatefulWidget {
  @override
  _ListViewProvinceState createState() => _ListViewProvinceState();
}

class _ListViewProvinceState extends State<ListViewProvince> {
  List _provinces = [
    'ភ្នំពេញ', 'បន្ទាយមានជ័យ',
    'បាត់ដំបង', 'កំពង់ចាម',
    'កំពង់ឆ្នាំង', 'កំពង់ស្ពឺ',
    'កំពង់ធំ', 'កំពត', 'កណ្តាល',
    'កោះកុង', 'កែប', 'ក្រចេះ', 'មណ្ឌលគីរី',
    'ឧត្តរមានជ័យ', 'ប៉ៃលិន', 'ព្រះសីហនុ',
    'ព្រះវិហារ', 'ពោធិសាត់', 'ព្រៃវែង',
    'រតនៈគីរី', 'សៀមរាប', 'ស្ទឹងត្រែង',
    'ស្វាយរៀង', 'តាកែវ', 'ត្បូងឃ្មុំ'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBarUtil(
      title: StringRes.listProvince,
      layout: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _buildForm(),
      ),
    );
  }

  Widget _buildCard(String name){
    return Card(
      child: ListTile(
        title: Text(name),
        onTap: (){
          Navigator.pop(context, name);
        },
      ),
      elevation: 8.0,
    );
  }

  Widget _buildForm() {
    return ListView(
      children: _provinces.map((province) =>
          _buildCard(province)
      ).toList(),
    );
  }
}