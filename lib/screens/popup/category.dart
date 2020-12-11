import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:timer/models/category.dart';

class CategoryPopup extends StatefulWidget {
  @override
  _CategoryPopupState createState() => _CategoryPopupState();
}

class _CategoryPopupState extends State<CategoryPopup> {
  String name;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Новая категория"),
      content: Container(
        child: Wrap(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                autofocus: true,
                initialValue: '',
                decoration: const InputDecoration(
                  labelText: 'Название категории',
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
            ),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
            color: Colors.orange[400],
            textColor: Colors.white,
            child: Text("Отмена"),
            onPressed: () {
              Navigator.pop(context);
            }),
        FlatButton(
            color: Colors.orange[400],
            textColor: Colors.white,
            child: Text("Добавить"),
            onPressed: _validateAndSave,
        ),
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
    Box<Category> contactsBox = Hive.box<Category>('box_for_category');
    contactsBox.add(Category(name: name));
    Navigator.of(context).pop();
  }
}
