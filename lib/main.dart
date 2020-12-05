import 'package:flutter/material.dart';
import 'package:timer/classes/category_names.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Category> category = [
    Category(name: "Спорт"),
    Category(name: "Кулинария"),
    Category(name: "Развитие"),
    Category(name: "Работа"),
    Category(name: "Спорт"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Timer",
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange[400],
        ),
        body: Container(
          child: ListView.builder(
            itemCount: category.length,
            itemBuilder: (_, index) => Wrap(
              children: [ Row(
                // width: 200,
                // height: 150,
                // margin: EdgeInsets.all(30),
                // color: Colors.orange[400],
                children: [
                  Container( child: Text(
                    "${category[index].name}",
                    style: TextStyle(
                      fontSize: 26,
                    ),
                    ),
                ),
              ],
                ),
            ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.orange[400],
      // ),
    );
  }
}
