import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timer/models/category.dart';
import 'package:timer/models/timer.dart';
import 'package:timer/screens/category_list.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryAdapter());
  await Hive.openBox<Category>('box_for_category');

  Hive.registerAdapter(TimerAdapter());
  await Hive.openBox<Timer>('box_for_timer');

  //for test
  var box = await Hive.openBox('testBox');
  print(box.get('theme', defaultValue: 'light'));

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    // TODO: implement dispose
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryList(),
    );
  }
}