import 'package:flutter/cupertino.dart';

class myTitle extends StatelessWidget {
  const myTitle({
    super.key,
    required this.title,
    required this.sizeFFont,
    required this.colorData,
  });

  final String title;
  final double sizeFFont;
  final Color colorData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        alignment: Alignment.bottomRight,
        child: Text(title,
          style: TextStyle(
              fontSize: sizeFFont,
              fontWeight: FontWeight.bold,
              color: colorData
          ),),
      ),
    );
  }
}