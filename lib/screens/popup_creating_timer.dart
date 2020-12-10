import 'package:flutter/material.dart';

class PopupTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController myController1 = TextEditingController();
    TextEditingController myController2 = TextEditingController();

    return AlertDialog(
      title: const Text("Таймер"),
      content: Container(
        child: Wrap(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Название таймера",
              ),
              controller: myController1,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Время таймера",
              ),
              controller: myController2,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
            color: Colors.orange[400],
            textColor: Colors.white,
            child: Text("Принять"),
            onPressed: () {
              Navigator.pop(context);
            }),
        FlatButton(
            color: Colors.orange[400],
            textColor: Colors.white,
            child: Text("Отмена"),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
      // content: SizedBox(
      //   child: Column(
      //     children: <Widget>[
      //       Row(
      //         children: [
      //           Text("Название таймера"),
      //           Expanded(
      //             flex: 1,
      //             child: TextField(
      //               controller: myController,
      //             ),
      //           ),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           Text("Время таймера"),
      //           Expanded(
      //             flex: 1,
      //             child: TextField(
      //               controller: myController,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // )
    );
  }
}
