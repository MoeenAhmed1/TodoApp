part of 'todo_bloc.dart';


abstract class TodoState {}

class TodoInitial extends TodoState {

}


class TodoLoading extends TodoState{}
class TodoLoaded extends TodoState{
  final List<Todo> todolist;


  TodoLoaded(this.todolist);
  List<Todo> get todoList=>todolist;
}
class TodoError extends TodoState{

}

