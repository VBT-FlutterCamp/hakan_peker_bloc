import '../model/todo_model.dart';

abstract class TodosState {}

class TodosInitial extends TodosState {}

class TodosLoading extends TodosState {
  TodosLoading();
}

class TodosCompleted extends TodosState {
  final List<TodoModel>? items;

  TodosCompleted(this.items);
}

class TodosErrorState extends TodosState {}
