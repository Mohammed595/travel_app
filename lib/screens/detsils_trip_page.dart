import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/models/Trip_model.dart';
import 'package:travel_app/ulitlise/app_data.dart';
import 'package:travel_app/widgets/card_activities_widget.dart';

import '../widgets/MyTitle.dart';
import '../widgets/card_programms_widget.dart';

class DetsilsTripPage extends StatefulWidget {
  static const pathDetsilsTripPage = '/detailsPage';

  // const DetsilsTripPage({Key? key}) : super(key: key);

  final Function moveTripToFavorty;
  DetsilsTripPage(this.moveTripToFavorty);

  @override
  State<DetsilsTripPage> createState() => _DetsilsTripPageState();
}

class _DetsilsTripPageState extends State<DetsilsTripPage> {
  @override
  Widget build(BuildContext context) {
    final triModel =
        ModalRoute.of(context)?.settings.arguments as Map<String, TripModel>;

    final tri = triModel['trip'];

    final fillterTripDate = Trips_data.where((element) {
      return element.title == tri?.title;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Details page'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: double.infinity,
        child: ListView.builder(
            itemCount: fillterTripDate.length,
            itemBuilder: (context, index) {
              final boo = fillterTripDate[index];
              return Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                        boo.imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.1),
                            ])),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  myTitle(
                    title: 'الأنشطة',
                    sizeFFont: 25,
                    colorData: Colors.deepPurple,
                  ),
                  cardActivitiesWidget(
                    context: context,
                    tri: boo,
                  ),
                  myTitle(
                    title: 'البرنامج اليومي',
                    sizeFFont: 25,
                    colorData: Colors.deepPurple,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: cardProgramsWidget(
                      context: context,
                      tri: boo,
                    ),
                  ),
                ],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget.moveTripToFavorty(tri!.id),
        child: Icon(Icons.star),
      ),
    );
  }
}
