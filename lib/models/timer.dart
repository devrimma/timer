import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'timer.g.dart';

@HiveType(typeId: 0)
class Timer extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String time;

  Timer({@required this.name, this.time});
}