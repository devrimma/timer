import 'package:flutter/material.dart';

import 'package:timer/screens/category_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // Future<Null> refreshCategories() async {
  //   await Future.delayed(Duration(seconds: 2));
  // } ДОРАБОТАТЬ

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryList(),
    );
  }
}
