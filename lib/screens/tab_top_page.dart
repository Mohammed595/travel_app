import 'package:flutter/material.dart';
import 'package:travel_app/screens/about_us_page.dart';
import 'package:travel_app/screens/categories_screen.dart';

import '../models/Trip_model.dart';
import '../widgets/drawer_item_app.dart';
import 'favetory_page.dart';

class BottomTabPage extends StatefulWidget {
  static const PathTopTabPage = '/topTabPath';

  // const BottomTabPage({Key? key}) : super(key: key);

  List<TripModel> tripModelFavList;
  BottomTabPage(this.tripModelFavList);

  @override
  State<BottomTabPage> createState() => _BottomTabPageState();
}

class _BottomTabPageState extends State<BottomTabPage> {
  List<Map<String, Object>> pagesList = [];
  int _indexVarPages = 0;

  void selectBottobBar(int ind) {
    setState(() {
      _indexVarPages = ind;
    });
  }

  @override
  void initState() {
    pagesList = [
      {'screen': CategoriesScreen(), 'title': 'الصفحة الرئيسية'},
      {'screen': FavitoryPage(widget.tripModelFavList), 'title': 'المفضلة'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AboutUsPage()));
        },
        child: Icon(Icons.question_answer),
      ),
      ////////////////
      drawer: DrawerItemApp(),
      ////////////////
      appBar: AppBar(
        title:
            Center(child: Text(pagesList[_indexVarPages]['title'] as String)),
      ),

      body: pagesList[_indexVarPages]['screen'] as Widget,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexVarPages,
        unselectedFontSize: 13,
        selectedFontSize: 17,
        showUnselectedLabels: false,
        onTap: selectBottobBar,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favitory'),
        ],
      ),
    );
  }
}
