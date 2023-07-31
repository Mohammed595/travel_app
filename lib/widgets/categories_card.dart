import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/category_trips_page.dart';
import '../models/CategoryModel.dart';
import '../screens/favetory_page.dart';

class CatgoryCard extends StatelessWidget {
  final CategoryModel cm;

  const CatgoryCard({super.key, required this.cm});

  @override
  Widget build(BuildContext context) {
    String x = 'hi';
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CategoryTripsPage.pathCatgoryTripsPage, arguments: {
          'ccmm' : cm
        });
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: NetworkImage(cm.imageUrl),
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              cm.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15)),
          ),
        ],
      ),
    );
  }
}
