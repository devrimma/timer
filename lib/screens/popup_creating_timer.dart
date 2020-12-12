import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:timer/models/timer.dart';

class PopupTimer extends StatefulWidget {
  @override
  _PopupTimerState createState() => _PopupTimerState();
}

class _PopupTimerState extends State<PopupTimer> {

  String name;
  String time;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Таймер"),
      content: Container(
        child: Form(
          key: _formKey,
          child: Wrap(
            children: [
              TextFormField(
                autofocus: true,
                initialValue: '',
                decoration: InputDecoration(
                  labelText: "Название таймера",
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                validator: (val) {
                  return val.trim().isEmpty ? 'Название не должно быть пустым' : null;
                },
              ),
              TextFormField(
                autofocus: true,
                initialValue: '',
                decoration: InputDecoration(
                  labelText: "Время таймера",
                ),
                onChanged: (value) {
                  setState(() {
                    time = value;
                  });
                },
                validator: (val) {
                  return val.trim().isEmpty ? 'Время не должно быть пустым' : null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
            color: Colors.orange[400],
            textColor: Colors.white,
            child: Text("Принять"),
          onPressed: _validateAndSave,
        ),
        FlatButton(
            color: Colors.orange[400],
            textColor: Colors.white,
            child: Text("Отмена"),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    );
  }

  void _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      _onFormSubmit();
    } else {
      print('form is invalid');
    }
  }

  void _onFormSubmit() {
    Box<Timer> contactsBox = Hive.box<Timer>('box_for_timer');
    contactsBox.add(Timer(name: name, time: time));
    Navigator.of(context).pop();
  }
}
