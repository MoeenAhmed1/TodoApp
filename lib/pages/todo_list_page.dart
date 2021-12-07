import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/Bloc/todo_bloc.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/pages/todo_form_page.dart';
import 'package:todo_app/repository/todo_repository.dart';
class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TodoRepository repo = TodoRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          context.read<TodoBloc>().add(GetEvent());
          return Column(
            children: [
              Expanded(
                  child: ValueListenableBuilder<Box<Todo>>(
                      valueListenable: repo.getBox().listenable(),
                      builder: (context, box, _) {
                        if(state is TodoLoading)
                          {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        if (state is TodoLoaded)
                        {

                          final todos = state.todolist;
                          return ListBuilder(todos);
                        }
                        return Scaffold();
                      }
                  )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () =>
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TodoFormPage()),
                        )
                ),
              ),

            ],
          );
        },
      ),
    );
  }
  Widget ListBuilder(List<Todo> todos)
  {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];

          return ListTile(
            title: Text(todo.title),
            subtitle: Text(todo.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    context.read<TodoBloc>().add(
                        DeleteEvent(index));
                  },
                )
              ],
            ),
          );
        }

    );
  }
}