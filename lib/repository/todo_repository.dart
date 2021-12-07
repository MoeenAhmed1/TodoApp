import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/model/todo_model.dart';
class TodoRepository{
  void addTodo(Todo todo)
  {
    final box=Hive.box<Todo>("todos");
    box.add(todo);

  }
  void deleteTodo(int index)
  {
    final box=Hive.box<Todo>("todos");
    box.deleteAt(index);
  }
  Todo? getTodo(int index)
  {
    final box=Hive.box<Todo>("todos");
    return box.getAt(index);
  }
  Box<Todo> getBox()
  {
    return Hive.box<Todo>("todos");
  }
  List<Todo> getTodoslist()
  {
    return getBox().values.toList().cast<Todo>();
  }

}