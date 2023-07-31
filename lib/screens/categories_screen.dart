import 'package:flutter/material.dart';
import 'package:travel_app/widgets/categories_card.dart';

import '../ulitlise/app_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const PathCategoriesScreen ='PathCategoriesScreen';
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(15.0),
          child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                // هنا تحدد مكان كل قريد فيو بالشاشة
                maxCrossAxisExtent: 200,
                // هنا راح يتم عرض 200 بكيسل من مقاسل الشاشة ولو مثلا الشاشة 300 يعرض عمود اذا 500 يعرض عمودين
                childAspectRatio: 7 / 8,
                // هذا يحدد طول الارتفاع بالنسبة للعرض مثلا واجد ع ثنين يعني العرض يساوي نصف الطول
                mainAxisSpacing: 10,
                // الفراعات بين العناصر بشكل افقي
                crossAxisSpacing: 10, // الفراغات بين العناصر بشكل عمودي
              ),
              children: categories_data.map((elment_categoryData) => CatgoryCard(
                        cm: elment_categoryData,
                      ))
                  .toList()),
        );
  }
}
