
import 'package:flutter/material.dart';
import 'package:timer/classes/timer_names.dart';
import 'package:timer/screens/popup_creating_timer.dart';

class TimerList extends StatelessWidget {

  final List<TimerNames> timers = [
    TimerNames(name: "Таймер 1", time: "20:00"),
    TimerNames(name: "Таймер 2", time: "10:00"),
    TimerNames(name: "Таймер 3", time: "25:00"),
    TimerNames(name: "Таймер 4", time: "13:00"),
    TimerNames(name: "Таймер 5", time: "5:00"),
    TimerNames(name: "Таймер 6", time: "1:00"),
    TimerNames(name: "Таймер 7", time: "22:00"),
    TimerNames(name: "Таймер 1", time: "20:00"),
    TimerNames(name: "Таймер 2", time: "10:00"),
    TimerNames(name: "Таймер 3", time: "25:00"),
    TimerNames(name: "Таймер 4", time: "13:00"),
    TimerNames(name: "Таймер 5", time: "5:00"),
    TimerNames(name: "Таймер 6", time: "1:00"),
    TimerNames(name: "Таймер 7", time: "22:00"),
  ];

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
            Expanded(
              flex: 1,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: timers.length,
                  itemBuilder: (_, index) {
                    return Card(
                      elevation: 10.0,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: ListTile(
                              title: Text(timers[index].name),
                              subtitle: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Icon(
                                      Icons.access_time_rounded,
                                      size: 20.0,
                                    ),
                                  ),
                                  Text(timers[index].time),
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