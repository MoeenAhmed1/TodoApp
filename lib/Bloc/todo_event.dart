part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {

}
class AddEvent extends TodoEvent{
  final Todo todo;
  AddEvent(this.todo);
}
class DeleteEvent extends TodoEvent{
  final int data;
  DeleteEvent(this.data);
}
class GetEvent extends TodoEvent{

}