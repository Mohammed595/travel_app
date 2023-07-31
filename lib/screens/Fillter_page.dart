import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/widgets/drawer_item_app.dart';

class FillterPage extends StatefulWidget {
  static const pathFillterPage = '/pathFillterPage';

// or> VoidCallback
  final Function _fillterMethodInFillterClassSave;

  final Map<String, bool> _currentFillterState;

  FillterPage(this._fillterMethodInFillterClassSave, this._currentFillterState);

  @override
  State<FillterPage> createState() => _FillterPageState();
}

class _FillterPageState extends State<FillterPage> {
  var _isInSummer = false;
  var _isInWinter = false;
  var _isForFamily = false;

  @override
  void initState() {
    _isInSummer = widget._currentFillterState['summer']!;
    _isInWinter = widget._currentFillterState['winter']!;
    _isForFamily = widget._currentFillterState['family']!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفلترة'),
        actions: [
          IconButton(
              onPressed: () {
                final filltersOnPress = {
                  'summer': _isInSummer,
                  'winter': _isInWinter,
                  'family': _isForFamily,
                };
                widget._fillterMethodInFillterClassSave(filltersOnPress);
              },
              icon: Icon(Icons.save))
        ],
      ),
      endDrawer: DrawerItemApp(),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          buildFillterSwichMethod(
              'الرحلات الصيفية', 'اظهار رحلات فصل الصيف فقط', _isInSummer,
              (bool val) {
            setState(() {
              _isInSummer = val;
            });
          }),
          SizedBox(
            height: 10,
          ),
          buildFillterSwichMethod(
              'الرحلات الشتوية', 'اظهار رحلات فصل الشتاء فقط', _isInWinter,
              (bool vall) {
            setState(() {
              _isInWinter = vall;
            });
          }),
          SizedBox(
            height: 10,
          ),
          buildFillterSwichMethod(
              'الرحلات العائلية', 'اظهار الرحلات العائلية فقط', _isForFamily,
              (bool vall) {
            setState(() {
              _isForFamily = vall;
            });
          }),
        ],
      ),
    );
  }

  Widget buildFillterSwichMethod(
      String title, String subTilte, bool state, Function(bool x) func) {
    return Container(
        child: SwitchListTile(
      title: Text(title),
      subtitle: Text(subTilte),
      value: state,
      onChanged: func,
    ));
  }
}
