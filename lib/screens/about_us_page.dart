import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('من نحن')),
      ),
      body: Container(
        child: Center(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: NetworkImage(
                      // image uoh from internet
                      'https://www.marefa.org/w/images/3/3b/Uoh.edu.jpg'),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.indigo.shade300, width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.only(left: 40, right: 40, bottom: 12),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Reail login',
                        hintStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        )),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.indigo.shade300, width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.only(left: 40, right: 40, bottom: 12),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Corporate login',
                        hintStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(
                          Icons.group,
                          color: Colors.black,
                        )),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.indigo.shade300, width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.only(left: 40, right: 40, bottom: 12),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Contect us',
                        hintStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        )),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.indigo.shade300, width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.only(left: 40, right: 40, bottom: 12),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'FAQ\'s',
                        hintStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(
                          Icons.question_mark,
                          color: Colors.black,
                        )),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text('Cobyright MB 2023 all rights reserved - UOH unv of hail')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
