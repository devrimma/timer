import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:timer/models/category.dart';
import 'package:timer/models/timer.dart';

import 'package:flutter/cupertino.dart';
import 'package:timer/widgets/buttons.dart';

class PopupTimer extends StatefulWidget {
  PopupTimer({Key key, this.category, this.timer, this.index}) : super(key: key);

  final Category category;
  final Timer timer;
  final int index;

  @override
  _PopupTimerState createState() => _PopupTimerState();
}

class _PopupTimerState extends State<PopupTimer> {
  String name;
  int time;
  final _formKey = GlobalKey<FormState>();

  bool isTimer() {
    return (widget.timer != null) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.isTimer() ? "Редактировать таймер" : "Создать таймер"),
      content: Container(
        child: Form(
          key: _formKey,
          child: Wrap(
            children: [
              TextFormField(
                autofocus: true,
                initialValue: this.isTimer() ? widget.timer.name : "",
                decoration: InputDecoration(
                  labelText: "Название таймера",
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                validator: (val) {
                  return val.trim().isEmpty
                      ? 'Название не должно быть пустым'
                      : null;
                },
              ),
              TextFormField(
                autofocus: true,
                initialValue: '00:00',
                decoration: InputDecoration(
                  labelText: "Время таймера",
                ),
                onChanged: (value) {
                  setState(() {
                    time = int.parse(value);
                  });
                },
                validator: (val) {
                  return val.trim().isEmpty
                      ? 'Время не должно быть пустым'
                      : null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        customFlB("Отмена", () {
          Navigator.pop(context);
        }),
        customFlB("Принять", _validateAndSave),
      ],
    );
  }

  void _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      this.isTimer() ? _onFormEdit() : _onFormSubmit();
    } else {
      print('form is invalid');
    }
  }

  void _onFormSubmit() {
    Box<Timer> contactsBox = Hive.box<Timer>('box_for_timer');
    contactsBox
        .add(Timer(categoryId: widget.category.key, name: name, time: time));
    Navigator.of(context).pop();
  }

  void _onFormEdit() {
    Box<Timer> contactsBox = Hive.box<Timer>('box_for_timer');
    contactsBox.putAt(widget.index, Timer(categoryId: widget.timer.categoryId, name: name));
    Navigator.of(context).pop();
  }

}
