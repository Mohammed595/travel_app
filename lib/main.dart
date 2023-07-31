import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_app/models/Trip_model.dart';
import 'package:travel_app/screens/Fillter_page.dart';
import 'package:travel_app/screens/categories_screen.dart';
import 'package:travel_app/screens/category_trips_page.dart';
import 'package:travel_app/screens/detsils_trip_page.dart';
import 'package:travel_app/screens/favetory_page.dart';
import 'package:travel_app/screens/tab_top_page.dart';
import 'package:travel_app/ulitlise/app_data.dart';

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  List<TripModel> _availableTrip = Trips_data;
  List <TripModel> _favortyList = [] ;

  Map<String, bool> _filltersMap = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  void _fillterMethodInMain(Map<String, bool> fillterData) {
    setState(() {
      // get trips from switch title and set it in the values
      _filltersMap = fillterData;

      _availableTrip = Trips_data.where((element) {
        if (_filltersMap['summer'] == true && element.isInSummer != true) {
          return false;
        }
        if (_filltersMap['winter'] == true && element.isInWinter != true) {
          return false;
        }
        if (_filltersMap['family'] == true && element.isForFamilies != true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _moveTripToFavorty (String id) {

    final indexing = _favortyList.indexWhere((element) => element.id == id) ;

    if (indexing >= 0) {
      // setState(() {
      //   _favortyList.removeAt(indexing);
      // });
    }else {
      setState(() {
        _favortyList.add(Trips_data.firstWhere((element) => element.id == id )) ;
      });
    }

  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AR'), // arabic
        Locale('en', 'EN'), // arabic
      ],
      title: 'hgvv vv',
      theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.deepOrangeAccent,
          fontFamily: 'Amiri',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline5: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontFamily: 'Amiri',
                    fontWeight: FontWeight.bold),
              )),
      // home: CategoriesScreen(),
      initialRoute: BottomTabPage.PathTopTabPage,
      routes: {
        CategoriesScreen.PathCategoriesScreen: (context) => CategoriesScreen(),
        CategoryTripsPage.pathCatgoryTripsPage: (context) =>
            CategoryTripsPage(_availableTrip),
        BottomTabPage.PathTopTabPage: (context) => BottomTabPage(_favortyList),
        DetsilsTripPage.pathDetsilsTripPage: (context) => DetsilsTripPage(_moveTripToFavorty),
        FillterPage.pathFillterPage: (context) =>
            FillterPage(_fillterMethodInMain, _filltersMap),
      },
    );
  }
}
