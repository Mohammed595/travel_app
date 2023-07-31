import 'package:flutter/cupertino.dart';
import 'package:travel_app/widgets/trip_card_widget.dart';

import '../models/Trip_model.dart';

class FavitoryPage extends StatelessWidget {
  static const pathFavitoryPage = '/pathFavitoryPage';

  // const FavitoryPage({Key? key}) : super(key: key);

  List<TripModel> tripModelFav;

  FavitoryPage(this.tripModelFav);

  @override
  Widget build(BuildContext context) {
    if (tripModelFav.isEmpty) {
      return Center(
        child: Text('قائمة المفضلة فارغة'),
      );
    } else {
      return Container(
        height: 500,
        child: ListView.builder(
            itemCount: tripModelFav.length,
            itemBuilder: (con, ind) {
              return TripCardWidget(tri: tripModelFav[ind]);
            }),
      );
    }
  }
}
