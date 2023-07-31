import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/models/CategoryModel.dart';
import 'package:travel_app/ulitlise/app_data.dart';
import 'package:travel_app/models/Trip_model.dart';

import '../widgets/categories_card.dart';
import '../widgets/trip_card_widget.dart';

class CategoryTripsPage extends StatelessWidget {
  // CategoryModel cmm;
  static const pathCatgoryTripsPage = '/category-trips';

  final List<TripModel> tipeModelAfterFillter;

  CategoryTripsPage(this.tipeModelAfterFillter);

  @override
  Widget build(BuildContext context) {
    final routeArgument = ModalRoute.of(context)?.settings.arguments
        as Map<String, CategoryModel>;

    final catModel = routeArgument['ccmm'];

    String? title = catModel?.title;

    final FillterTrips = tipeModelAfterFillter.where((element) {
      return element.categories.contains(catModel?.id);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Center(
          child: Text(
            'الرحلة السياحية ($title)',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
      body: Container(
        height: 600,
        child: ListView.builder(
            //   FillterTrips
            itemCount: FillterTrips.length,
            itemBuilder: (context, index) {
              final tri = FillterTrips[index];
              return TripCardWidget(tri: tri);
            }),
      ),
    );
  }
}
