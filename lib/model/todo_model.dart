import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'todo_model.g.dart';
@HiveType(typeId: 0)
class Todo{
  @HiveField(0)
  final String title;
  
  @HiveField(1)
  final String description;

  Todo(this.title,this.description);
}