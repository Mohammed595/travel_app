import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/Fillter_page.dart';
import '../screens/tab_top_page.dart';

class DrawerItemApp extends StatelessWidget {
  const DrawerItemApp({
    super.key,


  });


  Widget buildListTileInDrawer(String title, IconData iconData, Function() onTapLink) {
    return ListTile(
            onTap: onTapLink,
            leading: Icon(
              iconData,
              size: 30,
              color: Colors.indigo,
            ),
            title: Text (title, style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
              fontSize: 20
            ),),
          );
  }



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 85,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'الخيارات',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            alignment: Alignment.center,
          ),

          buildListTileInDrawer('الرحلات', Icons.card_travel_outlined, (){
            Navigator.of(context).pushReplacementNamed(BottomTabPage.PathTopTabPage);
          }),
          buildListTileInDrawer('الفلترة', Icons.filter_list_alt, (){
            Navigator.of(context).pushReplacementNamed(FillterPage.pathFillterPage);
          })
        ],
      ),
      backgroundColor: Theme.of(context).canvasColor,
      width: MediaQuery.of(context).size.width * 0.7,
    );
  }
}