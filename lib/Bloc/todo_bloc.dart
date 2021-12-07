import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/repository/todo_repository.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;
  TodoBloc(this.repository) : super(TodoInitial() ) {

    on<GetEvent>((event, emit) {
      emit(TodoLoading());
      final list=repository.getTodoslist();
      emit(TodoLoaded(list));
    });

    on<AddEvent>((event, emit) {
      repository.addTodo(event.todo);
      emit(TodoLoading());
    });

    on<DeleteEvent>((event, emit) {
      repository.deleteTodo(event.data);
      emit(TodoLoading());
    });

  }

}
