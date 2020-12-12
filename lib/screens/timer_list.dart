import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:timer/models/category.dart';
import 'package:timer/models/timer.dart';
import 'package:timer/screens/popup_creating_timer.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TimerList extends StatelessWidget {
  TimerList({Key key, this.category}) : super(key: key);

  final Category category;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        centerTitle: true,
        backgroundColor: Colors.orange[400],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 12.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Icon(
                      Icons.timer_outlined,
                      size: 30.0,
                    ),
                  ),
                  Text(
                    "00:00",
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ValueListenableBuilder(
                  valueListenable: Hive.box<Timer>('box_for_timer').listenable(),
                  builder: (context, Box<Timer> box, _) {
                    if (box.values.isEmpty)
                      return Center(
                        child: Text("нет таймеров"),
                      );
                    return Card(
                      elevation: 10.0,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: ListTile(
                              title: Text(box.name),
                              subtitle: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Icon(
                                      Icons.access_time_rounded,
                                      size: 20.0,
                                    ),
                                  ),
                                  // Text(box.),
                                ],
                              ),
                              onTap: () {},
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                                icon: Icon(Icons.stop_circle_outlined),
                                onPressed: () {
                                  print("Стоп");
                                }),
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                                icon: Icon(Icons.play_circle_fill),
                                onPressed: () {
                                  print("Начать отсчет");
                                }),
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  print("Редактировать");
                                }),
                          ),
                          Expanded(
                            flex: 2,
                            child: IconButton(
                                icon: Icon(Icons.cancel_outlined),
                                onPressed: () {
                                  print("Удалить");
                                }),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orange[400],
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => PopupTimer(),
          );
        },
      ),
    );
  }
}