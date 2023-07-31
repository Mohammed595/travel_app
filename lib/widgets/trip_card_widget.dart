


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/detsils_trip_page.dart';

import '../models/Trip_model.dart';

class TripCardWidget extends StatelessWidget {
  const TripCardWidget({
    super.key,
    required this.tri,
  });

  final TripModel tri;

  @override
  Widget build(BuildContext context) {

    Widget activeMethod(String tit, IconData iconn) {
      return Row(
        children: [
          Text(tit),
          SizedBox(
            width: 5,
          ),
          Icon(
            iconn,
            color: Colors.deepOrangeAccent,
          ),
        ],
      );
    }

    String seasonText() {
      if (tri.season == Season.Winter) {
        return 'شتاء';
      }
      if (tri.season == Season.Spring) {
        return 'ربيع';
      }
      if (tri.season == Season.Autumn) {
        return 'خريف';
      }
      if (tri.season == Season.Summer) {
        return 'صيف';
      }
      return 'غير محدد';
    }


    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, DetsilsTripPage.pathDetsilsTripPage, arguments: {
          'trip' : tri,
        }).then((value) {
          TripModel? trr = value as TripModel? ;
          print(value?.title);
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
          elevation: 5,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      tri.imageUrl,
                      fit: BoxFit.cover,
                      height: 250,
                      width: double.infinity,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        ),

                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0),
                              Colors.black.withOpacity(0.3)
                            ])),

                    height: 250,
                    width: double.infinity,
                    alignment: Alignment.bottomRight,
                    child: Text(
                      tri.title,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    activeMethod(tri.title, Icons.subtitles),
                    activeMethod('يوم ' + tri.duration.toString(),
                        CupertinoIcons.calendar_badge_minus),
                    activeMethod(seasonText(),
                        CupertinoIcons.sun_haze_fill),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}