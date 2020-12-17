import 'package:flutter/material.dart';
import 'package:timer/constans.dart';

FlatButton customFlB(String name, Function click) {
  return FlatButton(
    color: textColor,
    textColor: Colors.white,
    child: Text(name),
    onPressed: click,
  );
}
