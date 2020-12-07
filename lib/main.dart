import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    Category(name: "Спорт", color: "0xFFe0e0e0"),
    Category(name: "Кулинария", color: "0xFFb3b3b3"),
    Category(name: "Развитие", color: "0xFF808080"),
    Category(name: "Работа", color: "0xFF4d4d4d"),
    Category(name: "Другое", color: "0xFF262626"),
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
              (index) => Card(
                color: Colors.orange[400],
                child: InkWell(
                  splashColor: Colors.red,
                  onTap: () {},
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                icon: Icon(Icons.cancel_outlined),
                                onPressed: () {},
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment(-1.0,.0),
                          child: Text("${category[index].name}",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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
