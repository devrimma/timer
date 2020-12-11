import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:timer/models/category.dart';

class AddCategory extends StatefulWidget {
  final formKey = GlobalKey<FormState>();

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddCategory> {
  String name;
  String color;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
                    initialValue: '',
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    validator: (val) {
                      return val.trim().isEmpty
                          ? 'Name should not be empty'
                          : null;
                    },
                  ),
                  TextFormField(
                    initialValue: '',
                    decoration: const InputDecoration(
                      labelText: 'Color',
                    ),
                    onChanged: (value) {
                      setState(() {
                        color = value == null ? '' : value;
                      });
                    },
                  ),
                  OutlineButton(
                    child: Text('Добавить'),
                    onPressed: _validateAndSave,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
    contactsBox.add(Category(name: name, color: color));
    Navigator.of(context).pop();
  }
}