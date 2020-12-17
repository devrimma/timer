import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timer/constans.dart';
import 'package:timer/models/category.dart';
import 'package:timer/models/timer.dart';
import 'package:timer/screens/category_list.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryAdapter());
  await Hive.openBox<Category>(boxC);

  Hive.registerAdapter(TimerAdapter());
  await Hive.openBox<Timer>(boxT);

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
      theme: ThemeData(
        textTheme: GoogleFonts.syncopateTextTheme(),
      ),
      home: CategoryList(),
    );
  }
}
