import 'package:flutter/material.dart';

class TimerList extends StatefulWidget {
  @override
  _TimerListState createState() => _TimerListState();
}

class _TimerListState extends State<TimerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Категория"),
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
            Card(
              elevation: 10.0,
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: ListTile(
                      title: Text("Название таймера"),
                      subtitle: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Icon(
                              Icons.access_time_rounded,
                              size: 20.0,
                            ),
                          ),
                          Text("00:00"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(Icons.stop_circle_outlined),
                        onPressed: () {
                          print("Начать отсчет");
                        }),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(Icons.play_circle_fill),
                        onPressed: () {
                          print("Начать отсчет");
                        }),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          print("Редактировать");
                        }),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(Icons.cancel_outlined),
                        onPressed: () {
                          print("Удалить");
                        }),
                  ),
                ],
              ),
            ),
          ],
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
