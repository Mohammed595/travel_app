
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/models/Trip_model.dart';

class cardActivitiesWidget extends StatelessWidget {
  final TripModel tri ;

  cardActivitiesWidget({
    super.key,
    required this.tri,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, left: 20),
      child: Container(
        alignment: Alignment.topRight,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black38,width: 2)
        ),


        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.builder(
                itemCount: tri.activities.length,
                itemBuilder: (con, ind){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:[
                      Text( tri.activities[ind].toString()),
                      Divider(
                        color: Colors.black45,
                      )

                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}