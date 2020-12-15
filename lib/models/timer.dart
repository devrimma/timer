import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'timer.g.dart';

@HiveType(typeId: 1)
class Timer extends HiveObject {
  @HiveField(0)
  final int categoryId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int time;

  Timer({@required this.categoryId, @required this.name, this.time});
}