import 'package:flutter/material.dart';
import 'package:flutter_bloc_hw1/feature/todo/view/todo_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: TodosView()
    );
  }
}