import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:timer/constans.dart';
import 'package:timer/models/category.dart';
import 'package:timer/models/timer.dart';
import 'package:timer/screens/popup/timer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timer/widgets/buttons.dart';

class TimerList extends StatelessWidget {
  TimerList({Key key, this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        centerTitle: true,
        backgroundColor: textColor,
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
                  valueListenable: Hive.box<Timer>(boxT).listenable(),
                  builder: (context, Box<Timer> box, _) {
                    final items = box.values
                        .where((item) => item.categoryId == category.key)
                        .toList();

                    if (items.isEmpty)
                      return Center(
                        child: Text("нет таймеров"),
                      );
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 10.0,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 10,
                                child: ListTile(
                                  title: Text(items[index].name),
                                  subtitle: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5.0),
                                        child: Icon(
                                          Icons.access_time_rounded,
                                          size: 20.0,
                                        ),
                                      ),
                                      Text(items[index].time.toString()),
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
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            PopupTimer(
                                              category: category,
                                              timer: items[index],
                                              index: index,
                                            ),
                                      );
                                    }),
                              ),
                              Expanded(
                                flex: 2,
                                child: IconButton(
                                    icon: Icon(Icons.cancel_outlined),
                                    onPressed: () {
                                      print("Удалить");
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: Text(
                                              "Удалить ${items[index].name}?"),
                                          actions: <Widget>[
                                            customFlB("Нет", () {
                                              Navigator.pop(context);
                                            }),
                                            customFlB("Да", () {
                                              box.getAt(index).delete();
                                              Navigator.pop(context);
                                            })
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: textColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => PopupTimer(
              category: category,
            ),
          );
        },
      ),
    );
  }
}
