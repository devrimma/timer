import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timer/models/category.dart';
import 'package:timer/screens/popup/category.dart';
import 'package:timer/screens/timer_list.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Switch(
            activeColor: Colors.orange[400],
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                print(isSwitched);
              });
            },)
        ],
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
        child: ValueListenableBuilder(
          valueListenable: Hive.box<Category>('box_for_category').listenable(),
          builder: (context, Box<Category> box, _) {
            if (box.values.isEmpty)
              return Center(
                child: Text("нет категорий"),
              );
            return GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                box.values.length,
                (index) => Card(
                  color: Color(0xFFe0e0e0),
                  child: InkWell(
                    highlightColor: Colors.orange[200],
                    splashColor: Colors.orange[400],
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) =>
                          TimerList(category: box.getAt(index),)));
                    },
                    onDoubleTap: () {
                      print('statistic');
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Center(child: Text(box.getAt(index).name)),
                          actions: <Widget>[
                            FlatButton(
                                color: Colors.orange[400],
                                textColor: Colors.white,
                                child: Text("Закрыть"),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.cancel_outlined),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      title: Text("Удалить ${box.getAt(index).name}?"),
                                      actions: <Widget>[
                                        FlatButton(
                                            color: Colors.orange[400],
                                            textColor: Colors.white,
                                            child: Text("Нет"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            }),
                                        FlatButton(
                                            color: Colors.orange[400],
                                            textColor: Colors.white,
                                            child: Text("Да"),
                                            onPressed: () {
                                              box.getAt(index).delete();
                                              Navigator.pop(context);
                                            }),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 0, bottom: 0, top: 100),
                            child: Text(
                              box.getAt(index).name,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[400],
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => CategoryPopup(),
          );
        },
      ),
    );
  }
}
