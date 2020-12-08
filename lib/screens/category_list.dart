import 'package:flutter/material.dart';
import 'package:timer/classes/category_names.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  final List<Category> category = [
    Category(name: "Спорт", color: Color(0xFFe0e0e0)),
    Category(name: "Кулинария", color: Color(0xFFb3b3b3)),
    Category(name: "Развитие", color: Color(0xFF808080)),
    Category(name: "Работа", color: Color(0xFF4d4d4d)),
    Category(name: "Другое", color: Color(0xFF262626)),
    Category(name: "Спорт", color: Color(0xFFe0e0e0)),
    Category(name: "Кулинария", color: Color(0xFFb3b3b3)),
    Category(name: "Развитие", color: Color(0xFF808080)),
    Category(name: "Работа", color: Color(0xFF4d4d4d)),
    Category(name: "Другое", color: Color(0xFF262626)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TiriPuri",
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            category.length,
                (index) => Card(
              color: category[index].color,
              child: InkWell(
                splashColor: Colors.red,
                onTap: () {
                  print('tap');
                },
                onDoubleTap: () {
                  print('statistic');
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: Icon(Icons.cancel_outlined),
                            onPressed: () {
                              print('delete');
                            },
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 0, bottom: 0, top: 100),
                        child: Text(
                          category[index].name,
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
    );
  }
}
