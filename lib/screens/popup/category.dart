import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:timer/constans.dart';
import 'package:timer/models/category.dart';
import 'package:timer/widgets/buttons.dart';

class CategoryPopup extends StatefulWidget {
  CategoryPopup({Key key, this.category, this.index}) : super(key: key);

  final Category category;
  final int index;

  @override
  _CategoryPopupState createState() => _CategoryPopupState();
}

class _CategoryPopupState extends State<CategoryPopup> {
  String name;
  final _formKey = GlobalKey<FormState>();

  bool isCategory() {
    return (widget.category != null) ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(isCategory() ? "Редактировать" : "Новая категория"),
      content: Container(
        child: Wrap(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                autofocus: true,
                initialValue: isCategory() ? widget.category.name : "",
                decoration: const InputDecoration(
                  labelText: 'Название категории',
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
            ),
          ],
        ),
      ),
      actions: <Widget>[
        customFlB("Отмена", () {
          Navigator.pop(context);
        }),
        customFlB("Добавить", _validateAndSave),
      ],
    );
  }

  void _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      isCategory() ? _onFormEdit() : _onFormSubmit();
    } else {
      print('form is invalid');
    }
  }

  void _onFormSubmit() {
    Box<Category> contactsBox = Hive.box<Category>(boxC);
    contactsBox.add(Category(name: name));
    Navigator.of(context).pop();
  }

  void _onFormEdit() {
    Box<Category> contactsBox = Hive.box<Category>(boxC);
    contactsBox.putAt(widget.index, Category(name: name));
    Navigator.of(context).pop();
  }

}
