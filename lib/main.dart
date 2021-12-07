import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/todo_list_page.dart';
import 'package:todo_app/repository/todo_repository.dart';

import 'Bloc/todo_bloc.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.registerAdapter<Todo>(TodoAdapter());
  await Hive.initFlutter(document.path);
  await Hive.openBox<Todo>("Todos");


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBloc>(
        create:(context)=>TodoBloc(TodoRepository()),
        child:  TodoListPage()
    );
  }

}
