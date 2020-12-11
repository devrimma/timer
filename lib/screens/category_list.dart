import 'package:flutter/material.dart';
import 'package:timer/classes/category_names.dart';
import 'package:timer/screens/timer_list.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  final List<Category> category = [
    Category(name: "Спорт", color: Color(0xFFFFE0B2)),
    Category(name: "Кулинария", color: Color(0xFFFFCC80)),
    Category(name: "Развитие", color: Color(0xFFFFB74D)),
    Category(name: "Работа", color: Color(0xFFFFA726)),
    Category(name: "Спорт", color: Color(0xFFFFE0B2)),
    Category(name: "Кулинария", color: Color(0xFFFFCC80)),
    Category(name: "Развитие", color: Color(0xFFFFB74D)),
    Category(name: "Работа", color: Color(0xFFFFA726)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TiriPuri",
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.orange[400],
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TimerList()),
                  );
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
