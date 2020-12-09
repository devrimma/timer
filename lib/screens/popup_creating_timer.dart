import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PopupTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Popup example'),
    content: new Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Text("Hello"),
    ]
    ,
    ));
  }
}
