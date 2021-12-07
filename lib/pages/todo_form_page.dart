import 'package:flutter/material.dart';
import 'package:todo_app/Bloc/todo_bloc.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/repository/todo_repository.dart';
class TodoFormPage extends StatefulWidget {
  const TodoFormPage({Key? key}) : super(key: key);

  @override
  _TodoFormPageState createState() => _TodoFormPageState();
}

class _TodoFormPageState extends State<TodoFormPage> {
  TodoRepository repo=TodoRepository();
  final titleController = TextEditingController();
  final descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo form"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Enter Title',
            ),
              keyboardType: TextInputType.multiline,
              maxLines: null
          ),
          const SizedBox(height: 20,),
          TextField(
            controller: descController,
            decoration: const InputDecoration(
              hintText: 'Enter Description',
            ),
              keyboardType: TextInputType.multiline,
              maxLines: null
          ),
          const SizedBox(height: 10,),
          FloatingActionButton(
            child: Text("Add"),
            onPressed:(){
              final bloc=TodoBloc(repo);
              Todo todo=Todo(titleController.text,descController.text);
              bloc.add(AddEvent(todo));
              Navigator.pop(context);

            },
          )

        ],
      ),
    );
  }
}
