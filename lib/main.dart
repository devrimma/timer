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
    Category(name: "Другое"),
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
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
                category.length,
                (index) => Center(
                      child: Container(
                        height: 80,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.orange[400],
                        ),
                        padding: const EdgeInsets.all(30),
                        child: Text("${category[index].name}"),
                      ),
                    )),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.orange[400],
          onPressed: () {
            print("Добавить");
          },
        ),
      ),
    );
  }
}
